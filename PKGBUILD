# Maintainer: Christopher Auer <christopher AT auer DOT team>

pkgname=eilmeldung-git
pkgver=r283.01c760a
pkgrel=4
pkgdesc="a TUI RSS reader based on the news-flash library"
arch=('x86_64')
url="https://github.com/christo-auer/eilmeldung"
license=('GPL-3.0-or-later')
depends=('libxml2' 'openssl' 'sqlite3' 'libsixel')  
conflicts=( 'eilmeldung' 'eilmeldung-bin' )
makedepends=('cargo' 'clang' 'git')
source=("git+$url.git")
sha256sums=('SKIP')
arch=('x86_64')
options=('!lto')

pkgver() {
    cd "$srcdir/eilmeldung"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/eilmeldung"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/eilmeldung"
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --frozen --release 
}

check() {
  cd "$srcdir/eilmeldung"
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo test --frozen
}

package() {
  cd "$srcdir/eilmeldung"
  install -Dm755 target/release/eilmeldung -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:

