# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=st-aegix-git
_pkgname=st
pkgver=r13.17faeee
pkgrel=1
pkgdesc="Aegix Linux's custom build of st (simple terminal) with harfbuzz support and aegix-flavored config"
arch=('x86_64')
url="https://github.com/aegixlinux/st"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2' 'fontconfig' 'harfbuzz')
makedepends=('git')
provides=('st')
conflicts=('st')
source=("$_pkgname::git+https://github.com/aegixlinux/st.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    # st's Makefile invokes `tic -sx st.info` which writes to /usr/share/terminfo
    # unconditionally. Redirect via -o to keep the write inside $DESTDIR.
    sed -i 's|tic -sx st.info|tic -sx -o "$(DESTDIR)/usr/share/terminfo" st.info|' Makefile
}

build() {
    cd "$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/share/terminfo"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
