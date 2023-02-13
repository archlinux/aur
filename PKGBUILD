# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
pkgver=5.11.6
pkgrel=1
pkgdesc='A wrapper around all package managers'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(python-build python-installer python-wheel python-poetry)
depends=('python>=3.7' python-boltons python-click 'python-click-extra>=3.4.0' python-packageurl python-tabulate python-tomli python-tomli-w python-typing_extensions python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
optdepends=('apt: support for apt packages'
            'rust: support for Rust packages'
            'composer: support for PHP composer packages'
            'dnf: support for RPM packages'
            'flatpak: support for Flatpak packages'
            'rubygems: support for Ruby packages'
            'npm: support for Node.js packages'
            'opkg: support for OPKG packages'
            'pacaur: support for AUR packages'
            'pacman: support for Pacman packages'
            'paru: support for AUR packages'
            'python-pip: support for Python packages'
            'python-pipx: support for Python pipx packages'
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yay: support for AUR packages'
            'yum: support for DNF packages'
            'zypper: support for RPM packages')
license=('GPL2')
arch=('any')
source=("https://github.com/kdeldycke/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0bfa6094abfbb3e099bef8be23917051f295834967969901a25df73482ac3078f9b318a4f88831696b077066c2b5c8e55fa3f7cd8791dd4f19b6541d99496fc4')

build() {
    # Poetry has a bug where .gitignore files in any parent directory is used in excluding files to build, resulting in an empty package.
    cd "$srcdir/$pkgname-$pkgver"
    GIT_DIR="$srcdir/$pkgname-$pkgver" python -m build --wheel --no-isolation
}

check() {
    # Pytest does currently not run successfully due to a bug in the tests. Will be uncommented when the bug is fixed.
    # cd "$srcdir/$pkgname-$pkgver"
    # pytest
    true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
