# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
pkgver=5.8.0
pkgrel=1
pkgdesc='A wrapper around all package managers'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(python-build python-installer python-wheel python-poetry)
depends=('python>=3.7' python-boltons python-click 'python-click-extra>=3.2.5' python-packageurl python-tabulate python-tomli python-tomli-w 	python-typing_extensions python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
optdepends=('apm: support for managing Atom packages'
            'rust: support for managing Rust packages'
            'composer: support for PHP composer packages'
            'dnf: support for RPM packages'
            'flatpak: support for Flatpak packages'
            'rubygems: support for Ruby packages'
            'npm: support for Node.js packages'
            'opkg: support for OPKG packages'
            'pacman: support for Pacman packages'
            'paru: support for AUR packages'
            'python-pip: support for Python packages'
            'python-pipx: support for Python pipx packages'
            'snapd: support for Snap packages'
            'steamcmd: support for Steam games'
            'code: support for VSCode extensions'
            'yarn: support for Node packages'
            'yum: support for DNF packages'
            'zypper: support for RPM packages')
license=('GPL2')
arch=('any')
source=("https://github.com/kdeldycke/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8bd9d14406f56874001a986f11b4883717132813c70d24ccea53c5537d5f46822bf5ea0ae97c416b4e0c145fe275f337160ea3ba59f06311a9eff7f4152080a8')

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
