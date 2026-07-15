# Maintainer: OldJobobo <aur at oldjobobo dot com>
pkgname=thpm-git
pkgver=1.0.0rc2.r0.ge460032
pkgrel=1
pkgdesc='Omarchy 4-native manager for external theme integrations (git)'
arch=('any')
url='https://github.com/oldjobobo/thpm'
license=('MIT')
depends=('python>=3.11' 'python-textual>=8.2.8')
optdepends=('omarchy: Omarchy 4 host integration (required for installation and theme operations)')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('thpm' 'theme-hook-plugin-manager')
conflicts=('thpm' 'theme-hook-plugin-manager')
replaces=('theme-hook-plugin-manager')
source=('git+https://github.com/oldjobobo/thpm.git')
sha256sums=('SKIP')

pkgver() {
    cd thpm
    git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd thpm
    python -m build --wheel --no-isolation
}

package() {
    cd thpm
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/thpm/templates" assets/templates/*
    install -Dm644 -t "$pkgdir/usr/share/thpm/qml" assets/qml/*
    install -Dm755 assets/hooks/90-thpm "$pkgdir/usr/share/thpm/hooks/90-thpm"
    install -Dm644 assets/compat/theme-env.sh "$pkgdir/usr/share/thpm/compat/theme-env.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
