# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="playedit"
_commit_rel="f1b69def2d34e850f8526ffb606f73948d43bcf9" # 0.1.6
_commit="bf09f692f151be776efcb72703f9b9b5f6a54419" # r198
pkgver="0.1.6+r198+g${_commit::7}"
pkgrel=2
pkgdesc="A GTK GUI for creating and editing playlists on an MTP (Media Transfer Protocol) device"
arch=('x86_64')
url="https://playedit.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('atkmm' 'cairomm' 'gcc-libs' 'glibmm' 'glib2' 'glibc' 'gtkmm3>=3.10'
         'libgudev' 'libsigc++' 'libusb' 'mpg123' 'pangomm')
makedepends=('git' 'intltool') # 'gnome-common' 'gnome-doc-utils'
_pkgsrc="${pkgname}"
source=("${_pkgsrc}::git+https://git.code.sf.net/p/${pkgname}/code#commit=${_commit}"
        "${pkgname}_include_string.patch")
b2sums=('7a7ec83e627757478fa74e58a84902b50170d0d926d70bb84b758ecd9bbaa4617e9fa9fb42b9e1dcd8aba5a6bc6ff23f78d100256105bc1099ab43578d335c81'
        '7f8feb796563f24f0eda4da408e689050c57ec65571e63b87d6ba7b7d8af7fc87d5de1f68e8e61cd6683ccdc35930baaba8db7c29ffd5973e26b03c8ace01b2c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_include_string.patch"
  sed -e 's/ -O2//g' \
      -e '/GNOME_DOC_INIT/d' \
      -e '/help\//d' \
      -i 'configure.ac'
  sed -e 's/gnome-doc-utils.make//g' \
      -e 's/help//g' \
      -i 'Makefile.am'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  # ./autogen.sh
  libtoolize
  autoreconf -vfi -I /usr/share/gettext/m4
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

  install -Dm644 "AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "NEWS"    "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
