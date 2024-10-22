# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt-gtk"
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=4
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('x86_64' 'i686')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1.0'
         'gtk3>=3.4.2' 'libaudclient>=3.0' "libmp3splt=${pkgver}")
makedepends=('gzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.jessie_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.jessie_i386.deb")
sha256sums_x86_64=('a02e0474f5466246decca28afba518ffd0590f999835ecc0924ccc30ba6f1c42')
sha256sums_i686=('706cb2d315c49a709e163ba1842dbb6c0d8723991c0de9df88d8e7808dfc3bd3')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share/doc"
  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright* INSTALL
}

package() {
  cd "${srcdir}"
  cp -r --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
}
