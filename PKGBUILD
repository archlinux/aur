# Maintainer: LA-MJ <4mr.minj+aur [at] g-mail>
# based on modified PKGBUILD for firefox-beta-bin by Det et al

pkgname=firefox-unbranded-bin
_pkgname=firefox-unbranded
_name=firefox
pkgver=51.0.2.1486638562
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Unbranded version (binary)"
arch=('x86_64')
url="https://wiki.mozilla.org/Add-ons/Extension_Signing#Latest_Builds"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
provides=("firefox=$pkgver")
conflicts=("firefox"
           "firefox-unbranded")
install=$pkgname.install
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')
_rooturl="https://archive.mozilla.org/pub/firefox/tinderbox-builds/mozilla-release-linux64-add-on-devel"
#_lasttmstmp=1483009537
_lasttmstmp=$(curl -s "${_rooturl}/" | grep -Po '(?<=/)\d+(?=/")' | sort -n | tail -n1)
_srcurl="${_rooturl}/${_lasttmstmp}"
_pkgver=$(curl -s "${_srcurl}/" | grep -Pom1 "(?<=/${_name}-)[\w.]+(?=\.en-US)")
_file="${_name}-${_pkgver}.en-US.linux-x86_64-add-on-devel"
_sha512sum=$(curl -s "${_srcurl}/${_file}.checksums" | grep "${_file}.tar.bz2" | grep sha512 | cut -d ' ' -f1)
source=("$pkgname.desktop"
        "$pkgname-safe.desktop")
source_x86_64=("${_srcurl}/${_file}.tar.bz2")
sha512sums=('88849a4d75ed528e21272364461c70a968fc92b661d1dd5007ff54aff11080d2555666cdddd34f0969e2b4bd4d9e1f588133a073323c646b507bc2be6a4e2b23'
            'cfc78bb8dbf4bff0da690ff185e9c27ad1cdfc742d8c65aebba22e711aefb634a55c9d941bcc3c46e4e17d515fdefd3a8bb1b4d61cb946ccda0854041181c3fb')
sha512sums_x86_64=("${_sha512sum}")

pkgver() {
	echo "${_pkgver}.${_lasttmstmp}"
}

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # /usr/bin symlinks
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$_name
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_name.png
  done

  # 128x128
  ln -s /opt/$_pkgname/browser/icons/mozicon128.png \
        "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$_name.png
}
