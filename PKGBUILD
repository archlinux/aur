pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.10
pkgver=4.10.1
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
            'da560125aa350f76f0e4a5b9373a0d0a1c27ccefe3b7bd9231724f3a3c4ebb9e'
            'f001a5860c927c14e12eb6c4c09ad22e57834a0f44d71c9516bc2c2f6f1a290f'
            '2a786756a47a52b77ae4bffb31eadd60a7a717c2e3544a315f1cfe9ba9091f30')

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
