# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_pkgbase=ccloader
pkgname=ccloader-git
pkgver=r14.2ad8a4f
pkgrel=3
pkgdesc='Burn CC2530/CC2531/CC2540/CC2541 firmware using an Arduino'
arch=('x86_64')
url='https://github.com/RedBearLab/CCLoader'
license=('custom:undecided')
depends=('glibc')
makedepends=('gcc' 'git')
provides=('ccloader')
conflicts=('ccloader')

source=(
  "${pkgname}::git+https://github.com/RedBearLab/CCLoader.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/SourceCode/Linux"
  # shellcheck disable=SC2086 # we need the word splitting
  gcc ${CFLAGS} ${LDFLAGS} main.c -o "${_pkgbase}"
}

package() {
  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}/SourceCode/Linux/${_pkgbase}"

  echo >&2 'Packaging the Arduino sketch'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/Arduino/CCLoader" \
    "${srcdir}/${pkgname}/Arduino/CCLoader/CCLoader.ino"

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" \
    "${srcdir}/${pkgname}/"{CCLoader.jpg,README.md}
}
