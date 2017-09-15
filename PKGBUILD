# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=movfuscator-git
_pkgver=2
pkgver=${_pkgver}.3273164
pkgrel=2
pkgdesc="The single instruction C compiler"
arch=('x86_64')
provides=('movcc')
conflicts=('movcc')
makedepends=('gcc-multilib' 'git')
url="https://github.com/xoreaxeaxeax/movfuscator"
license=('BSD')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "${_pkgver}.%s" "$(git rev-parse --short HEAD)"
}

build() {
    git -C "${srcdir}/${pkgname}" apply --ignore-space-change --ignore-whitespace "${DIR}/ldargs.patch"
    cd "${srcdir}/${pkgname}"

    ./build.sh
}

package() {
    mkdir -p "${pkgdir}/usr/share/movfuscator/post"
    cp -r "${srcdir}/${pkgname}/post/" "${pkgdir}/usr/share/movfuscator/post"
    find "${pkgdir}/usr/share/movfuscator/post" -type f -name *.py -exec chmod 755 {} \;

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}/build/movcc" "${pkgdir}/usr/share/movfuscator/bin/movcc"
    install -Dm755 "${DIR}/movcc" "${pkgdir}/usr/local/bin/movcc"
}
