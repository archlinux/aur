pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.10
pkgver=4.10.8
pkgrel=1
pkgdesc="User mode Linux kernel and modules"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://user-mode-linux.sourceforge.net/"
depends=('coreutils')
makedepends=('bc' 'inetutils' 'vde2-static' 'vde2')
source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
	"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
	config-i686
	config-x86_64)
sha256sums=('3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b'
            'ceb385486e34084dd53425e5ba50b9fba4a8e380d8f2815bfde142852d797da0'
            'cec43aedc7ba8af326b06ee9397dd7b7206dc3c65356c94cfabbbcf5e372b781'
            '1b426acfe6ec77be45687d76f684c7aa9318d89e1c767513c9d6cee13d4a524a')

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
}

build() {
  cd "${srcdir}/${_srcname}"
  unset LDFLAGS CFLAGS
  cp $srcdir/config-$CARCH .config
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|g" ./.config
  fi

#make ARCH=um oldconfig
#return 1

  make ARCH=um vmlinux modules KCFLAGS=-fPIC
}

package_linux-usermode() {
  cd "${srcdir}/${_srcname}"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/kernel26-usermode"
  cp System.map ${pkgdir}/usr/share/kernel26-usermode/System.map
  cp vmlinux ${pkgdir}/usr/bin/
}

package_linux-usermode-modules() {
  install=modules.install

  cd "${srcdir}/${_srcname}"
#  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  make ARCH=um INSTALL_MOD_PATH="${pkgdir}/usr" _modinst_
  rm -f $pkgdir/usr/lib/modules/${pkgver}${_kernelname}/{source,build}
  sed \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=$pkgver${_kernelname}/g" \
    -i "${startdir}/modules.install"
}
