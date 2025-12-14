# Maintainer: taotieren <admin@taotieren.com>

pkgbase=un-lock-git
pkgname=miunlocktool-git
pkgver=1.6.0.r1.g11ded91
pkgrel=2
pkgdesc="MiUnlockTool developed to retrieve encryptData(token) for Xiaomi devices for unlocking bootloader, It is compatible with all platforms."
arch=(any)
url="https://github.com/offici5l/MiUnlockTool"
license=('Apache-2.0')
provides=(${pkgname%-git} ${basename%-git})
conflicts=(${pkgname%-git} ${basename%-git})
replaces=()
_pydeps=(
    colorama
    requests
    urllib3
    pycryptodomex
    termcolor)
depends=(
    android-tools
    python
    "${_pydeps[@]/#/python-}")
makedepends=(git
    python-{setuptools,build,installer,wheel}
)
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+${url}.git"
    "${pkgname}.install")
sha256sums=('SKIP'
    '155ed2934db9f99cf14c7df7e72f8e1f0ff062d8e1708739f6a838179f96ace6')

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
}

build() {
    cd "${srcdir}/${pkgname}"
    #     rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
