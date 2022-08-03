# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Sean Haugh <seanphaugh@gmail.com>
# Contributor: Chris Salzberg <chris@dejimata.com>
_pkgname=neomutt
pkgname=neomutt-git
pkgver=20220429.r168.g8280a6351
pkgrel=1
pkgdesc='A version of mutt with added features - development branch'
url='http://www.neomutt.org/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64')
depends=('glibc' 'gpgme' 'lua53' 'notmuch-runtime' 'krb5' 'gnutls' 'sqlite'
         'libsasl' 'ncurses' 'libidn2' 'lmdb' 'gdbm' 'kyotocabinet'
         'lz4' 'zlib' 'zstd' 'db')
optdepends=('python: keybase.py'
            'perl: smime_keys'
            'ca-certificates: default CA certificates')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'w3m')
source=("git+https://github.com/neomutt/neomutt.git#branch=main"
        "default-ca-certificates.patch")
sha256sums=('SKIP'
            '571716b8979e9b43328416c3c56eff228b6c58355d7c080b8987ea89c6360776')
conflicts=('neomutt')
provides=('neomutt')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/(.*)-(.*)-/\1.r\2./; s/-//g'
}

prepare() {
    cd "$_pkgname"
    patch -Np1 -i "$srcdir/default-ca-certificates.patch"
}

build() {
    cd "$_pkgname"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --gpgme \
        --sqlite \
        --autocrypt \
        --lua \
        --notmuch \
        --gss \
        --gnutls \
        --sasl \
        --with-ui=ncurses \
        --with-idn2=/usr \
        --disable-idn \
        --idn2 \
        --bdb \
        --lmdb \
        --kyotocabinet \
        --gdbm \
        --lz4 \
        --zlib \
        --zstd
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}

# vim: ft=sh ts=4 sw=4 et
