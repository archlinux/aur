# Maintainer: Duarte David <deltaduartedavid@gmail.com>
# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-git'
pkgver=r721.43401f2
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go (master branch / unstable)'
url='https://github.com/xenolf/lego'
arch=('x86_64' 'i686')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname}")

_gourl=github.com/xenolf/lego

depends=()
makedepends=('git' 'make')
# makedepends=('git' 'make' 'go')

source=('git+https://github.com/xenolf/lego.git')
sha512sums=('SKIP')

prepare() {
  # setup go env vars
  export GOPATH="${srcdir%/src}"

  mkdir -p "${srcdir}/github.com/xenolf/" && cd $_
  mv ${srcdir}/lego .
}

pkgver() {
  cd "${srcdir}/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gourl}"
  make build
}

package() {
  # Bin
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "${srcdir}/${_gourl}/dist/lego" "${pkgdir}/usr/bin"

  # License
  install -Dm644 "${srcdir}/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
