# Maintainer: Ralph Amissah <ralph.amissah@gmail.com>
# sisu-git
_pkgname=sisu
pkgname=("${_pkgname}-git")
pkgdesc="documents - structuring, publishing in multiple formats & search"
pkgver=7.1.5.r0.gf3a5e91
pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git describe --long --tags | sed 's/^[ a-z_-]\+\([0-9.]\+\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g')
}
pkgrel=1
source=("${pkgname}::git://git.sisudoc.org/git/code/sisu.git#branch=upstream")
md5sums=('SKIP')
arch=('any')
url="http://sisudoc.org"
license=('GPL3')
depends=('ruby')
makedepends=('git' 'ruby')
optdepends=(
  'zip: epub & odf:odt files'
  'unzip: epub & odf:odt files (not required)'
  'tree: report directory structure'
  'imagemagick: image support'
  'graphicsmagick: image support'
  'texlive-core: pdf'
  'texlive-latexextra: pdf'
  'texlive-fontsextra: pdf'
  'texlive-langcjk: pdf Chinese Japanese Korean (large optional dependency, comment out if not needed)'
  'sqlite: search, populate sqlite db'
  'ruby-sqlite3: search, populate sqlite db'
  'postgresql: search, populate postgresql db'
  'ruby-pg: search, populate postresql db'
  'ruby-fcgi: search, sample search form'
  'qrencode: qrcodes based on document metadata'
  )
conflicts=('sisu' 'sisu-gem' 'sisu-git-gem')
options=(!emptydirs)
build() {
  cd "${srcdir}/${pkgname}"
  msg "Configuring source..."
  local _rblib="$(ruby -e"require 'rbconfig';print RbConfig::CONFIG['vendorlibdir'].gsub(/^\//,'')")"
  ruby ./setup.rb config --prefix=${pkgdir}/usr \
    --siterubyver=${pkgdir}/${_rblib} \
    --sysconfdir=${pkgdir}/etc
  msg "Running setup..."
  ruby ./setup.rb setup
}
package() {
  msg "Installing files..."
  cd "${srcdir}/${pkgname}"
  ruby ./setup.rb install
}
