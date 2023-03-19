# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname=zephyr-sdk
pkgver=0.16.0
pkgrel=2
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64')
url="https://www.zephyrproject.org/"
license=('Apache')

depends=('cmake' 'ninja' 'gperf' 'ccache' 'dfu-util' 'dtc'
         'python-pip' 'python-setuptools' 'python-wheel' 'tk' 'xz')
optdepends=('pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
makedepends=('patchelf' 'wget')
source=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}_linux-x86_64.tar.xz"
        "zephyrrc"
)
sha256sums=('63fd2a70fe941c92cc92bf13f5a50ff785c0bd1051460ec661542cd10b9052cd'
            '7a1257272c64bdec281283d391e3149cece065935c9e8394d6bece32d0f6fc05')


options=(!strip)
install=$pkgname.install

_installdir=opt/zephyr-sdk
_setupsh=setup.sh

build() {
  cd "$srcdir"
}

package ()
{
  cd "$srcdir"

  mkdir -p $pkgdir/opt
  echo ">>> Unpacking...."
  cp -a $srcdir/zephyr-sdk-$pkgver $pkgdir/$_installdir

  # Add a flag to not relocate executables, because the path to pkgdir is invalid after installation
  # -R disables relocation, -S saves the relocation script so that it can be run manually.
  sed -i 's#\(\./zephyr-sdk-\${HOSTTYPE}-hosttools-standalone-[0-9.]\+sh\)#\1 -R -S#' $pkgdir/$_installdir/$_setupsh

  # Disables sanboxing on systems where libseccomp is available
  sed -i 's/xargs -n100 file/xargs -n100 file -S/' $pkgdir/$_installdir/zephyr-sdk-x86_64-hosttools-standalone-*.sh

  install -Dm644 zephyrrc $pkgdir/usr/share/zephyr-sdk/zephyrrc

  cd $pkgdir/$_installdir

  ######### NOTE: we are in $_installdir after this point

  ./$_setupsh -h -t all

  # Manually install the CMake module, because upstream paths are no good:
  # file installed into $HOME and path is the package build path. Upstream
  # needs to support overridable path for the module and a -prefix argumnent
  # to distinguish destination copy dir from final system install path.
  local _cmake_fname=$(echo -n /$_installdir | md5sum | cut -d' ' -f1)
  local _cmake_module_path="$pkgdir/usr/lib/cmake/Zephyr-sdk"
  mkdir -p "$_cmake_module_path"
  echo "/$_installdir" > "$_cmake_module_path/${_cmake_fname}"

  # Strip package build path from prefix path
  sed -i "s@\(relocate_sdk.py\s\+\)${pkgdir}/${_installdir} ${pkgdir}/${_installdir}@\1 /${_installdir} /${_installdir}@g" relocate_sdk.sh
  ./relocate_sdk.sh

  rm zephyr-sdk-*-hosttools-standalone-*.sh
  rm relocate_sdk.{py,sh}
  rm setup.sh
}

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master
# $ source zephyr-env.sh
# $ cd samples/hello_world
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_cortex_a53 ..
# $ ninja run

# Alternative using West:
#
# $ west init testws
# $ cd testws
# $ west update
# $ cd zephyr
# $ west build --pristine=always -b qemu_cortex_a53 samples/hello_world
# $ cd build
# $ ninja run

# Expected output for -b qemu_cortex_m3:
#
#       *** Booting Zephyr OS version 2.4.99  ***
#       Hello World! qemu_cortex_a53

# More info: https://docs.zephyrproject.org/latest/getting_started/index.html
