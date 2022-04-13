# maintainer: libele <libele@disroot.org>

pkgname=zilf-hg
_hgname=zilf
pkgver=r1131.52ca05feed88
pkgrel=1
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library. (mercurial version)"
arch=('x86_64')
url="https://foss.heptapod.net/zilf/zilf"
license=('GPL')
options=('!strip')
provides=('zilf')
conflicts=('zilf')
makedepends=('dotnet-sdk')
source=("hg+https://foss.heptapod.net/zilf/zilf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_hgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/${_hgname}"
  dotnet msbuild Build.proj -t:Stage -p:Configuration=Release
}

package() {
  cd "${srcdir}/${_hgname}"

  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}/usr/lib/${_hgname}"
  install -dm755 "${pkgdir}/usr/share/${_hgname}"

  rm sample/Samples.proj
  rm zillib/ZilLib.proj

  cp -a bin/Release/net5.0/* "${pkgdir}/usr/lib/${_hgname}"
  cp -a zillib "${pkgdir}/usr/lib/${_hgname}"
  cp -a  sample "${pkgdir}/usr/share/${_hgname}"

  ln -sf /usr/lib/"${_hgname}"/Zilf "${pkgdir}"/usr/bin/zilf
  ln -sf /usr/lib/"${_hgname}"/Zapf "${pkgdir}"/usr/bin/zapf
}
