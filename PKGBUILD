# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=dataexplorer
pkgver=3.1.3
pkgrel=1
pkgdesc="Graphical tool to display data from various charger/dischargers"
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

md5sums=("793244aef5cdbef19c256e138227d89a"
         "80417f93fa2b5c0e2ce41de7060fa214"

         "d764227784c6b7b71d620e40c23ef358"
         "af4233ff265e24ee94149c2589e402c9"
         "dbff88a8deaf759c253293b25488035c"
         "62324db189092b01c850d5aa452e5c1d"
         "0cbcff52a6c8ce42102ffc49c1edfbb3"
         "7d066acb390c4c3247c9f9cb2e28553f"
         "1bf0831d2640c50cf5c89fc84dfd7991"
         "b11cbc1bbf75519e0a21c73597d0d31e")

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

