# Maintainer: Alexei Colin <ac@alexeicolin.com>

_pkgname=zephyr-sdk
pkgname="${_pkgname}-bin"
pkgver=0.17.0
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')

depends=('cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz')
makedepends=('python')
optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
            'pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
makedepends=('patchelf' 'wget')
provides=('zephyr-sdk')
conflicts=('zephyr-sdk')

source=("profile-zephyr-sdk.sh" "profile-zephyr-sdk.ash")
source_x86_64=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}_linux-x86_64.tar.xz")
source_aarch64=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/zephyr-sdk-${pkgver}_linux-aarch64.tar.xz")

sha256sums=('10d0873b848df7dc30940a5642957763d48ab53b04ea828e1a404c6016d4b0de'
            '4f6058f9e3990143d4f7d5f2aed6053bb6b5eb8b6034538b02a06b70f807b4f8')
sha256sums_x86_64=('e7536b4879f689cfd4ef9c1939069da6c4cf0e3030a2940175d6354e7b8b69e1')
sha256sums_aarch64=('d822b4336d5a66ad70077321cde92ca3580b235fd23326cd4fb00bdc16784483')

options=(!strip)

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

  install -Dm644 profile-zephyr-sdk.sh $pkgdir/etc/profile.d/zephyr-sdb.sh
  install -Dm644 profile-zephyr-sdk.ash $pkgdir/etc/profile.d/zephyr-sdb.ash

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

  rm environment-setup-*
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
