# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-adguardvpn-gui
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=2
pkgdesc="Unofficial modern desktop GUI for the official adguardvpn-cli"
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
arch=('any')
url="https://github.com/SpazzRabbit/adguardvpn-gui"
_pydeps=(
)
depends=(
    hicolor-icon-theme
    pyside6
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'adguardvpn-cli-bin: Fast, flexible and reliable VPN solution for command-line enthusiasts.'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('4c21dd930d8fff2d42a574718864b80c8250228826dd8dd44e925df5394d6436')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 packaging/adguard-gui.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 assets/icons/adguard-gui.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
