# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.2.8
pkgrel=2
pkgdesc="Graphical tool to display data from various chargers/dischargers"
url="http://savannah.nongnu.org/projects/dataexplorer"
arch=("i686" "x86_64")
license=("GPL3")
install=$pkgname.install

makedepends=("apache-ant" "java-environment")
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

md5sums=("f6d693807fc81728e0af13cf71c6ce9a"
         "16978d3d4d17cda2e0811e2c6362390a"

         "d764227784c6b7b71d620e40c23ef358"
         "adfb9ce356804d51c46fd0f97c66222d"

         "dbff88a8deaf759c253293b25488035c"
         "eaca424a102880d3668ff414020f99b8"

         "0cbcff52a6c8ce42102ffc49c1edfbb3"
         "5fe007c4080ae4c25d130c8cccc7f391"

         "1bf0831d2640c50cf5c89fc84dfd7991"
         "704a4631806191441b685728809d70e8")

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

