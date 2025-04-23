# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-git
pkgver=r110.ba2bb3b
pkgrel=1
pkgdesc="Cut videos using a text editor.用文本编辑器剪视频."
arch=('any')
url="https://github.com/mli/autocut"
license=('Apache-2.0')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    'ffmpeg'
    'python-importlib-metadata'
    'python-setuptools'
    'opencc'
    'python-tqdm'
    'python-numpy'
    'python-openai'
)
makedepends=(
    'git'
    'python-pipx'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    python setup.py build
}
package() {
    cd "${srcdir}/${pkgname//-/.}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}