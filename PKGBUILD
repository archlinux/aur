# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.3.5
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
sha512sums=("f8c886da8ea65883ff7d1d6776be761283c16b676a0415a312ca58eb3169d9b6e58fda27af0e55577189baefe3d2a428b6d53af58845e35b58d696fe80ac57c5"
            "53eec7ea8358b87d3695a1394f9be8d7bec62bb3ecfc9cd9c41f75998b1d6ac16d0ed31115b0324403f61dcd111b1699bc805ea8f0e40c9961d85159c2b2b7fa"
            "adc0d042c68970d21c3e44faa29015e6d916a14587ea73c2273e7b15351d161d4d54ccc94293a67e53d63d97a70e0dbee6a2b5af30e6e1f8df6f12cb27516036"
            "3c33312870686ec57872f7f22abe23cc487cbf22366ce874c2cf65075b1044077438db9370f3eea4dfd0d8fee9633f9a2bff6177cdc6b480960de5c2c0c9aeb2"
            "8bb9d77e86e47a5a42bfdf661ea35a4543b3a22336ae4f718657e12089091cf1d6664fd1090e194da4c56f34c5febef960f50692246a1109ded19921854b9e5f"
            "3343515527fefb73b3417b6240fa398d11a3642bedcf8c3621bd37a4cae4116a6e5f7a925a68d1091b4287fae35946945a9b1729aab0c1ce1b521796273a3678"
            "3174d20d0de4b8cf0756b1fe69563ca4c3133b108bdda2bd90a8b0163d3f35c826c1356544735181023f2cbaee71a3a7224f88221ad57fa187a52c4d04fe023a"
            "855ac8b53e4733cb71819aaa03063b4e0cb60fe139b7e9eb07c42031091b067ed1a445fa0a894a87f4445254f6d7a0d12ba4f4a208370e8a702161eeac5cdfe0"
            "8d969524ae67b5170976efd408ab4c28b23d8a33bc0d671d1b968a6cab4ebfbc80067561f1837470c8cd92e711df136851fec85e683ddf7fd1a33f93b6e39210"
            "a6a3b9e4cfbd4b59750bcdfa383b36f78bcfb7613463bdbe67a32ba73e3e132c5b32bb7de5da2f72b528bf3cbb48b1e9d2f571dec9e41d767099c1bd14bee745")
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

