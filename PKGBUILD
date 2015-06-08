
# Maintainer: Matteo De Carlo <matteo.dek AT gmail DOT com>
pkgname=pencil-material-icons-git
pkgver=1.1.0.r0.g47d2800
pkgrel=2
pkgdesc="All 700+ of Google's Material Design Icons as a Pencil stencil collection."
arch=(any)
url="https://github.com/nathanielw/Material-Icons-for-Pencil/"
license=
depends=('pencil')
makedepends=('pacman>=4.1.2' 'git' 'python' 'python-lxml' 'python-cairosvg')
install=
changelog=
_name="Material-Icons-for-Pencil"
source=("git+https://github.com/nathanielw/${_name}.git")
noextract=()
md5sums=('SKIP') 
_installdir="/usr/share/evolus-pencil/content/pencil/stencil/"

pkgver() {
  cd ${_name}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Downloading material-design-icons submodule
  cd "$srcdir/${_name}"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/${_name}"
  python3 generate-xml.py
}

package() {
  DESTDIR="${pkgdir}/${_installdir}"
  cd "${srcdir}/${_name}/gen"
  
  install -m644 -Dt "${DESTDIR}/${_name}" Definition.xml
  install -m644 -Dt "${DESTDIR}/${_name}/icons" icons/*
}
