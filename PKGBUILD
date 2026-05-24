# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-chisp-flasher
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform ISP flasher for WCH CH32, CH5x and CH6x families"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/jarczakpawel/CHISP-Flasher"
_pydeps=(
    pyelftools
    pyserial
    pyusb
    yaml
)
depends=(
    'hicolor-icon-theme'
    'pyside6'
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
    'wchisp: WCH ISP Tool in Rust'
)
license=('Apache-2.0')
options=(!debug)
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('cf3116a8ba9f3a096d1272430b2f91600cac130717ce5f189a9e70545698b10b')

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
    install -vDm644 packaging/linux/50-chisp-flasher.rules -t ${pkgdir}/usr/lib/udev/rules.d
    install -vDm644 packaging/linux/chisp-flasher.desktop -t ${pkgdir}/usr/share/applications/

    for i in 16 24 32 48 64 128 256 512 1024; do
        install -vDm644 packaging/icons/png/app_icon_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
    done

    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
