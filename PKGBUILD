# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname=zephyr-sdk
pkgver=0.11.4
pkgrel=2
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64')
url="https://www.zephyrproject.org/"
license=('Apache')

# Some of these are dependencies of Zephyr RTOS, but instructions for Zephyr
# tell user to pip install, so let's add them here instead.  (See
# zephyr/scripts/requirements.txt in Zephyr distribution)
# Missing (not packaged for Arch): junit2html, canopen, sphinx-tabs
depends=('python-breathe>=4.9.1' 'python-docutils>=0.14'
         'python-pyaml>=5.1'
         'python-ply>=3.10' 'python-pip' 'python-setuptools' 'python-wheel'
         'python-pyelftools>=0.24' 'python-pyserial' 'python-pykwalify'
	 'python-pillow' 'python-anytree' 'python-intelhex' 'python-packaging' 
	 'python-progress' 'python-pyserial' 'python-cbor' 'python-psutil'
	 'python-pytest' 'python-mock>=4.0.1' 'python-colorama'
         'python-coverage' 'gcovr'
         'python-sphinx>=1.7.5' 'python-sphinx_rtd_theme'
	 'python-sphinxcontrib-svg2pdfconverter' 'python-tabulate'
	 'python-west>=0.7.2'
         'git-spindle' 'gitlint' 'ninja' 'gperf' 'gcovr' 'ccache'
         'doxygen' 'dfu-util' 'dtc' 'cmake>=3.8.2')
optdepends=('pyocd: programming and debugging ARM MCUs')
makedepends=('patchelf')
source=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}-setup.run"
        "zephyrrc"
        # PR 252
        0001-scripts-template_dir-don-t-let-y-override-no-rc.patch
        0002-scripts-template_dir-don-t-prompt-for-cmake-when-y-s.patch
        0003-scripts-template_dir-re-use-common-prompting-code.patch
        0004-scripts-template_dir-no-cmake-flag-for-CMake-module-.patch
)

options=(!strip)
install=$pkgname.install

_installdir=opt/zephyr-sdk
_setupsh=setup.sh

build() {
  cd "$srcdir"
}

# Matches per-toolchain commands in $_installdir/setup.sh
_TC_CMD="tar -C \\\$target_sdk_dir \\(-[A-Za-z0-9]\\+\\)* .\/__TC__.tar.bz2.*"

_list_toolchains() {
  echo $(sed -n "s@^$(echo $_TC_CMD | sed 's/__TC__/\\(.*\\)/g')@\2@p" $1 \
    | grep -v cmake | sort)
}

