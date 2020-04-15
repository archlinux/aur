# Maintainer: Martin Rys <rys.pw/#contact_me>
# Previous maintainer: Arda Demir <ardadem.dev@gmail.com>
pkgname=a4tech-bloody-driver-git
_pkgname=a4tech-bloody-driver
pkgver=r155.2beb8fe
pkgrel=1
pkgdesc='Linux driver for a4tech bloody mouse series.'
arch=('any')
url='https://gitlab.com/C0rn3j/a4tech_bloody_p85_driver'
license=('AGPL3')
makedepends=('git' 'cmake' 'qt5-base')
provides=('a4tech-bloody-driver')
conflicts=('a4tech-bloody-driver')
source=($pkgname::git+https://gitlab.com/C0rn3j/a4tech_bloody_p85_driver
        '60-bloody.rules')
sha256sums=('SKIP'
            '2ee35d38f86e6f39eb0093d09f75030e478146bc0a56bbdbb45822c77c0e9d18')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake ./
  make
  cd qt
  qmake bloody.pro -spec linux-g++ CONFIG+=qtquickcompiler
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 "${srcdir}/${pkgname}/bloody-cli" "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/bloody-cli"

  install -Dm755 "${srcdir}/${pkgname}/qt/bloody" "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/bloody"

  install -Dm644 "${srcdir}/60-bloody.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
