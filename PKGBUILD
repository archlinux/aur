# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.3.1
pkgrel=1
pkgdesc="Graphical tool to display data from various chargers/dischargers"
url="http://savannah.nongnu.org/projects/dataexplorer"
arch=("i686" "x86_64")
license=("GPL3")
install=$pkgname.install
makedepends=("apache-ant" "jdk8-openjdk")
depends=("java-runtime")
source=("http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz"
        "http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules.sig")
noextract=("dataexplorer-$pkgver-src.tar.gz.sig"
           "40-FTDI.rules"
           "40-FTDI.rules.sig"
           "40-MosChip.rules"
           "40-MosChip.rules.sig"
           "40-ProfilicTechnology.rules"
           "40-ProfilicTechnology.rules.sig"
           "40-SiliconLabs.rules"
           "40-SiliconLabs.rules.sig")
sha256sums=("2aac0313b27b61f94d7464c80a7470ad83af05e23d2d8faae73f3e21c098820e"
            "3ad0bbcf1aada17704f66e64d8e67e309cb7fd2b88a74e340a34f7fdf817bdf5"
            "921296ed5e3bcbee584ade948ccdbf25088767c0a7ee1acb7e35ba2c106d1dc2"
            "17a537b3705235b196014da20b5b6c3f6acd164d84ccc19bc3ea1faffd295765"
            "cb1ead8d6584e24f52e49035ec676a70882926447d403e35fca996f4d1c36447"
            "029356a15c530a48187979d296e2b08dbc42362834bbbdc8dc4bafc87c4f6341"
            "805c9b4e5d835b028a1205990281babb4d005137e973c11d59b86b0b95e34fcb"
            "866835314125b21527044b3d33543516d632625615963d3dfc6b7dcbc2f0fe90"
            "4639f8a2910afcf1e254899b0425ad1a5726ab605fdb999242ca3df6058062ea"
            "952a5a82a4f77bb6c72e35970b731786ec35094b1c892f485e5c6a14038f503e")
validpgpkeys=("5EA6D73C6706D261118024746F1B47F2E5758C39") # Winfried Bruegmann

build() {
  echo $pkgdir

  cd "$srcdir/$pkgname-$pkgver"

  if [ ! -e "RXTXcomm" ]; then
    ln -s "thirdparty/rxtx-2.2pre2" "RXTXcomm"
  fi

  ./configure --prefix=$pkgdir/opt
  make

  cd "$srcdir"
  echo -e "#!/usr/bin/env sh\ncd /opt/DataExplorer && ./DataExplorer" > "dataexplorer.sh"
  echo -e "#!/usr/bin/env sh\ncd /opt/DataExplorer && ./DevicePropertiesEditor" > "deviceproperties-editor.sh"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/opt"
  make install

  install -Dm755 "$srcdir/dataexplorer.sh" "$pkgdir/usr/bin/dataexplorer"
  install -Dm755 "$srcdir/deviceproperties-editor.sh" "$pkgdir/usr/bin/deviceproperties-editor"

  install -Dm644 "$srcdir/40-FTDI.rules" "$pkgdir/etc/udev/rules.d/40-FTDI.rules"
  install -Dm644 "$srcdir/40-MosChip.rules" "$pkgdir/etc/udev/rules.d/40-MosChip.rules"
  install -Dm644 "$srcdir/40-ProfilicTechnology.rules" "$pkgdir/etc/udev/rules.d/40-ProfilicTechnology.rules"
  install -Dm644 "$srcdir/40-SiliconLabs.rules" "$pkgdir/etc/udev/rules.d/40-SiliconLabs.rules"

  install -Dm644 "$pkgdir/opt/DataExplorer/DataExplorer.desktop" "$pkgdir/usr/share/applications/DataExplorer.desktop"
  install -Dm644 "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.desktop" "$pkgdir/usr/share/applications/DevicePropertiesEditor.desktop"
  install -Dm644 "$pkgdir/opt/DataExplorer/DataExplorer.xpm" "$pkgdir/usr/share/pixmaps/DataExplorer.xpm"
  install -Dm644 "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.xpm" "$pkgdir/usr/share/pixmaps/DevicePropertiesEditor.xpm"
  rm "$pkgdir/opt/DataExplorer/DataExplorer.desktop"
  rm "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.desktop"
  rm "$pkgdir/opt/DataExplorer/DataExplorer.xpm"
  rm "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.xpm"

  chmod +x "$pkgdir/opt/DataExplorer/DataExplorer"
  chmod +x "$pkgdir/opt/DataExplorer/DevicePropertiesEditor"
}

