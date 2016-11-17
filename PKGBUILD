# Maintainer: Det
# Contributors: Ner0, alexwizard, thotypous, jdhore, xduugu, randypenguin, bdheeman, AlK

pkgname=chromium-snapshot-bin
pkgver=54.0.2829.0.r411883
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Latest Snapshot)"
arch=('x86_64')
url="https://build.chromium.org"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme'
         'gconf')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet'
            'pepper-flash: for Pepper Flash plugin [AUR]')
provides=('chromium')
install=$pkgname.install
_build=$(curl -s "http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/LAST_CHANGE")
source=("chrome-linux-r$_build.zip::http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/$_build/chrome-linux.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname"_{16,22,24,32,48,64,128,256}.png
        'LICENSE')
md5sums=('SKIP'
         '01fc82f0fe5c673e3b1c1b4da66505ce'
         '1f7c85955a1b845105b3464186d82b97'
         '6cd41f6e08eee03c6553603fb0b6ecd7'
         '227eac16d1e737bed42742840b950d41'
         '308eb2e0c509e12ecf33165ced9eef0d'
         'e9944fe09afc8495a2fbf70db810a219'
         '17856a060d1fc003447cb7a3f414be7d'
         'f2325d8de3d217471f029e8b59a712e3'
         '811f5de21b882cdb49618de549e017ca'
         'c6cf982d5ebece0b9cd64f065acd384a'
         'db90dcb101891a7285d25f2fbceca752')

pkgver() {
  echo $(chrome-linux/chrome --version | cut -d " " -f2).r$_build
}

package() {
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/${pkgname/-bin}/
  install -d "$pkgdir"/usr/share/man/man1/

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
  install -m755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # Rename chrome-sandbox
  mv chrome-linux/chrome{_,-}sandbox

  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Icons
  rm chrome-linux/product_logo_48.png
  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 ${pkgname}_${i}.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
  done

  # Man page
  gzip -9 chrome-linux/chrome.1
  mv chrome-linux/chrome.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz

  # License
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname/-bin}/

  msg2 "Installing main directory..."
  mv chrome-linux/ "$pkgdir"/opt/${pkgname/-bin}
}
