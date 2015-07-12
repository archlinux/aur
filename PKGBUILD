# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-bin
pkgver=38.1.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk-update-icon-cache'
         'gtk2' 'hicolor-icon-theme' 'libnotify' 'libpng' 'libvpx' 'libxt' 'mime-types' 'nss' 'pixman'
         'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
makedepends=('pacman>=4.2.0')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
install=$pkgname.install
source=("$pkgname.desktop"
        "$pkgname-safe.desktop"
        'vendor.js')
source_i686=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2")
md5sums=('6c94c2e7f041c5c947af1ed958c0d227'
         '00fef0a11f3643454a1af66bb7e4af35'
         '5a53179d14ae9631b7afe5e4d0fc0b25')
md5sums_i686=('5e4cbf39f2b775c056d8ce0239287c74')
md5sums_x86_64=('325603a1bd10c728a36f032c9c8661e8')
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/candidates/$_major-candidates/build$_build/linux-i686/en-US/thunderbird-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/thunderbird-$_major.tar.bz2")
fi

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/$pkgname-$pkgver
  install -m644 vendor.js "$pkgdir"/opt/$pkgname-$pkgver/defaults/pref/

  # /usr/bin symlink
  ln -s /opt/$pkgname-$pkgver/thunderbird "$pkgdir"/usr/bin/thunderbird-beta

  # Desktop
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname-$pkgver/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done
}