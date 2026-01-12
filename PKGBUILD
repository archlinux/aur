# Maintainer: Jake <aur@ja-ke.tech>

# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Maks Verver <maksverver@geocities.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: nokangaroo <nokangaroo@aon.at>

pkgname=golly
pkgver=5.0
pkgrel=1
pkgdesc="A simulator for Conway's Game of Life and other cellular automata"
arch=('i686' 'x86_64')
url="http://golly.sourceforge.net/"
license=('GPL')
depends=('wxwidgets-gtk3' 'glu' 'sdl2')
makedepends=('python-setuptools')
optdepends=('python3: for Python scripting support')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz"
        "golly.desktop")
md5sums=('f166dca937b111f02190814276e9d1d5'
         'bf54bb7268dcba539162ee106d2a5063')
sha1sums=('53274a51b244b2ab778b460503e5a5151103ba71'
          'e8fefda400ca3094d7457e8ad45d2314e910ca85')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/gui-wx/"

  cat >local-gtk.mk <<EOF
GOLLYDIR=/usr/share/golly
CXXFLAGS=${CXXFLAGS}
LDFLAGS=${LDFLAGS}
EOF
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/gui-wx/"

  make -f makefile-gtk
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/"

  install -d "${pkgdir}"/usr/bin
  install bgolly golly "${pkgdir}"/usr/bin/

  install -d "${pkgdir}"/usr/share/doc/golly
  install -m644 docs/License.html docs/ReadMe.html "${pkgdir}"/usr/share/doc/golly/

  find Help Patterns Rules Scripts -type f | while read file; do
    install -D -m644 "${file}" "${pkgdir}/usr/share/golly/${file}"
  done

  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 gui-wx/icons/appicon.xpm \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}
