# Maintainer: Evert Vorster <superchief AT evertvorster DOT com>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=clevo-drivers
pkgname=clevo-drivers-dkms-git
pkgver=4.3.2
pkgrel=3
pkgdesc="Kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface for Clevo hardware."
url="https://gitlab.com/evorster/clevo-drivers"
license=("Other")
arch=('x86_64')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-drivers-dkms'
	  'tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=(git+https://gitlab.com/evorster/clevo-drivers.git tuxedo_io.conf dkms.conf)
sha256sums=('SKIP'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
            '4c83b8508698c49246fedf31dbe329ceff5132707afb4fa2df4ccc6c9e1e9db8'
)

prepare(){
cd ${srcdir}/${_pkgname}
echo "Current directory is: $(pwd)"
pkgver=$(git tag | tail -1 | tr -d "v")
echo "pkgver is "${pkgver}
}

package() {
echo "Package step"
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  ln -s ${srcdir}/${_pkgname} ${srcdir}/${_pkgname}-${pkgver}
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/Makefile -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  #cp -avr "${_pkgname%}-$pkgver"/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}
