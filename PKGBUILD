# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="mp3splt-gtk"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.2
pkgrel=7
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('any')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'graphviz' 'gstreamer>=1.0' 'gtk3>=3.4.2'
             'libaudclient>=3.0' "libmp3splt=${pkgver}") # 'gnome-doc-utils'
# checkdepends=('cutter-test')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${pkgbase}_fix_gcc10_-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/media-sound/${pkgbase}/files/${_pkgsrc}-fno-common.patch?id=500f9cbf8e5c576c893077ca6b3952cbee1b728d"
        "${pkgbase}_fix_ui_manager_c.patch"
        "${pkgbase}_fix_doxyfile_in.patch")
b2sums=('b49a246eeb03d11ec8d4c8968323c62e200439af5d2cb52321442365615b20444908f4c33e6bddeec4051fc320f303b98a1d341bc834ec768bc4d803d2fb5be8'
        '2a2368bab0d06b3c347bdce2a7c19a4b1707f405716dfa7c603b65ad085a001ecd29727c4ff8ca5c4c21c2371cab5b377a106a60f396850128d753f76d6a43d1'
        'cf782225ba28eef2d7cf4317856a51f77517546e112c96ff3faf38003255ff79673b46f16ef24c7a5df50586e6709161e9456ffd29ccb25dac2ab4428100ffaa'
        'de6898021a80d10d533674767833c33de4d62d2fb22c35c6311b44d232981e27960b4b80f8c464bbf92e44f630d6bacea7490d180ed241e859a6a473947da4eb')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
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
    --disable-cutter \
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
