# Maintainer: Allen Welden <a.welden81@gmail.com>
pkgname=rtv-git
pkgver=1.27.1.r5.gb34e8a1
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
    cd "${pkgname}"
    # Use tag if available, otherwise fall back to version from source + commit count
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "%s.r%s.g%s" \
        "$(python -c "exec(open('rtv/__version__.py').read()); print(__version__)")" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
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
