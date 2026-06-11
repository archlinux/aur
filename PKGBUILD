# Maintainer: Allen Welden <a.welden81@gmail.com>
pkgname=rtv-git
pkgver=1.27.1.r1632.g8d4d49d
pkgrel=1
pkgdesc="A simple terminal viewer for Reddit (Reddit Terminal Viewer)"
arch=('any')
url="https://github.com/RanRhoads84/reddit-terminal-viewer"
license=('MIT')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-decorator'
    'python-requests'
    'python-standard-mailcap'
    'python-wcwidth'
)
makedepends=(
    'git'
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'xsel: clipboard support on X11'
    'xclip: clipboard support on X11 (alternative)'
    'wl-clipboard: clipboard support on Wayland'
)
provides=('rtv')
conflicts=('rtv')
source=("${pkgname}::git+https://github.com/RanRhoads84/reddit-terminal-viewer.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    local _ver
    _ver=$(grep -m1 '__version__' rtv/__version__.py | sed -E "s/.*['\"]([^'\"]+)['\"].*/\1/")
    printf "%s.r%s.g%s" "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 rtv.1 "${pkgdir}/usr/share/man/man1/rtv.1"
}
