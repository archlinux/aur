# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=monotone-snapshot
pkgver=1.2.dev
pkgrel=1
_snapshot=39626e94a960267e612c72c565b529674834b862
pkgdesc='A modern distributed version control system, like hg, darcs, or git (dev snapshot)'
arch=('i686' 'x86_64')
url='https://code.monotone.ca/p/monotone'
license=('GPL')
depends=('pcre' 'lua' 'botan' 'sqlite3' 'libidn' 'zlib')
makedepends=('boost' 'git')
provides=('monotone')
conflicts=('monotone')
install=monotone.install
source=($pkgname::"git+https://github.com/skydrome/monotone.vcs.mirror.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    sed -i "s/echo \"unknown\"/echo \"$_snapshot\"/" 'Makefile.am'
    aclocal
    autoreconf --install
}

build() {
    cd "$srcdir/$pkgname"
    export DISABLE_NETWORK_TESTS=1

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-nls
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    install -d "${pkgdir}/usr/share/vim/vimfiles/plugin/"
    install -Dm644 contrib/monotone.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_mtn"
    install -Dm644 contrib/{mtncommit,basicio}.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
}
