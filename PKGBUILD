# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.18.1
pkgrel=2
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('libelf')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=("https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6634a92cfe75d344060d856b4de69d345aa9fde1b39a1f7988e74e59e1d6b9e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Building...'
  make
}

check() {
  # This tomfoolery gets around a bug in 'make test' in flow-0.18.1, but
  # it's safe for any version.
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}${pkgver//\./}"
  cd "${srcdir}/${pkgname}${pkgver//\./}"

  msg 'Checking...'
  make test

  cd "${srcdir}"
  mv "${srcdir}/${pkgname}${pkgver//\./}" "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Installing license...'
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg 'Installing documentation...'
  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -dpr --no-preserve=ownership examples "${pkgdir}/usr/share/doc/${pkgname}"

  msg 'Installing...'
  install -Dm 755 bin/flow "${pkgdir}/usr/bin/flow"
}
