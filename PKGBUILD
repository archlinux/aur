# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.7.5
pkgrel=1
pkgdesc="Graphical tool to analyze data, gathered from various hardware devices."
url="http://savannah.nongnu.org/projects/dataexplorer"
arch=("i686" "x86_64")
license=("GPL3")
install=$pkgname.install
makedepends=("apache-ant" "jdk17-openjdk")
depends=("jdk17-openjdk")
source=("http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz"
        "http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules.sig"
        )
noextract=("dataexplorer-$pkgver-src.tar.gz.sig"
           "40-FTDI.rules"
           "40-FTDI.rules.sig"
           "40-MosChip.rules"
           "40-MosChip.rules.sig"
           "40-ProfilicTechnology.rules"
           "40-ProfilicTechnology.rules.sig"
           "40-SiliconLabs.rules"
           "40-SiliconLabs.rules.sig")
sha512sums=("63d20037542efc6686bf9156ce5782676fd3468e903f8b873239999aa2288123272d7f0b218ea78fe4ba4af8da5d74cad5f3d947614654758bd599631790c8fe"
            "8fca73217b4b0ca78f82f77b28e969f8c77a01b1b072f10a37836d9f768c35238459af461a98e6a0759d83ea350ccaa73260d6869f01d594ea5fc36edd3ec5ac"
            "adc0d042c68970d21c3e44faa29015e6d916a14587ea73c2273e7b15351d161d4d54ccc94293a67e53d63d97a70e0dbee6a2b5af30e6e1f8df6f12cb27516036"
            "176304b8c28aa8db49afaac2a8f7769d3635343e696bde173123905d432ea8375059e2911b1ba137157bd70ca83dbedd2ad0b865d2f080bf552f7d5a6aadfdd4"
            "8bb9d77e86e47a5a42bfdf661ea35a4543b3a22336ae4f718657e12089091cf1d6664fd1090e194da4c56f34c5febef960f50692246a1109ded19921854b9e5f"
            "2cb29a622882037934cea468736026972d6be032ad1807b6bf77516a98aebf7d572b0d89af7a28bb722be7495324740058e64db2303ea4d9edd4a736dfae9c75"
            "3174d20d0de4b8cf0756b1fe69563ca4c3133b108bdda2bd90a8b0163d3f35c826c1356544735181023f2cbaee71a3a7224f88221ad57fa187a52c4d04fe023a"
            "e18675e1e020bf03a5a05621b1dfbc5847f2a5d881715fda59bb5662b53a2a6ddd846cab8878edc3f71da838b3760909338cd9bdaaf7871ec06bdd64e9ae1dfe"
            "8d969524ae67b5170976efd408ab4c28b23d8a33bc0d671d1b968a6cab4ebfbc80067561f1837470c8cd92e711df136851fec85e683ddf7fd1a33f93b6e39210"
            "4d392d1e673e68b7ae14d0c696bee762587ddc5f188c03f47f920f5d474b4f9dd9d50854fbc331755fb56d6d5ca5b55306fa5109881961c1b913bb8260f0d0e4")

validpgpkeys=("3F0CC709ECF91C5CC0BE9E601D295C19C9C06AF6") # Winfried Bruegmann

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ ! -e "RXTXcomm" ]; then
    ln -s "thirdparty/rxtx-2.2pre2" "RXTXcomm"
  fi

  ./configure --prefix=$pkgdir/opt
  make
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

