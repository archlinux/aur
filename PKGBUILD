# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="mp3splt-gtk"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.2
pkgrel=5
pkgdesc="Split mp3, ogg, and flac files without decoding"
arch=('any')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'graphviz' 'gstreamer>=1.0' 'gtk3>=3.4.2'
             'libaudclient>=3.0' "libmp3splt=${pkgver}") # 'gnome-doc-utils'
# checkdepends=('cutter-test')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${pkgname}_fix_ui_manager_c.patch"
        "${pkgname}_fix_splitpoints_window_h.patch"
        "${pkgname}_fix_doxyfile_in.patch")
sha256sums=('2084cc942b5d1aa6ff74848a41d05cb37876cbc74dfdc341ceb424c763887650'
            '402d261ac26dacede3a19742197e9ed15186a759007536b70b1f05827775ea0e'
            'ec328ba914d7321e6738180deba607fbc158371a8a8b590c3be3c2a3ee28713b'
            'a34f46d6a52fedd23004466fcafdf45ced74569cc787e7823055ebc8fd9e5bbb')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  cd "doc"
  sed -i 's/#//g' "Makefile.am"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  autoupdate
  ./configure \
    --prefix='/usr' \
    --enable-gstreamer \
    --enable-audacious \
    --disable-gnome # https://aur.archlinux.org/packages/gnome-doc-utils#comment-964738
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/test"
#   ./run-tests.sh
# }

package_mp3splt-gtk() {
  arch=('x86_64')
  depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1.0'
           'gtk3>=3.4.2' 'libaudclient>=3.0' "libmp3splt=${pkgver}")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/doc"

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgbase}/AUTHORS"
}

package_mp3splt-gtk-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/doc"
  make DESTDIR="${pkgdir}" install-data-local
}
