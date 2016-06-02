pkgname=linux-usermode
true && pkgname=(linux-usermode linux-usermode-modules)
pkgbase=linux-usermode
_kernelname=-usermodelinux
_srcname=linux-4.6
pkgver=4.6.1
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
md5sums=('d2927020e24a76da4ab482a8bc3e9ef3'
         'e3479d9c8a0e8757c16eb03a4258587c'
         '3dbaa1af7fddb8dda218b6001a87478a'
         '5d2f5ff58dab428ff492b482d4565afc')

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
