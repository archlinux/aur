# Maintainer: Jake <aur@ja-ke.tech>

# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Maks Verver <maksverver@geocities.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: nokangaroo <nokangaroo@aon.at>

pkgname=golly
pkgver=4.2
pkgrel=1
pkgdesc="A simulator for Conway's Game of Life and other cellular automata"
arch=('i686' 'x86_64')
url="http://golly.sourceforge.net/"
license=('GPL')
depends=('wxwidgets-gtk3' 'glu' 'sdl2')
makedepends=('perl' 'python3')
optdepends=('perl: for Perl scripting support'
            'python3: for Python scripting support')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz"
        "golly.desktop")
md5sums=('bb8d61dc6302df517d216310ba29780f'
         'bf54bb7268dcba539162ee106d2a5063')
sha1sums=('199c426047a573f9f0a82214bc77de99ed15080f'
          'e8fefda400ca3094d7457e8ad45d2314e910ca85')

build() {
  # Hacky way to get location of libperl.so used by perl interpreter
  PERL_SHLIB=$(ldd "$(which perl)" | grep 'libperl\.so' | awk '{print $3}')
  test -x "${PERL_SHLIB}" || (echo 'libperl.so not found' && false)

  cd "${srcdir}/${pkgname}-${pkgver}-src/gui-wx/"

  cat >local-gtk.mk <<EOF
GOLLYDIR=/usr/share/golly
CXXFLAGS=${CXXFLAGS}
LDFLAGS=${LDFLAGS}
ENABLE_PERL=1
EOF

  make -f makefile-gtk PERL_SHLIB="${PERL_SHLIB}"
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
