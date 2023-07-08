# Maintainer: fuero <fuerob@gmail.com>

_branch=master
_pkgname=git-whoknows
# renovate: pkgName=https://github.com/Arrowbox/git-whoknows depName=git-whoknows-git
_commit="8d82f4251d26d5417dbce85eb072f3396931cf92"
pkgname="${_pkgname}-git"
pkgver=r33.fd6b9c2
pkgrel=1
pkgdesc="Describes who is likely familiar with a file"
arch=('any')
url="https://github.com/Arrowbox/git-whoknows"
license=('GPL3')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('git')
makedepends=('rust')
source=(
	"${pkgname}::git+${url}#branch=${_branch}"
    cargo-update.patch
)
sha256sums=('SKIP'
            'ac19bf91ff544d84fd1553362d79992ee7f910a9ddabac57a2374ac80805d2ac')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}


prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < ${srcdir}/cargo-update.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --release
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
