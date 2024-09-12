# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="playedit"
pkgver=0.1.6+r198+gbf09f69
_commit="bf09f692f151be776efcb72703f9b9b5f6a54419"
pkgrel=1
pkgdesc="A GTK GUI for creating and editing playlists on an MTP (Media Transfer Protocol) device"
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
makedepends=('gnome-common' 'gnome-doc-utils')
depends=('atkmm' 'cairomm' 'gcc-libs' 'glibmm' 'glib2' 'glibc' 'gtkmm3>=3.10'
         'libgudev' 'libsigc++' 'libusb' 'mpg123' 'pangomm')
_pkgsrc="${pkgname}-code-${_commit}"
source=("${_pkgsrc}.zip::https://sourceforge.net/code-snapshots/git/${pkgname::1}/${pkgname::2}/${pkgname}/code.git/${_pkgsrc}.zip"
        "${pkgname}_fix_includes.patch"
        "${pkgname}_gnome-doc-utils.make")
sha256sums=('994884a2c6c3810663e60c05885cdbad74b13cff6f0660d2aefecb839aa1d636'
            '18dae5d947ef01acaaf60bf68a001e435c32d4c0b472967eae12f6742341f9d6'
            '55d437d7f068f991e86c6a726fad7b159ac30716ca25aa2c465ac94976af35db')

prepare() {
  cd "${srcdir}"
  cp -f "${pkgname}_gnome-doc-utils.make" "${_pkgsrc}/gnome-doc-utils.make"
  
  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
