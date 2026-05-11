# Maintainer: Arimil <renari at arimil dot com>

pkgname=asus-rog-ryujin-hwmon-dkms-git
_pkgname=asus_rog_ryujin-hwmon
_module=asus_rog_ryujin
pkgver=r19.4b9fccb
pkgrel=1
pkgdesc='Hwmon Linux kernel driver for monitoring ASUS ROG Ryujin AIO coolers'
arch=('any')
url='https://github.com/aleksamagicka/asus_rog_ryujin-hwmon'
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
install="$pkgname.install"
optdepends=(
  'linux-headers: build the module for the stock Arch kernel'
  'linux-lts-headers: build the module for the stock Arch LTS kernel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "$_pkgname::git+$url.git"
  'dkms.conf'
  'asus_rog_ryujin.conf'
)
sha256sums=('SKIP'
            'da9bad30a7faa72306f3fefbd4dcc5549710884bb1e700dee5f0276bde9ea4bd'
            '289e1f160ddde0b549167e8669c562e4897caf45b847884fdf4c4e4d1b849081')

pkgver() {
  cd "$_pkgname"

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"

  local dkmsdir="$pkgdir/usr/src/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$dkmsdir/README.md"
  install -Dm644 Makefile "$dkmsdir/Makefile"
  install -Dm644 Kbuild "$dkmsdir/Kbuild"
  install -Dm644 "$srcdir/dkms.conf" "$dkmsdir/dkms.conf"
  install -Dm644 "$srcdir/asus_rog_ryujin.conf" \
    "$pkgdir/usr/lib/modules-load.d/asus_rog_ryujin.conf"

  find Documentation drivers -type f -exec install -Dm644 '{}' "$dkmsdir/{}" \;

  sed -e "s/@PKGNAME@/$pkgname/g" \
      -e "s/@PKGVER@/$pkgver/g" \
      -e "s/@MODULE@/$_module/g" \
      -i "$dkmsdir/dkms.conf"
}
