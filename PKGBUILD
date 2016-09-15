# Maintainer:  Alad Wenter <alad (at) archlinux.info>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
# Contributor: C. Dominik Bódi <dominik.bodi@gmx.de>
# Contributor: Pierre Carrier <pierre@spotify.com>
# Contributor: Thomas Dziedzic <gostrc (at) gmail>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: seblu <seblu+arch (at) seblu.net>
# Contributor: squiddo <squiddo (at) intheocean.net>
# Contributor: dront78 <dront78 (at) gmail.com>
# Contributor: hugelgupf <ckoch (at) cs.nmt.edu>

pkgname=dpkg
pkgver=1.18.10
pkgrel=3
pkgdesc="The Debian Package Manager.  Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/dpkg"
license=('GPL')
depends=('xz' 'zlib' 'bzip2' 'perl')
makedepends=('perl-io-string' 'perl-timedate' 'git')
checkdepends=('perl-io-string' 'perl-test-pod')
source=("$pkgname-$pkgver::git+https://anonscm.debian.org/git/dpkg/dpkg.git#tag=$pkgver")
sha256sums=('SKIP')

check() {
    cd "$pkgname-$pkgver"
    make check
}

build() {
    cd "$pkgname-$pkgver"
    autoreconf -f -i

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --disable-start-stop-daemon \
        --disable-install-info
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    install -d "$pkgdir/var/$pkgname"/updates/
    touch "${pkgdir}/var/lib/$pkgname"/{status,available}
}
