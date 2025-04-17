# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname="gmanedit"
pkgver=0.4.2
pkgrel=1
pkgdesc="Gnome Manual Pages Editor is an editor for man pages that runs on X using the GTK+ libraries"
arch=('x86_64')
url="https://sourceforge.net/projects/gmanedit2"
license=('GPL-2.0-or-later')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk2>=2.10' 'zlib')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname}2/${_pkgsrc}.tar.gz"
        "${pkgname}_translate_german.patch"
        "${pkgname}_gtk2_link_zlib.patch"
        "${pkgname}_menu_typo.patch"
        "${pkgname}_wizard_buffer_overflow.patch"
        "${pkgname}_translate_spanish.patch"
        "${pkgname}_desktop_utf8.patch"
        "${pkgname}_gtk2_file_save_dialog.patch"
        "${pkgname}_gtk2_deprecated.patch")
sha256sums=('fbfaa424653b9287ca2994293bab03d51fa4957cdb7e974360f50c4ab2c76170'
            '356701200771afc72fab4c020bf9816590cd24853ae9078883d1a2bd58a24fb2'
            'b3ee61f55b757ff23d503c3d9e3f13e1a8f7b822e41aa16a42d10af52bd53628'
            '35a7f785746c35d1cf892c9fa4d79b07bcf318efb5c752d19d2b3ced4f2b4b08'
            '1ce17c8dc191995f479bd1966509a9ae22542c2bfd1ec7d3ad7c220fa3f00bcb'
            '6400aea925e471a123eab948f383df2489ca0ebccdfdeb13ebcfe8dd3f492f97'
            'f9799446a6b6c5e70e66e6fd11b295fadb2db65336c638a60a24c7b744753c27'
            '7e252654604d6f43018da7ad278dd7858864981e351c1e709d378bf65a591daf'
            'ac34ca8286db9dba271046c341634adb635b4a59f58693029fb95479d2e4f127')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_translate_german.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gtk2_link_zlib.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_menu_typo.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_wizard_buffer_overflow.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_translate_spanish.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_desktop_utf8.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gtk2_file_save_dialog.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gtk2_deprecated.patch"
}

build() {
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"
  # export LDFLAGS+=" -Wl,--copy-dt-needed-entries"

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "TODO"      "${pkgdir}/usr/share/doc/${pkgname}/TODO"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
