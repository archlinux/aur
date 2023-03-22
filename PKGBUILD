# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=distro
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgdesc="Linux Distribution Properties"
url="https://cran.r-project.org/package=${_cranname}"
license=("Apache")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)

# tests fail in chroot (cannot detect distro)

# checkdepends=(
#     "${optdepends[@]}"
#     "r-testthat"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c3b4cd68b4b46fb57067fb49eb4bf65293d7aab94ca3dedc9a1a6044204bda74aad35316daed57d330084b661cd76a9a5f7890d42bbff3f191a42f46ab330b94")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

# check() {
#     R_LIBS="build/" R CMD check --no-manual --as-cran "${_cranname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
