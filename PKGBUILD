# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.3.7
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
sha512sums=("3fc62466cd5a1b9b484c2792b67b4c16fd9caeca2fc0416f892ddcd08faf0b94fcb782e12e83f31a3aded2c3ac22b6cb29432de4bc19a3e50883565b9b007275"
            "f347046b45670c9ddfafd0e8d18e42331ba0c72ff6563ac317989378874f60863e4cbabeceead47cf728d967a788456153c9fddfae702e74ef37b7bf1a6ccb69"
            "adc0d042c68970d21c3e44faa29015e6d916a14587ea73c2273e7b15351d161d4d54ccc94293a67e53d63d97a70e0dbee6a2b5af30e6e1f8df6f12cb27516036"
            "a4edab77d99b871fd3c4eb7544a0e4bed342c17bcb4125d42d2ac11c5c330ad9214a05b9ac43f2772582e4d8ff1d0ba50303c583f90cf6adb844285004427126"
            "8bb9d77e86e47a5a42bfdf661ea35a4543b3a22336ae4f718657e12089091cf1d6664fd1090e194da4c56f34c5febef960f50692246a1109ded19921854b9e5f"
            "c469edc0816b5a93d68f7427369b039acf609c54813918f94bb2a5a69b29f89988bd0143d9e417e45f1f22dab5b2f80e356e34ca7d1ff6fd7f2029e7b5e52048"
            "3174d20d0de4b8cf0756b1fe69563ca4c3133b108bdda2bd90a8b0163d3f35c826c1356544735181023f2cbaee71a3a7224f88221ad57fa187a52c4d04fe023a"
            "d29e8cf0fbfb095d4b406746ddb6a79c0af21ba13720ce003826ad5940fbb349fa667200d56cb301ed92df34b2636398bcf1f917d4f130e30b7e3a52cf49c477"
            "8d969524ae67b5170976efd408ab4c28b23d8a33bc0d671d1b968a6cab4ebfbc80067561f1837470c8cd92e711df136851fec85e683ddf7fd1a33f93b6e39210"
            "eee64174fa98e406e8416bba5fd03c9d8774af4cd9264efc121d134ea3ed1d59ea0ba328491049fb828f4faa0d71d724e211e49bcb16b21cb3348ea6ee91cfdd")
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

