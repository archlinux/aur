# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt-gtk"
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=2
pkgdesc="Split mp3, ogg, and flac files without decoding - GTK3 GUI"
arch=('x86_64' 'i686')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('patchelf')
depends=('cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc' 'gstreamer>=1.0'
         'gtk3>=3.4.2' 'libaudclient>=3.0' "libmp3splt=${pkgver}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb"
           "${_pkgsrc}-i686.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.wheezy_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.wheezy_i386.deb")
sha256sums_x86_64=('2401a8fbd08cff585317ba4a036bbb8007fbbe72e3ef8ba94a72a58e5cc0ba2b')
sha256sums_i686=('f823d03ce7428ea8dbf0d741afdbb38f226e2c1f9e48fd19aa9966f2c254d9b7')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" "data.tar.gz"
  bsdtar -xzf "data.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f "data.tar.gz"

  cd "${_pkgsrc}-${CARCH}/usr/bin"
  local libraries=(
    "libatk-1.0.so.0"
    "libpangocairo-1.0.so.0"
    "libcairo-gobject.so.2"
    "libpango-1.0.so.0"
    "libgthread-2.0.so.0"
    "libdbus-1.so.3"
    "libdl.so.2"
  )
  for lib in "${libraries[@]}"; do
    patchelf --remove-needed "${lib}" "${_pkgname}"
  done
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;

  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  rm -f "changelog.gz" "ChangeLog.gz" "copyright" "INSTALL" "NEWS.gz"
}
