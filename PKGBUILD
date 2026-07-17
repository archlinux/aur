# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Istvan Szekeres <szekeres@iii.hu>
pkgname=corral
pkgver=0.9.2
pkgrel=2
epoch=
pkgdesc="Pony dependency manager tool"
arch=('x86_64')
url="https://github.com/ponylang/corral"
license=('BSD-2-Clause')
depends=()
makedepends=('ponyc' 'git')
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ponylang/corral/archive/$pkgver.tar.gz"
        $pkgname-$pkgver-unreachable-else.patch::https://github.com/ponylang/corral/commit/10b85e36e5c7ec4503ecb80ff51aa2342e459805.patch)
sha256sums=('c6b0000fe2f5c451923988e2fc44da3f2a3c37dd35f2125239028edebdb408b5'
            'dbe95350a51fc295a520b2284d78e7f5b487554a1261f30fc1cab0955eb6c49e')

prepare() {
    cd "$srcdir/corral-$pkgver"
    # current ponyc treats a redundant-but-exhaustive `else` arm in an
    # already-exhaustive match as a hard error ("the else clause is
    # unreachable") instead of a warning, fixed upstream on main in
    # commit 10b85e36e5 (not in a tagged release yet -- see
    # memory/corral.md). That commit also retargets unrelated CI
    # workflows that have since drifted from this tarball, so apply
    # only the source-file hunk from it.
    git init -q
    git apply --include='corral/semver/version/compare_versions.pony' -p1 \
        "$srcdir/$pkgname-$pkgver-unreachable-else.patch"
    rm -rf .git
}

build() {
    cd "$srcdir/corral-$pkgver"
    make prefix=/usr
}

package() {
    cd "$srcdir/corral-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -D LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
