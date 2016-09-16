# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=KTOP
pkgname=ktop-git
pkgver=1.5.1b.r4.g38c9bfa
pkgrel=1
pkgdesc='Make Persian EPUBs compatible to E-Readers such as Kindle'
url='https://github.com/al1b/KTOP'
license=('GPL3')
source=('git+https://github.com/al1b/KTOP.git' 'project.json' 'ktop')
sha256sums=('SKIP'
            '7188af436bf7f392ab31252010a8f20d728d70824d29c5f952dd06f449bfb71d'
            '15190d1c90ea9bc363104e62a321b6c01e46b1a6df22a59bdd8436b4dd2e05e4')
arch=('any')
depends=('dotnet-cli')
makedepends=('git')
conflicts=('ktop')
provides=('ktop')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -f "${srcdir}/project.json" "${srcdir}/${_pkgname}/src/KTOP.CLI/project.json"
}

build() {
  cd "${srcdir}/${_pkgname}"
  dotnet restore
  cd 'src/KTOP.CLI'
  dotnet publish
}

package() {
  install  -d "${pkgdir}/usr/share/${_pkgname}"
  cp -ar "${srcdir}/${_pkgname}/src/KTOP.CLI/bin/Debug/netcoreapp1.0/publish/." "${pkgdir}/usr/share/${_pkgname}"
  install -Dm755 "${srcdir}/ktop" "${pkgdir}/usr/bin/ktop"
}
