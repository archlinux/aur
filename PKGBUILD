# Maintainer: Allen Wild <allenwild93@gmail.com>
pkgname=git-filter-repo
pkgver=2.25.0
pkgrel=1
pkgdesc="Quickly rewrite git repository history (filter-branch replacement)"
arch=('any')
url="https://github.com/newren/git-filter-repo"
license=('MIT')
depends=('git' 'python')
checkdepends=('python-coverage')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ea8cdb7dca68111e819d141fc4d302b811c1e5362c12de7403882ba9908be29c')

prepare() {
    # hard-code the shebang to the system python(3) to avoid confusion with virtualenvs
    sed -i 's|^#!.*|#!/usr/bin/python|' "$pkgname-$pkgver/git-filter-repo"
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
