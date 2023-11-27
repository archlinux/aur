# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault
pkgname=scdoc-git
_pkgname=${pkgname%-git}
pkgver=1.11.2.r10.ca7aad3
pkgrel=2
license=('MIT')
pkgdesc='Tool for generating roff manual pages'
depends=()
makedepends=(make clang)
conflicts=(scdoc)
provides=(scdoc)
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/scdoc/'
source=("git+https://git.sr.ht/~sircmpwn/scdoc")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$_pkgname"
    # Upstream purposefully does not honor the user's LDFLAGS in order to keep
    # scdoc static. As we gain no benefit to statically linking and, in fact,
    # lose standard Arch practices (such as RELRO and PIE), we must override
    # LDFLAGS
    make PREFIX=/usr LDFLAGS="$LDFLAGS"
}

check() {
    cd "$_pkgname"
    make check
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
