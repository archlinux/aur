# Maintainer: xeruf <27jf at pm dot me>

_pkgname=context
pkgname=${_pkgname}-modules
pkgver=2022.08.25_19.21
pkgrel=1
pkgdesc='ConTeXt LMTX with all ConTeXt Garden modules'
arch=('x86_64')
url="https://wiki.contextgarden.net/Installation"
license=(GPL)
depends=()
replaces=()
provides=(${_pkgname} ${_pkgname}-lmtx)
conflicts=()
optdepends=()
source=("http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip")
sha256sums=(SKIP)

prepare() {
  cd "${srcdir}"

  # https://wiki.contextgarden.net/Modules#ConTeXt_LMTX
  # Synchronize all modules from the ConTeXt Garden in the directory 'modules' which is created if it doesn't exist.
  rsync -rltv --del rsync://contextgarden.net/minimals/current/modules/ modules
  # Create the union of all modules in tex/texmf-modules (the directory is created if it doesn't exist).
  # If you have personal modules in tex/texmf-modules, they won't be modified.
  mkdir -p tex
  rsync -rlt --exclude=/VERSION --del modules/*/ tex/texmf-modules

  chmod +x install.sh
  ./install.sh
}

package() {
  context="${pkgdir}/usr/share/texmf-dist"
  cd "tex"

  install -d "$context"
  cp -r texmf texmf-context "$context"
  install -Dt "${pkgdir}/usr/local/bin" texmf-linux-64/bin/*
}

pkgver() {
  cat "${srcdir}/tex/texmf-context/tex/context/base/mkxl/context.mkxl" |
    grep "def\\\\contextversion" |
    sed 's/^.*{\(.*\)}.*$/\1/' |
    tr ' :' '_.'
}
