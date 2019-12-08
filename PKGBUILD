# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Chris Salzberg <chris@dejimata.com>
# Contributor: Leonidas Spyropoulos <artafinde@gmail.com>
pkgname=neomutt-autocrypt
_srcname=neomutt
# This package should mirror community/neomutt,
# except for added autocrypt
pkgver=20191129
pkgrel=4
pkgdesc='A version of community/neomutt with added autocrypt'
url='https://neomutt.org/'
license=('GPL')
arch=('x86_64')
depends=('glibc' 'gpgme' 'lua' 'notmuch-runtime' 'krb5' 'gnutls'
         'libsasl' 'ncurses' 'libidn2' 'lmdb' 'gdbm' 'kyotocabinet'
	 'sqlite')
provides=('neomutt')
conflicts=('neomutt')
optdepends=('python: keybase.py')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'w3m')
_github='https://github.com/neomutt/neomutt'
source=("$pkgname-$pkgver.tar.gz::$_github/archive/$pkgver.tar.gz"
	"default-ca-certificates.patch")
sha256sums=('c339e17b676d0a9a8db6dd1c9acac3db4b217c6b19050e5a1eec99b1b0b59a2f'
	    '410a364ae8249c969fc321f0f50ecb4603e9443bd73b31f58c8487e6b8b510e0')

prepare() {
    cd "$_srcname-$pkgver"
    patch -Np1 -i "$srcdir/default-ca-certificates.patch"
}

build() {
    cd "$_srcname-$pkgver"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --gpgme \
        --lua \
        --notmuch \
        --gss \
        --gnutls \
        --sasl \
        --with-ui=ncurses \
        --with-idn2=/usr \
        --disable-idn \
        --idn2 \
        --lmdb \
        --kyotocabinet \
        --gdbm \
	--enable-autocrypt \
	--sqlite
    make
}

package() {
    cd "$_srcname-$pkgver"
    make DESTDIR="$pkgdir" install
}

# eof
