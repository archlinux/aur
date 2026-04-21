# Maintainer: taotieren <admin@taotieren.com>

pkgname=adguard-tray-git
pkgver=1.6.1.r1.g529e35a
pkgrel=1
pkgdesc="System tray monitor and controller for adguard-cli (KDE Plasma & Hyprland)"
arch=('any')
url="https://github.com/RiDDiX/adguard-tray"
license=('MIT')
depends=(
    'python'
    'python-yaml'
    'python-pyqt6'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'adguard-cli-bin: adguard-cli binary (AUR)'
)
provides=('adguard-tray')
conflicts=('adguard-tray')
source=("$pkgname::git+https://github.com/RiDDiX/adguard-tray.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    sed -i "s|usr/local/bin|/usr/bin|g" adguard-tray.desktop
    rm -rf contrib
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 adguard-tray.desktop -t "$pkgdir/usr/share/applications/"
    install -vDm755 adguard-tray.py "$pkgdir/usr/bin/${pkgname%-git}"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
