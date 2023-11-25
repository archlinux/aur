# Maintainer:
# Contributor: Arun Narayanankutty <n.arun.lifescience@gmail.com>

#: ${_pkgtype:=git}

# basic info
_pkgname="alphaplot"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=1.02
pkgrel=1
pkgdesc="Application for Scientific Data Analysis and Visualization, fork of SciDavis / QtiPlot"
#url="http://alphaplot.sourceforge.net/"
url="https://github.com/narunlifescience/AlphaPlot"
arch=('i686' 'x86_64')
license=('GPL2')

# main package
_main_package() {
  depends=(
    'gsl'
    'hicolor-icon-theme'
    'qt5-datavis3d'
    'qt5-script'
    'qt5-svg'
  )
  makedepends=(
    'boost'
    'cmake'
    'glu'
    'qt5-tools'
  )

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgver="${pkgver%%.r*}"
  _pkgsrc="AlphaPlot-$_pkgver"
  _pkgext="tar.gz"
  source+=("$_pkgname-$_pkgver.$_pkgext"::"$url/archive/refs/tags/$_pkgver.$_pkgext")
  sha256sums+=('90952b2036b9d25b31c0c8fb34c47ff700bb2847234dda42d900070fc60d3c61')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
build() {
  cd "$_pkgsrc"
  # Note: PREFIX is not used
  qmake
  make
}

package() {
  cd "$_pkgsrc"
  # Note: DESTDIR is ignored
  make INSTALL_ROOT="${pkgdir}" install
} 

# execute
_main_package