package ()
{
  cd "$srcdir"

  echo ">>> Tip: to avoid waiting for compression, build an uncompresed tar archive:"
  echo ">>>     PKGEXT='.pkg.tar' makepkg"
  echo

  mkdir -p $pkgdir/$_installdir
  echo ">>> Running installer...."
  sh zephyr-sdk-${pkgver}-setup.run --target $pkgdir/$_installdir --nochown --noexec --keep -- -d $pkgdir/$_installdir

  # Add a flag to not relocate executables, because the path to pkgdir is invalid after installation
  # -R disables relocation, -S saves the relocation script so that it can be run manually.
  sed -i 's#^\(\./zephyr-sdk-x86_64-hosttools-standalone-[0-9.]\+sh\)#\1 -R -S#' $pkgdir/$_installdir/$_setupsh

  # Install hosttools always, but let the toolchains be selectable below:
  ALL_TOOLCHAINS=($(_list_toolchains $pkgdir/$_installdir/$_setupsh))
  echo ">>> To select a subset of toolchains set TOOLCHAINS in environment, like so:"
  echo ">>>     TOOLCHAINS='arm arc' makepkg"
  echo ">>> Available toolchains: ${ALL_TOOLCHAINS[*]}"

  # Validate selected toolchains
  if [ ! -z "$TOOLCHAINS" ]
  then
    TOOLCHAINS=(${TOOLCHAINS}) # convert to array

    for tc in "${TOOLCHAINS[@]}"
    do
      if ! echo "${ALL_TOOLCHAINS[@]}" | grep -q -w "$tc"
      then
        echo ">>> ERROR: unknown toolchain: $tc"
        exit 1
      fi
    done
  else
    TOOLCHAINS=("${ALL_TOOLCHAINS[@]}")
  fi
  echo ">>> Selected toolchains: ${TOOLCHAINS[*]}"

  for tc in ${ALL_TOOLCHAINS[@]}
  do
    if ! echo "${TOOLCHAINS[@]}" | grep -q -w "$tc"
    then
      DISABLED_TOOLCHAINS+=("$tc")
    fi
  done

  for tc in ${DISABLED_TOOLCHAINS[@]}
  do
    sed -i "/$(echo $_TC_CMD | sed s/__TC__/${tc}/g)/,+3d" $pkgdir/$_installdir/$_setupsh
  done

  echo ">>> Installing toolchains: $(_list_toolchains $pkgdir/$_installdir/$_setupsh)"

  install -Dm644 zephyrrc $pkgdir/usr/share/zephyr-sdk/zephyrrc

  cd $pkgdir/$_installdir

  ######### NOTE: we are in $_installdir after this point

  for p in $srcdir/0*.patch
  do
    patch ./$_setupsh $p
  done

  ./$_setupsh -d $pkgdir/$_installdir -norc -nocmake -y

  # Manually install the CMake module, because upstream paths are no good:
  # file installed into $HOME and path is the package build path. Upstream
  # needs to support overridable path for the module and a -prefix argumnent
  # to distinguish destination copy dir from final system install path.
  local _cmake_fname=$(echo -n /$_installdir | md5sum | cut -d' ' -f1)
  local _cmake_module_path="$pkgdir/usr/lib/cmake/Zephyr-sdk"
  mkdir -p "$_cmake_module_path"
  echo "/$_installdir" > "$_cmake_module_path/${_cmake_fname}"

  echo ">>>"
  echo ">>> Ignore the environment variable values printed above, instead do this:"
  echo ">>>     cp /usr/share/zephyr-sdk/zephyrrc ~/.zephyrrc"
  echo ">>>"

  # Strip package build path from prefix path
  sed -i "s@\(relocate_sdk.py\s\+\)${pkgdir}/${_installdir} ${pkgdir}/${_installdir}@\1 /${_installdir} /${_installdir}@g" relocate_sdk.sh
  ./relocate_sdk.sh

  rm zephyr-sdk-*-hosttools-standalone-*.sh
  rm "${ALL_TOOLCHAINS[@]/%/.tar.bz2}"
  rm -f mips.tar.bz2 # workaround: mips is part of archive but not in setup.sh
}

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master
# $ source zephyr-env.sh
# $ cd samples/hello_world
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_x86..
# $ ninja run

# Alternative using West:
#
# $ west init testws
# $ cd testws
# $ west update
# $ cd zephyr
# $ west build --pristine=always -b qemu_x86 samples/hello_world
# $ cd build
# $ ninja run

# Expected output for -b qemu_x86:
#
#	SeaBIOS (version rel-1.12.1-0-ga5cab58-dirty-20200214_052440-f7294c49af13-zephyr
#	)
#	Booting from ROM..Optimal CONFIG_X86_MMU_PAGE_POOL_PAGES 7
#	*** Booting Zephyr OS build v2.2.0-rc3  ***
#	Hello World! qemu_x86
#
# Expected output for -b qemu_cortex_m3:
#
# 	qemu-system-arm: warning: nic stellaris_enet.0 has no peer
# 	*** Booting Zephyr OS version 2.2.0-rc3  ***
# 	Hello World! qemu_cortex_m3

# More info: https://docs.zephyrproject.org/latest/getting_started/index.html

sha256sums=('f61041a7cd7beec9c8f826e7aa1215a4c34c309c56a3dc0967b8b3401633d1b4'
            '7a1257272c64bdec281283d391e3149cece065935c9e8394d6bece32d0f6fc05'
            '5a5e1f8cd28f15da3cb9c4c50bf7ccb81fdb15499c02625dc76ed27c98ffad4f'
            'a1a64dd3152871056b6d79bf3fd31cb1e081a8b9354fae929a263e7f74044050'
            'f22ade1773ed8302a11b1ded4cef28ad9630119354d20db334fdb5df6db6f820'
            '4c1f7e68ba1400786f116c2305ec32fa1e00b09367d583770a21bf3056fada46')
