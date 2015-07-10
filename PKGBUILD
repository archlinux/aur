# Maintainer: Det
# Contributors: Ner0, alexwizard, thotypous, jdhore, xduugu, randypenguin, bdheeman, AlK

pkgname=chromium-continuous-bin
pkgver=45.0.2454.0.r338261
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Continuous, auto-tested Snapshot builds)"
arch=('i686' 'x86_64')
url="https://build.chromium.org"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet'
            'chromium-pepper-flash-dev: for Pepper Flash plugin [AUR]'
            'google-chrome-dev: for Pepper Flash plugin [AUR]')
provides=('chromium')
install=$pkgname.install
source=('chromium-continuous-bin'
        'chromium-continuous-bin.desktop'
        'LICENSE')
md5sums=('6203259f7a8fe2fa55b64005a202828d'
         '3f2bfd12b55b7153b60ad904207599dd'
         '537e0b52077bf0a616d0a0c8a79bc9d5')

[[ $CARCH = x86_64 ]] && _64="_x64"
_build=$(curl -s "http://commondatastorage.googleapis.com/chromium-browser-continuous/Linux$_64/LAST_CHANGE")
source_i686=("chrome-linux-r$_build.zip::http://commondatastorage.googleapis.com/chromium-browser-continuous/Linux/$_build/chrome-linux.zip")
source_x86_64=("chrome-linux-r$_build.zip::http://commondatastorage.googleapis.com/chromium-browser-continuous/Linux_x64/$_build/chrome-linux.zip")
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
  echo $(chrome-linux/chrome --version | cut -d " " -f2).r$_build
}

package() {
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/chromium-continuous/
  install -d "$pkgdir"/usr/share/man/man1/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Making it nice..."
  # Permissions
  find -type d -exec chmod 755 {} ';'
  find -type f -exec chmod +r {} ';'
  cd chrome-linux
  chmod 755 chrome chrome-wrapper nacl_* xdg-*
  chmod 4755 chrome_sandbox
  cd ..

  msg2 "Moving contents..."
  # Main script
  install -m755 chromium-continuous-bin "$pkgdir"/usr/bin/

  # Rename chrome-sandbox
  mv chrome-linux/chrome{_,-}sandbox

  # Desktop
  install -m644 chromium-continuous-bin.desktop "$pkgdir"/usr/share/applications/

  # Icon
  mv chrome-linux/product_logo_48.png "$pkgdir"/usr/share/pixmaps/chromium-continuous-bin.png

  # Man page
  gzip -9 chrome-linux/chrome.1
  mv chrome-linux/chrome.1.gz "$pkgdir"/usr/share/man/man1/chromium-continuous-bin.1.gz

  # License
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/chromium-continuous/

  msg2 "Installing main directory..."
  mv chrome-linux/ "$pkgdir"/opt/chromium-continuous
}
