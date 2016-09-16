# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=KTOP
pkgname=ktop-git
pkgver=r25.0239d1e
pkgrel=1
pkgdesc='Make Persian EPUBs compatible to E-Readers such as Kindle'
url='https://github.com/al1b/KTOP'
license=('GPL')
source=('git+https://github.com/al1b/KTOP.git' 'project.json' 'ktop')
sha256sums=('SKIP'
            '7188af436bf7f392ab31252010a8f20d728d70824d29c5f952dd06f449bfb71d'
            '15190d1c90ea9bc363104e62a321b6c01e46b1a6df22a59bdd8436b4dd2e05e4')
arch=('any')
depends=('dotnet-cli')
makedepends=('git')
conflicts=('ktop')
provides=('ktop')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cp -f "${srcdir}/project.json" "${srcdir}/${_pkgname}/src/KTOP.CLI/project.json"
  cd "${srcdir}/${_pkgname}"
  dotnet restore
  cd 'src/KTOP.CLI'
  dotnet publish
  install  -d "${pkgdir}/usr/share/${_pkgname}"
  cp -ar "${srcdir}/${_pkgname}/src/KTOP.CLI/bin/Debug/netcoreapp1.0/publish/." "${pkgdir}/usr/share/${_pkgname}"
  install -Dm755 "${srcdir}/ktop" "${pkgdir}/usr/bin/ktop"
}
