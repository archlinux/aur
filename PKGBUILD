# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributors: Det, Ner0, alexwizard, thotypous, jdhore, xduugu, randypenguin, bdheeman, AlK

pkgname=chromium-snapshot-bin
pkgver=111.0.5487.0.r1084891
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Latest Snapshot)"
arch=('x86_64')
url="https://build.chromium.org"
license=('BSD')
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss')
optdepends=('kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'flashplugin: support for Flash content'
            'ttf-liberation: fix fonts for some PDFs [RBug #369991]')
provides=('chromium')
install=$pkgname.install
_build=$(curl -s "https://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/LAST_CHANGE")
source=("chrome-linux-r$_build.zip::https://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/$_build/chrome-linux.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname"_{16,22,24,32,48,64,128,256}.png
        'LICENSE')
sha1sums=('SKIP'
          '12c3b365d3765ab8d049b517c3f598563ef0c45b'
          'e64637c07b921f197fc1d7fd031c8a73ea3a55f8'
          '1cbdde48d193a648723f948370eff9b7b2fbf3f9'
          '97b440a273fd58543f62db639bdebc4d7a8029a5'
          '4b66bbab5e153d8a3b37990956cf89b1a560c7a2'
          '00ac07b06f29359b6c32dcf38731944afc5ec42d'
          '7931235b59c485a412f8ef035285b54d7aa2a802'
          'a3e3c729cb986fe9aecf6a892d947d728c6e616e'
          '9f627ab21bb398c36f9231da15a53774deb05818'
          'e39429069036a9e7c3a0003523a8c1c7565a3174'
          '35b9154bfb51e35216877dbc9215a2d0ffde4571')

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
  if [[ -f chrome-linux/chrome.1 ]]; then
    gzip -9 chrome-linux/chrome.1
    mv chrome-linux/chrome.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz
  fi

  # License
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname/-bin}/

  msg2 "Installing main directory..."
  mv chrome-linux/ "$pkgdir"/opt/${pkgname/-bin}
}
