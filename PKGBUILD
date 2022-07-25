# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=python-srt-git
pkgver=3.5.2.r7.g1247ed7
pkgrel=1
pkgdesc='Tools and python library for parsing, modifying, and composing SRT files (git version)'
arch=('any')
url='https://github.com/cdown/srt/'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
provides=('python-srt')
conflicts=('python-srt' 'python-pysrt')
source=('python-srt'::'git+https://github.com/cdown/srt.git')
sha256sums=('SKIP')

pkgver() {
    git -C python-srt describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd python-srt
    python -m build --wheel --no-isolation
}

check() {
    cd python-srt
    pytest
}

package() {
    python -m installer --destdir="$pkgdir" python-srt/dist/*.whl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/srt-${pkgver/.r*/}.dist-info/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
