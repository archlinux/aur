# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="wayshot"
pkgname="${_pkgname}-git"
pkgver=r543.687a52e
pkgrel=2
pkgdesc="Screenshotting tool for wayland compositors"
arch=("x86_64")
url="https://github.com/waycrate/wayshot"
license=('GPL-3.0-only')
depends=(pango libjxl)
makedepends=(git cargo scdoc)
optdepends=(
  'wl-clipboard: copy screenshots to clipboard'
  'slurp: interactive region selection'
  'waysip: interactive region selection (Wayland-native)'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  cargo build --release --no-default-features --features jpeg,jxl,logger
  for f in docs/*.scd; do
    scdoc < "$f" > "${f%.scd}"
  done
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE-GPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for f in docs/wayshot.[0-9]; do
    install -Dm644 "$f" "$pkgdir/usr/share/man/man${f##*.}/${f##*/}"
  done
}
