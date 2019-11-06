# Maintainer: Allen Wild <allenwild93@gmail.com>
pkgname=git-filter-repo
pkgver=2.24.0
pkgrel=1
pkgdesc="Rapidly rewrite entire repository history using user-specified filters."
arch=('any')
url="https://github.com/newren/git-filter-repo"
license=('MIT')
depends=('git' 'python')
checkdepends=('python-coverage')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "coverage-command.patch")
sha256sums=('92188d3c44b9ff0dd40dfeed72859e0a088f775c12fb24c4e3e27a8064cfcc84'
            'b37bb67d8cdca997f096f8231e41f01de020d78cb4df5b1d5affbe74e10f1111')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/coverage-command.patch"
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    # Makefile doesn't support DESTDIR and installs the bare script as a Python module 
    # without any egg-info metadata, which is undesirable. Just install manually.
    install -Dm755 git-filter-repo "${pkgdir}/usr/bin/git-filter-repo"
    install -Dm644 Documentation/man1/git-filter-repo.1 "${pkgdir}/usr/share/man/man1/git-filter-repo.1"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" COPYING COPYING.mit
}
