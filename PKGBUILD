# Maintainer: fuero <fuerob@gmail.com>

pkgname=cwordle-git
_pkgname=cwordle
pkgver=r18.87322fe
pkgrel=1
pkgdesc='Wordle clone for Unix Terminals in C'
arch=('x86_64')
url="https://github.com/velorek1/${_pkgname}"
license=('MIT')
makedepends=('gcc' 'cmake' 'git')
depends=('glibc')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cmake -B build -S "${srcdir}/${_pkgname}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

