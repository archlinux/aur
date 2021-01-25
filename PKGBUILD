# Maintainer: Benjamin Feakins <feakster at poster dot eu>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Andrea Benazzo <andy at qitty dot net>
# Modified PKGBUILD from https://aur.archlinux.org/packages/cryptmount/

### Info ###
pkgname=cryptmount-arm
_pkgname=${pkgname%-arm}
pkgver=5.3.2
_pkgver=5.3
pkgrel=5
pkgdesc="Utility which allows an ordinary user to mount an encrypted file system"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://${_pkgname}.sourceforge.net/"
license=('GPL')
provides=("$_pkgname")
depends=('cryptsetup' 'device-mapper' 'libgcrypt' 'systemd' 'util-linux')
source=("${_pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/project/$_pkgname/$_pkgname/${_pkgname}-$_pkgver/${_pkgname}-${pkgver}.tar.gz")
backup=("etc/$_pkgname/cmtab")
b2sums=('708c6ba33060c0698361de7bcdc5e0a5932e063c9178c0a6b9cfb1cba9ec236337dbda0664e8755cc017113ee8ef0149c47fc85019a57ac84bf240790d5d798c')

### Prepare ###
prepare() {
    cd "$srcdir"/${_pkgname}-$pkgver

    case "$CARCH" in
      x86_64)
        _arch=x86_64-unknown-linux-gnu
        ;;
      arm*|aarch64)
        _arch=arm-unknown-linux-gnu
        ;;
      *)
        _arch=$(./config.guess)
        ;;
    esac
    echo "Build: $_arch"

    ./configure --build=$_arch --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-systemd=yes
}

### Build ###
build() {
  cd "$srcdir"/${_pkgname}-$pkgver

  make
}

### Package ###
package() {
  cd "$srcdir"/${_pkgname}-$pkgver

  make install DESTDIR="$pkgdir"/
}
