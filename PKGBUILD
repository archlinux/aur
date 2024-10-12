# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gjay"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="DJ-friendly GUI for generating playlists across large music collections"
arch=('x86_64' 'aarch64' 'armhf' 'i686')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('patchelf')
depends=('dbus-glib' 'flac' 'gdk-pixbuf2' 'glib2' 'glibc' 'gsl' 'gtk2'
         'libaudclient' 'mpg123' 'pango')
optdepends=('audacious: small and fast audio player which supports lots of formats'
            'libmpdclient: Music Player Daemon'
            'vorbis-tools: support .ogg files')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armhf,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-1.2+b2_amd64.deb")
source_aarch64=("${_pkgsrc}-aarch64.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-1.2+b2_arm64.deb")
source_armhf=("${_pkgsrc}-armhf.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-1.2+b2_armhf.deb")
source_i686=("${_pkgsrc}-i686.deb::http://ftp.debian.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}-1.2+b2_i386.deb")
sha256sums_x86_64=('cdd7af9a0c946a339d708862c169b329f1c6a5fcde653dcf2a7743c0ea41e7d6')
sha256sums_aarch64=('451aa31088aea4a9e50fbb7a4d4594d9e4f4a965d3bd57ae3e6f598023f6a82e')
sha256sums_armhf=('8faf62829ed39b924e3bc5103b6d70c3073493c8201ffc5139d0dc1bde295563')
sha256sums_i686=('6ea584305e8e1c6ecdcc96dd2b15e0712e0fddaa0788691894251a627f186716')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/bin"
  local libraries=(
    "libatk-1.0.so.0"
    "libcairo.so.2"
    "libdbus-1.so.3"
    "libdl.so.2"
    "libfontconfig.so.1"
    "libfreetype.so.6"
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
  rm -f changelog.* ChangeLog.* copyright INSTALL NEWS.* *.Debian*
}
