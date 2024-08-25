# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce-git
_pkgbase=lapce
pkgver=0.4.1.r23.g8047100
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor (Git version)"
arch=(x86_64)
url="https://lapce.dev"
license=(Apache-2.0)
provides=("lapce")
conflicts=("lapce")
depends=(
  expat
  fontconfig
  freetype2
  gcc-libs
  gtk3
  libxcb
  libxkbcommon
  libxkbcommon-x11
)
makedepends=(
  clang
  cmake
  git
  python
  rust
)
options=('!lto')
source=("$_pkgbase::git+https://github.com/lapce/lapce.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' |
        sed -e 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgbase"
    export LIBCLANG_PATH='/usr/lib'
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgbase"
    cargo build --frozen --profile release-lto --all-features
}

package() {
    cd "$_pkgbase"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release-lto/$_pkgbase"{,-proxy}
    local lname=dev.lapce.lapce
    install -Dm0644 -t "$pkgdir/usr/share/applications/" extra/linux/$lname.desktop
    install -Dm0644 -t "$pkgdir/usr/share/metainfo/" extra/linux/$lname.metainfo.xml
    install -Dm0644 extra/images/logo.png "$pkgdir/usr/share/pixmaps/$lname.png"
}
