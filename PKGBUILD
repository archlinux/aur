# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: libele <libele@disroot.org>

_hgname=zilf
pkgname="${_hgname}-hg"
pkgver=r1694.428d9a205a73
pkgrel=1
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library. (mercurial version)"
arch=('x86_64')
url="https://foss.heptapod.net/zilf/zilf"
license=('GPL-3.0-or-later')
options=('!strip')
provides=("${_hgname}")
conflicts=("${_hgname}")
depends=('libgcc' 'libstdc++' 'glibc')
makedepends=('mercurial' 'dotnet-sdk')

source=("hg+https://foss.heptapod.net/${_hgname}/${_hgname}")
sha256sums=('SKIP')

_getarch-dotnet() {
  local inarch="$1"
  
  case "$inarch" in
    x86_64)
      echo "linux-x64"
      ;;
    *)
      echo "$inarch"
      ;;
  esac
}

pkgver() {
  cd "${srcdir}/${_hgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/${_hgname}"

  local netarch=$(_getarch-dotnet $arch)
  dotnet build Build.proj -t:Stage -p:Configuration=Release -r:"$netarch"
}

package() {
  cd "${srcdir}/${_hgname}"

  local netarch=$(_getarch-dotnet $arch)
  local netver=$(dotnet --version | cut -f-2 -d.)

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/${_hgname}"
  install -dm755 "${pkgdir}/usr/share/${_hgname}"

  rm sample/Samples.proj
  rm zillib/ZilLib.proj

  cp -a "bin/Release/net${netver}"/* "${pkgdir}/usr/lib/${_hgname}"
  cp -a zillib "${pkgdir}/usr/lib/${_hgname}"
  cp -a sample "${pkgdir}/usr/share/${_hgname}"

  for f in zilf zapf; do
    ln -sf "/usr/lib/${_hgname}/${netarch}/$f" "${pkgdir}/usr/bin/$f"
  done
}

