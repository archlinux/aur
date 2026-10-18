# Maintainer: thankarezos
pkgname=fingerprint-manager-git
_pkgname=fingerprint-manager
pkgver=0.1.0.r2.gb4704d2
pkgrel=1
pkgdesc='Qt 6 and Kirigami fingerprint manager for fprintd'
arch=('any')
url='https://github.com/thankarezos/fingerprint-manager'
license=('MIT')
depends=('python' 'pyside6' 'kirigami' 'qt6-declarative' 'hicolor-icon-theme' 'qqc2-desktop-style' 'fprintd' 'polkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('kconfig')
optdepends=('kconfig: KDE fingerprint authenticator preference tools'
            'coreutils: unbuffered fingerprint operation progress')
provides=("fingerprint-manager=${pkgver}")
conflicts=('fingerprint-manager')
source=('fingerprint-manager::git+https://github.com/thankarezos/fingerprint-manager.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local version
    version=$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])')
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname"
    python -m unittest discover -s tests
    QT_QPA_PLATFORM=offscreen QT_QUICK_BACKEND=software \
        QT_QUICK_CONTROLS_STYLE=Basic PYTHONPATH=. python tests/smoke_ui.py
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 data/kde-pam-helper "$pkgdir/usr/lib/fingerprint-manager/kde-pam-helper"
    install -Dm644 data/io.github.thankarezos.fingerprint-manager.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.thankarezos.fingerprint-manager.policy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/doc/$_pkgname/NOTICE"
}
