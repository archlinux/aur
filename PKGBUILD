# Maintainer: Trần Xuân Nhật  <xuannhat123456789@gmail.com>
pkgname=gytm-git
pkgver=r111.5b969cc
pkgrel=2
pkgdesc="Minimal TUI based music streaming app for Youtube Music"
arch=('x86_64')
url="https://github.com/xuannhat999/gytm"
license=('Apache-2.0')
depends=('mpv' 'yt-dlp' 'glibc' 'openssl' 'sqlite')
makedepends=('git' 'cargo' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git#branch=main")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local _count=$(git rev-list --count HEAD -- . ':(exclude)*.md' ':(exclude).github/*')
  local _short=$(git log -1 --format="%h" -- . ':(exclude)*.md' ':(exclude).github/*')
  printf "r%s.%s" "$_count" "$_short"
}
prepare() {
  cd "${srcdir}/${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export SQLITE3_NO_PKG_CONFIG=0
  export PKG_CONFIG_ALL_DYNAMIC=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export OPENSSL_NO_VENDOR=1
  cargo build --frozen --release --bin gytm
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "target/release/gytm" "${pkgdir}/usr/bin/gytm"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
