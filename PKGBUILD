# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-micommunitytool-git
_name=${pkgbase#python-}
_name=${_name%-git}
pkgname=(
    python-micommunitytool-git 
    python-micommunity-git 
    python-miapply-git
)
pkgver=1.5.4.r13.g1d5f452
pkgrel=2
pkgdesc="Submitting a request for bootloader unlocking permission from the Mi Community automatically"
arch=(any)
url="https://github.com/offici5l/MiCommunityTool"
_pydeps=(
    requests
    # AUR
    migate
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    python-pytz
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    # AUR
    python-ntplib
)
license=('MIT')
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
    cd "${srcdir}/${_name}/micommunity"
    python -m build --wheel --no-isolation
    cd "${srcdir}/${_name}/miapply"
    python -m build --wheel --no-isolation
}

package_python-micommunitytool-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        python
        # AUR
        miunlocktool
        python-micommunity
        python-miapply
        python-migate
    )
}

package_python-micommunity-git() {
    pkgdesc="for Interacting with the Mi Community"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        python
        # AUR
        python-migate
    )
    cd "${srcdir}/${_name}/micommunity"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-miapply-git() {
    pkgdesc="A cli that automatically submits the Xiaomi bootloader unlock permission request"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        python
        python-requests
        python-ntplib
        python-pytz
        # AUR
        python-micommunity
        python-migate
    )
    cd "${srcdir}/${_name}/miapply"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
