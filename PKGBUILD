# Maintainer: Tomkoid <tomkoid@tomkoid.cz>
pkgname="yadal-git"
pkgver=0.3.0.r7.g9a7a7be
pkgrel=1
pkgdesc="Yet another TIDAL track, playlist, album CLI downloader"
url="https://codeberg.org/tomkoid/yadal"
arch=("any")
makedepends=("cargo" "cmake" "git" "gcc" "base-devel" "pkg-config" "ffmpeg")
license=("GPL3")
source=("yadal::git+https://codeberg.org/tomkoid/yadal")
sha256sums=("SKIP")

_PKGNAME="yadal"

prepare() {
  cd "$_PKGNAME"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_PKGNAME"
  CFLAGS="" CXXFLAGS="" LDFLAGS="" cargo build --release --frozen
}

check() {
  cd "$_PKGNAME"
  CFLAGS="" CXXFLAGS="" LDFLAGS="" cargo test --frozen
}

package() {
  cd "$_PKGNAME"
  install -Dm755 "${srcdir}/yadal/target/release/yadal" "${pkgdir}/usr/bin/yadal"
}

pkgver() {
  cd "$_PKGNAME"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
