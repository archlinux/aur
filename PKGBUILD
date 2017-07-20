pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.12
pkgver=4.12.2
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
sha256sums=('a45c3becd4d08ce411c14628a949d08e2433d8cdeca92036c7013980e93858ab'
            '8447d28c88834bac75653a0370a6f30615688db4756b953720e9b024537e34ac'
            '29737340513e981d1c310d494832473cf2e01af1b4058ab16c2cefda6eea9540'
            '20f1b557fe3ee649a9423950caa667200fd5b240ee8eb5e0ad5477cc7f8fa3c5')

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
