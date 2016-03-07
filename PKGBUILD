# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

# based on rtl8812au-dkms-git

_pkgname=rtl8812au
pkgname=$_pkgname-rpi-dkms-git
pkgver=VERSION
pkgrel=1
pkgdesc="Realtek 802.11n WLAN Adapter Linux driver for rtl8812au (patched for the Raspberry Pi)"
arch=('armv7h')
url="https://github.com/gnab/rtl8812au"
license=('unknown')
depends=('dkms')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+$url.git"
        'rpi.diff'
        'dkms.conf')
md5sums=('SKIP'
         'e25de20cbcc48989e3f6ae333b29d09c'
         'fc02c8a8c8f24f879d8438c8ed994429')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch -i "$srcdir/rpi.diff"
}

package() {
  cd "$_pkgname"
  mkdir -p "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a * "$pkgdir/usr/src/$_pkgname-$pkgver"

  install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver"

  sed -e "s/@_PKGBASE@/$_pkgname-dkms/" -e "s/@PKGVER@/$pkgver/" -i "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
}

# vim:set ts=2 sw=2 et:
