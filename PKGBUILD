# Maintainer: tuberry

pkgname=fortune-mod-mingju-git
_pkg=mingju
pkgver=r17.75a4765
pkgrel=1
pkgdesc="Chinese mingju for fortune-mod"
url="https://github.com/xuchunyang/$_pkg"
license=(GPL-3.0-or-later)
depends=(fortune-mod)
makedepends=(git fortune-mod opencc)
provides=(fortune-mod-mingju)
conflicts=(fortune-mod-mingju)
source=("git+$url")
md5sums=(SKIP)
arch=(any)

pkgver() {
  cd "$_pkg"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_pkg"
  sed -e 's/"\s+/"/g; s/[“”…]//g; s/（[^）]*）//g; s/—/一/g; s/"},{"/\n%\n/g; s/contents":"//g; s/","source":"/\n ──── /g; s/]/\n%\n/' < "$_pkg.json" | tr -d '"{}[' > "$_pkg"
  opencc -i "$_pkg" -o "$_pkg" -c t2s
  strfile "$_pkg" "$_pkg.dat"
}

package(){
  cd "$_pkg"
  install -dm755 "$pkgdir/usr/share/fortune"
  install -Dm644 "$_pkg" "$_pkg.dat" "$pkgdir/usr/share/fortune"
}

# vim: ts=2 sw=2 et:
