# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-chisp-flasher-git
_name=${pkgname%-git}
_name=${_name#python-}
pkgver=1.1.0.r0.g7e06f97
pkgrel=1
pkgdesc="Cross-platform ISP flasher for WCH CH32, CH5x and CH6x families"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

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
        install -vDm644 packaging/icons/png/app_icon_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png
    done

    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
