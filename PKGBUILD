# Maintainer: Jef Roosens

_pkgname='ved'
pkgname='ved-git'
pkgver=r288.b9f8745
pkgrel=1
pkgdesc='1 MB text editor written in V with hardware accelerated text rendering (development version)'
arch=('x86_64')
url='https://github.com/vlang/ved'

depends=(
    'glibc' 'libx11' 'libglvnd' 'libxcursor' 'libxi' 'gcc-libs' 'libxcb'
    'libxrender' 'libxfixes' 'libxext' 'libxau' 'libxdmcp'
)
makedepends=('git' 'vlang-git')

source=("${_pkgname}::git+https://github.com/vlang/ved")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"

    commit_count="$(git rev-list --count HEAD)"
    commit="$(git rev-parse --short HEAD)"

    echo "r${commit_count}.${commit}"
}

build() {
    cd "${_pkgname}"

    v -cc "${CC:-gcc}" -prod -o ved .
}

package() {
    # ved reads its hardcoded font file from the V resource path. If
    # V_RESOURCE_PATH is not defined, this path is equal to the directory where
    # the called binary resides. Therefore, we install the binary and its font
    # file in /usr/lib and symlink the binary to /usr/bin.
    install -Dm755 "${_pkgname}/ved" "${pkgdir}/usr/lib/${_pkgname}/ved"
    install -m755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/ved" "${pkgdir}/usr/bin/ved"

    # ved uses a hardcored font, provided in the repository.
    install -Dm644 "${_pkgname}/RobotoMono-Regular.ttf" "${pkgdir}/usr/lib/${_pkgname}/RobotoMono-Regular.ttf"
}
