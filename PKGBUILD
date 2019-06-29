# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname=zephyr-sdk
pkgver=0.10.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64')
url="https://www.zephyrproject.org/"
license=('Apache')
depends=('python-breathe' 'python-sphinx' 'python-docutils' 'python-pyaml'
         'python-ply' 'python-pip' 'python-setuptools' 'python-wheel'
         'python-pyelftools' 'python-pyserial' 'python-pykwalify'
         'python-west'
         'git-spindle' 'gitlint' 'ninja' 'gperf' 'ccache'
         'doxygen' 'dfu-util' 'dtc' 'cmake>=3.8.2')
optdepends=('pyocd: programming and debugging ARM MCUs')
makedepends=('patchelf')
source=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}-setup.run"
        "zephyrrc")

options=(!strip)
backup=('etc/zephyrrc')
install=$pkgname.install

_installdir=/opt/zephyr-sdk
_setupsh=setup.sh

build() {
  cd "$srcdir"
}

# Matches per-toolchain commands in $_installdir/setup.sh
_TC_CMD="tar -C \\\$target_sdk_dir \\(-[A-Za-z0-9]\\+\\)* .\/__TC__.tar.bz2.*"

_list_toolchains() {
  echo $(sed -n "s@^$(echo $_TC_CMD | sed 's/__TC__/\\(.*\\)/g')@\2@p" $1 | sort)
}

package ()
{
  cd "$srcdir"
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

  # i586 is required because it is used as a hardcoded default
  # (for preprocessing) before target architecture is available
  echo ">>> Note: i586 was selected automatically because it is always required"
  if ! echo "${TOOLCHAINS[@]}" | grep -q -w "i586"
  then
    TOOLCHAINS+=("i586")
  fi

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

  install -Dm644 zephyrrc $pkgdir/etc/zephyrrc

  cd $pkgdir/$_installdir

  ######### NOTE: we are in $_installdir after this point

  ./$_setupsh -d $pkgdir/$_installdir

  # Strip package build path from prefix path
  sed -i "s@\(relocate_sdk.py\s\+\)${pkgdir}${_installdir} ${pkgdir}${_installdir}@\1 ${_installdir} ${_installdir}@g" relocate_sdk.sh
  ./relocate_sdk.sh

  rm zephyr-sdk-*-hosttools-standalone-*.sh
  rm "${ALL_TOOLCHAINS[@]/%/.tar.bz2}"
  rm -f mips.tar.bz2 # workaround: mips is part of archive but not in setup.sh
}

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master/samples/synchronization
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_cortex_m3 ..
# $ ninja run
#
# Should get output like:
#   ***** BOOTING ZEPHYR OS v1.8.99 - BUILD: Jun 27 2017 13:09:26 *****
#   threadA: Hello World from arm!
#
# More info: https://docs.zephyrproject.org/latest/boards/arm/qemu_cortex_m3/doc/board.html


sha256sums=('cdf1b036acd6692a700c1b4e3e08983d1363cc802a9f79533c9f15ee72c40b9c'
            '7a1257272c64bdec281283d391e3149cece065935c9e8394d6bece32d0f6fc05')
