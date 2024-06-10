# Maintainer: H3mul <phil.d324@gmail.com>
_pkgname=lfs-s3
pkgbase=${_pkgname}
pkgname=${_pkgname}-git
pkgver=0.1.5.r45.g18ab884
pkgrel=1
pkgdesc="A tiny (~300 SLOC) Custom Transfer Agent for Git LFS which simply sends LFS binary files to an S3 bucket."
arch=('x86_64')
url="https://github.com/nicolas-graves/lfs-s3.git"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=()
makedepends=('git' 'go')
options=('strip' '!debug')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
   cd ${_pkgname}
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd ${_pkgname}

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    go build .
}

package() {
    cd ${_pkgname}
    install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 Readme.md "${pkgdir}/usr/share/doc/${_pkgname}/Readme.md"
}
