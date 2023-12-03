# Maintainer: shyam (shyamganesh01@gmail.com)

_base=PEASS-ng
pkgname=peass-ng
pkgver=9cdcb38f
_pkgver=20230903
pkgrel=1
pkgdesc="Privilege Escalation Awesome Scripts SUITE new generation"
arch=(any)
url="https://github.com/carlospolop/PEASS-ng"
license=(MIT)
source=("LICENSE::https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/LICENSE")
makedepends=('git' 'github-cli')
sha512sums=('4b7e5df3047455f4ecd4e81af40f12f243f80ef66d460dd15c8ed41be0929d344113d0ce2862b6fd51ae096a2e4da11af2797da4b1acbf9f4308653bc4211da4')
conflicts=('peass')
provides=('peass-ng')

pkgver() {
  gh release view -R carlospolop/PEASS-ng --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -d '-' -f 2
}

prepare() {
  gh release download --pattern '*' -D release -R ${url} --clobber 
}

package() {

  cd release

  # Install to /usr/share/peass-ng 

  ## Linux
  find . -name "lin*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/linux/{}" \;

  ## Windows
  find . -name "win*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/windows/{}" \;

  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

