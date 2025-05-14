# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname="aeskulap"
_commit_rel="46f134d854c3b861f0f4dd07cd7b28bcc37260d2" # 0.2.2-beta2
_commit="e710562d45303cd3b5f8c3260f9c1ed6b9648bdc" # r8
pkgver="0.2.2beta2+r8+g${_commit::7}"
pkgrel=2
pkgdesc="Medical image viewer and DICOM client"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/aeskulap"
_url="https://gitlab.com/stefanhusmann/${pkgname}"
license=('GPL-2.0-or-later AND LGPL-2.0-or-later AND custom:Public Domain')
depends=('atkmm' 'dcmtk' 'dconf' 'gcc-libs' 'glib2>=2.2' 'glibc' 'glibmm'
         'gtkmm>=2.6' 'hicolor-icon-theme' 'libglade>=0.29' 'libsigc++'
         'pangomm')
makedepends=('intltool>=0.25')
options=('!lto')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_newDicomElement_member_of_DcmItem.patch"
        "${pkgname}_gsettings_configuration_storage.patch"
        "${pkgname}_remove_gconf_schemas.patch") 
b2sums=('5c0ecea466912ffb13e33347ee8805177b36a4e43202b8fcb9f7e5da2b11f673976adcef04d27c4969987c600407e97a9271f052ff2b8878db3dc4fe01cd0a32'
        'fa03f307a84e3ac6f051ec677a3e311f5d76a61bf449e40ecb795b36fdf0cb2701cae287e345e5ab7c7c9fceb8d5e752e2e010b7e370b369060b4cd9bb7819d7'
        'c6768b4f917e53fd9f165e5cb0daf841efa7114a69a5cdaf8e413eed14a24cc155b7a15cca7fb95014cee7de90c64c0bba99b0d88d9818f313f7a6f0a2ef0880'
        'f49223f5d4b37bddc3b3fbebe4a42c5e3aafbe7a773b1e80409ac3bea8cfb22b3b238d4c6ce395c46b2357e5c8cb9922bd78c92f6ac7e0b036b2006279f09003')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_newDicomElement_member_of_DcmItem.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gsettings_configuration_storage.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_remove_gconf_schemas.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  # ./autogen.sh \
  #   --prefix='/usr'
  libtoolize
  autoreconf -vfi -I /usr/share/gettext/m4
  ./configure \
    --prefix='/usr'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"     "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog"   "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  # install -vDm644 "NEWS"        "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"      "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING"     "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -vDm644 "COPYING.LIB" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"
}
