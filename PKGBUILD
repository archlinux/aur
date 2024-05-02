#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob.shinn@gmail.com> 

pkgname=irker-git
pkgver=2.24.r0.g26866bf
pkgrel=2
pkgdesc='Automated shipping of open-source project releases'
provides=('irker')
conflicts=('irker')
arch=('any')
license=('BSD2')
url="http://www.catb.org/~esr/irker"
makedepends=('gzip' 'asciidoc' 'make')
depends=('python3')
source=("${pkgname}::git+https://gitlab.com/esr/irker")
sha256sums=('SKIP')
docs=('NEWS' 'README' 'irkerd.html' 'irkerhook.html' 'irk.html' 'hacking.html' 'security.html' 'install.html')
examples=('irk' 'irkerhook.py')


pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "${srcdir}/${pkgname}"
  make docs install.html security.html hacking.html
}

package() {  
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" prefix=/usr make install

  install -Dm644 "${srcdir}/${pkgname}"/irkerd.service "${pkgdir}"/usr/lib/systemd/system/irkerd.service
  for doc in ${docs[@]}; do 
    install -Dm644 "${srcdir}/${pkgname}"/$doc "${pkgdir}"/usr/share/doc/irker/$doc
  done
  for example in ${examples[@]}; do 
    install -Dm755 "${srcdir}/${pkgname}/$example" "${pkgdir}/usr/share/doc/irker/examples/$example"
  done
}


