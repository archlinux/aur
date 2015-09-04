# Maintainer: archaurwiki <archaurwiki at i2pmail dot org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=monotone
pkgver=1.1
pkgrel=1
pkgdesc='A free distributed version control system'
arch=('i686' 'x86_64')
url='https://code.monotone.ca/p/monotone'
license=('GPL')
depends=('pcre' 'lua' 'botan-stable' 'sqlite3' 'libidn' 'zlib')
makedepends=('boost')
provides=('monotone')
conflicts=('monotone' 'monotone-snapshot')
install=monotone.install
source=("http://www.monotone.ca/downloads/1.1/monotone-${pkgver}.tar.bz2")
sha1sums=('2b97559b252decaee3a374b81bf714cf33441ba3')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    aclocal
    autoreconf --install
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export DISABLE_NETWORK_TESTS=1
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-nls
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -d "${pkgdir}/usr/share/vim/vimfiles/plugin/"
    install -Dm644 contrib/monotone.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_mtn"
    install -Dm644 contrib/{mtncommit,basicio}.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
}
