# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hc2c"
pkgname="${_pkgname}-git"
pkgver=r54.fd56921
pkgrel=1
pkgdesc="A HolyC to regular C translator"
arch=('x86_64')
url='https://github.com/IridescentRose/HolyC-Translator'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="HolyC-Translator"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "bin" "out"
  
  cd "src"
  find . -name "*.c" -exec sed -i -E 's/calloc\((sizeof\([^)]+\)), *([^)]+)\)/calloc(\2, \1)/g' {} +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} -std=gnu99 src/*.c src/tokenizer/*.c src/parser/*.c ${LDFLAGS} -o "bin/${_pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} -std=gnu99 tests/tester.c ${LDFLAGS} -o "bin/tester"
  ./bin/tester
  # make valgrind
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
