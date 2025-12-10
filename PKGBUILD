# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=dataexplorer
pkgname="${_pkgname}"
pkgver=3.9.9
pkgrel=1
pkgdesc="Graphical tool to analyze data, gathered from various hardware devices."
url="http://savannah.nongnu.org/projects/dataexplorer"
arch=("i686" "x86_64")
license=("GPL-3.0-or-later")
install="${_pkgname}.install"
makedepends=(
  #"apache-ant"
  "ant"
  "java-environment-openjdk=17"
  #"java-environment"
)
depends=(
  "java-runtime-openjdk=17"
  #"java-runtime"
  "sh"
)
source=(
  "http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz"
  "http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz.sig"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules.sig"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules.sig"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules.sig"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules"
  "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules.sig"
  "dataexplorer.sh"
  "deviceproperties-editor.sh"
)
noextract=(
  "dataexplorer-$pkgver-src.tar.gz.sig"
  "40-FTDI.rules"
  "40-FTDI.rules.sig"
  "40-MosChip.rules"
  "40-MosChip.rules.sig"
  "40-ProfilicTechnology.rules"
  "40-ProfilicTechnology.rules.sig"
  "40-SiliconLabs.rules"
  "40-SiliconLabs.rules.sig"
)
sha256sums=(
  '1395e00feec0a10a5c96d9afb68fa4fb6b3815e9b7e7144479032a6ccd2f6800'  # dataexplorer-$pkgver-src.tar.gz
  'SKIP'
  '921296ed5e3bcbee584ade948ccdbf25088767c0a7ee1acb7e35ba2c106d1dc2'  # 40-FTDI.rules
  'SKIP'
  'cb1ead8d6584e24f52e49035ec676a70882926447d403e35fca996f4d1c36447'  # 40-MosChip.rules
  'SKIP'
  '805c9b4e5d835b028a1205990281babb4d005137e973c11d59b86b0b95e34fcb'  # 40-ProfilicTechnology.rules
  'SKIP'
  '4639f8a2910afcf1e254899b0425ad1a5726ab605fdb999242ca3df6058062ea'  # 40-SiliconLabs.rules
  'SKIP'
  '179549d36caaecb82afee52d9263314e8d7e3d7f0925e8403c6bafd60d82e21e'  # dataexplorer.sh
  '8115ea0c76b591b66d6fc7a66bad3c673f5e8d1eb3a717872725a5bfc4b8fd86'  # deviceproperties-editor.sh
)
validpgpkeys=("3F0CC709ECF91C5CC0BE9E601D295C19C9C06AF6") # Winfried Bruegmann

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  if [ ! -e "RXTXcomm" ]; then
    ln -s "thirdparty/rxtx-2.2pre2" "RXTXcomm"
  fi

  # Check if we have openjdk17 installed
  if [ -d /usr/lib/jvm/java-17-openjdk ]; then
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
    export PATH="${JAVA_HOME}/bin/:$PATH"
  else
    error "You do not seem to have java-runtime-openjdk=17 installed."
    return 11
  fi

  ./configure \
    --prefix="$pkgdir/opt"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Check if we have openjdk17 installed
  if [ -d /usr/lib/jvm/java-17-openjdk ]; then
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
    export PATH="${JAVA_HOME}/bin/:$PATH"
  else
    error "You do not seem to have java-runtime-openjdk=17 installed."
    return 11
  fi

  # Main install.
  install -dvm755 "$pkgdir/opt"
  make install

  # Set executable permission.
  chmod 755 "$pkgdir/opt/DataExplorer/DataExplorer"
  chmod 755 "$pkgdir/opt/DataExplorer/DevicePropertiesEditor"

  # Install wrapper launcher scripts.
  install -Dvm755 "$srcdir/dataexplorer.sh"            "$pkgdir/usr/bin/dataexplorer"
  install -Dvm755 "$srcdir/deviceproperties-editor.sh" "$pkgdir/usr/bin/deviceproperties-editor"

  # Install UDEV rules.
  install -Dvm644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir"/{40-FTDI,40-MosChip,40-ProfilicTechnology,40-SiliconLabs}.rules

  # Install .desktop files.
  local _desktopfile
  install -dvm755 "$pkgdir/usr/share/applications"
  for _desktopfile in {DataExplorer,DevicePropertiesEditor}.desktop; do
    ln -sv "/opt/DataExplorer/${_desktopfile}" "${pkgdir}/usr/share/applications/${_desktopfile}"
  done

  # Install application icons.
  local _pixmap
  install -dvm755 "$pkgdir/usr/share/pixmaps"
  for _pixmap in {DataExplorer,DevicePropertiesEditor}.xpm; do
    ln -sv "/opt/DataExplorer/${_pixmap}" "${pkgdir}/usr/share/pixmaps/${_pixmap}"
  done

  # Install documentation.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      AUTHORS INSTALL 'DataExplorer - Benutzerhandbuch.pdf' 'DataExplorer - Users Guide.pdf'

  # Install license.
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING LICENSING.txt *.LICENSE
}
