# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ntfix-git
pkgver=0.2.1.r6.g48f4bc1
pkgrel=3
pkgdesc="Fixes the problem of Proton games not running on NTFS partitions"
arch=('x86_64')
url="https://github.com/benjamimgois/ntfix"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=(
  'git'
  'lazarus'
#  'xmlstarlet'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/ntfix.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # modify compiler options
#  for i in "${pkgname%-git}.lpi"; do
#    xmlstarlet edit --inplace --delete '//Other' "$i"
#    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
#      -i "$i"
#  done

  # icon name
  desktop-file-edit --set-icon="${pkgname%-git}" "data/${pkgname%-git}.desktop"

  mkdir -p build
}

build() {
  cd "${pkgname%-git}"
  lazbuild -B "${pkgname%-git}.lpi" \
    --lazarusdir=/usr/lib/lazarus \
    --widgetset=gtk3 \
    --primary-config-path=build
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 "data/icons/${pkgname%-git}48.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname%-git}.png"
  install -Dm644 "data/icons/${pkgname%-git}_128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png"
  install -Dm644 "data/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
}
