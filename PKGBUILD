# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="retroarch-autoconfig-udev"
pkgname="$_pkgname-git"
pkgver=1.18.1.r9.gdfb61f1
pkgrel=1
pkgdesc='udev joypad autoconfig for RetroArch'
url="https://github.com/libretro/retroarch-joypad-autoconfig"
license=('MIT')
arch=('any')

makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="retroarch-joypad-autoconfig"
source=("$_pkgsrc"::"git+https://github.com/libretro/retroarch-joypad-autoconfig.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc/udev"
  for i in *[^A-Za-z0-9_\(\)-\.\ ]*; do
    mv "$i" "$(sed -E 's@[^A-Za-z0-9_\(\)-\.\ ]@@g' <<< "$i")"
  done
}

package() {
  depends+=('retroarch')

  cd "$_pkgsrc"

  install -dm755 "$pkgdir/usr/share/libretro/autoconfig"
  cp --reflink=auto -ar --no-preserve='ownership' udev "$pkgdir/usr/share/libretro/autoconfig/"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
