# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="mp3splt-gtk"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.2
pkgrel=6
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('any')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'graphviz' 'gstreamer>=1.0' 'gtk3>=3.4.2'
             'libaudclient>=3.0' "libmp3splt=${pkgver}") # 'gnome-doc-utils'
# checkdepends=('cutter-test')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${pkgbase}_fix_gcc10_-fno-common.patch::https://sources.debian.org/data/main/m/mp3splt/2.6.2%2B20170630-3.2/debian/patches/20_mp3splt-gtk-0.9.2-fno-common.patch"
        "${pkgbase}_fix_ui_manager_c.patch"
        "${pkgbase}_fix_doxyfile_in.patch")
sha256sums=('2084cc942b5d1aa6ff74848a41d05cb37876cbc74dfdc341ceb424c763887650'
            '6de20db065d668a4f6abe064c4e43129a66605e7baa690e49b946997a517084b'
            '402d261ac26dacede3a19742197e9ed15186a759007536b70b1f05827775ea0e'
            'a34f46d6a52fedd23004466fcafdf45ced74569cc787e7823055ebc8fd9e5bbb')

prepare() {
  cd "${srcdir}"
  find . -name '*.patch' -exec sed -i 's#/mp3splt-gtk/src/#/src/#g' {} +

  cd "${_pkgsrc}"
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
