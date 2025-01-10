# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="mp3splt"
_pkgname="${_basename}-gtk"
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=5
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('x86_64' 'i686')
url="https://${_basename}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1'
         'gtk3>=3.4.2' 'libaudclient>=3' "libmp3splt>=${pkgver}")
makedepends=('gzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/${_basename}/${_pkgname}_${pkgver}.unstable_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/${_basename}/${_pkgname}_${pkgver}.unstable_i386.deb")
sha256sums_x86_64=('b6045267021019a6d2347d51792b3d7520e4094509bcfd1d1881d0b0060358b0')
sha256sums_i686=('afbb629eae7ad07fcac8794fb2c90336a80398b1a166e714ad429b4153f93fd7')

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
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"
}
