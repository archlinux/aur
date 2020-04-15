# Maintainer: Allen Wild <allenwild93@gmail.com>
pkgname=git-filter-repo
pkgver=2.26.0
pkgrel=1
pkgdesc="Quickly rewrite git repository history (filter-branch replacement)"
arch=('any')
url="https://github.com/newren/git-filter-repo"
license=('MIT')
depends=('git' 'python')
makedepends=('python-setuptools')
checkdepends=('python-coverage')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "version.patch")
sha256sums=('537ac38f49cb5bbb08b1feb7563bace54c34b4d04427e9245c2081654c3ca095'
            '68757bead7ef4a2ff5af3b8563889564f5105cb75da9a7a7513b8aa198027d6f')

prepare() {
    cd "$pkgname-$pkgver"
    # use_scm_version in setup.py doesn't work from tarballs, inject $pkgver instead
    patch -Np1 -i "$srcdir/version.patch"
    sed -i "s|@PKGVER@|${pkgver}|" release/setup.py
}

check() {
    make -C "$pkgname-$pkgver" test
}

package() {
    cd "$pkgname-$pkgver/release"
    python setup.py install --root="$pkgdir" --optimize=1

    cd ..
    install -Dm644 Documentation/man1/git-filter-repo.1 "${pkgdir}/usr/share/man/man1/git-filter-repo.1"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" COPYING COPYING.mit
}
