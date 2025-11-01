# Maintainer: shyam (shyamganesh01@gmail.com)

_base=PEASS-ng
pkgname=peass-ng
pkgver=a416400b
_pkgver=20230903
pkgrel=1
pkgdesc="Privilege Escalation Awesome Scripts SUITE new generation"
arch=(any)
url="https://github.com/carlospolop/PEASS-ng"
license=(MIT)
source=("LICENSE::https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/LICENSE")
makedepends=('git' 'github-cli')
sha512sums=('1f9d4f39fad4f77c6952653cd2689a18ee70ae32d3b8dcecc4dc53cb2a5bd9a51209985dd759fc316cb87040ae3f77a0f31b887f9ae97830f4090b1d7d4ca9c5')
conflicts=('peass')
provides=('peass-ng')

pkgver() {
  GH_HOST=randomdomain gh release view -R github.com/carlospolop/PEASS-ng --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -d '-' -f 2
}

prepare() {
 GH_HOST=randomdomain gh release download --pattern '*' -D release -R ${url} --clobber 
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

