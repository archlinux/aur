# Maintainer: Jeffrey Zhang zhang.lei.fly@gmail.com
pkgname=assh-git
_pkgname=assh
pkgver=2.15.0.r20.gec4ba625
pkgrel=1
pkgdesc='make your ssh client smarter https://manfred.life/assh'
arch=('any')
url='https://github.com/moul/assh.git'
license=('MIT')
depends=()
makedepends=('git' 'go')
conflicts=()
provides=('assh')
source=("git+https://github.com/moul/assh.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    version=$(git describe --tags --always)
    vcs_ref=$(git rev-parse --short HEAD)
    GOPATH=${srcdir} \
        GO111MODULE=on \
        go build \
        --ldflags "-X moul.io/assh/v2/pkg/version.Version=$version -X moul.io/assh/v2/pkg/version.VcsRef=$vcs_ref" \
        -modcacherw -o assh
}

package() {
    cd ${srcdir}/${_pkgname}
    install -Dm755 assh ${pkgdir}/usr/bin/assh
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
