# Maintainer: Det <nimetonmaili g-mail>
# Contributor: joseph28cb

# Choose, which icons to use for menus and system tray ("blue", "gray" or "default").
_icon="default"

pkgname=vuze-extreme-mod
pkgver=5.6.1.3
_ver=5612
pkgrel=1
pkgdesc="A modded version of the Vuze BitTorrent client with multiple spoofing capabilities"
arch=('i686' 'x86_64')
url="http://www.sb-innovation.de/f41/"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'java-runtime')
optdepends=('vuze-plugin-countrylocator: Country flags for the "Peers" tab'
            'vuze-plugin-mldht: The alternative Distributed Hash Table implementation (DHT) used by µTorrent'
            'xulrunner192: Needed for the channels GUI')
provides=('vuze')
conflicts=('vuze')
options=('!strip')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/azureus/vuze/Vuze_${_ver}/Vuze_${_ver}_linux.tar.bz2"
        'http://www.sb-innovation.de/attachments/f41/15477d1434194241-vuze-extreme-mod-sb-innovation-5-6-1-3-vpem_5613-01.zip'
         {blue,gray}_{16,32,64,128}.png)
noextract=($(basename ${source[1]}))
md5sums=('c20397aa00614ab8b271afef93c877bc'
         '9b4f2d968c3ad59a075fb0ced86e1697'
         '5eba696cfcc430504706f476e13b2ade'
         'a4cae0c46a6ac56322753f96f52b8f74'
         '5eba696cfcc430504706f476e13b2ade'
         '74fd7cf4d05e5c2111ec2dbf62b3c9d8'
         '4374a188968bf9f09cab090ca7d33ce4'
         '484182b170741132ffe2d78c6feaf230'
         '4374a188968bf9f09cab090ca7d33ce4'
         'db19086ba7bd8eefee05538f4c65aa68')

package() {
  cd vuze

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/vuze-extreme-mod/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/gconf/schemas/
  install -d "$pkgdir"/usr/share/licenses/vuze-extreme-mod/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Moving stuff in place..."
  # Launchers
  mv vuze "$pkgdir"/usr/bin/vuze-extreme-mod
  ln -s vuze-extreme-mod "$pkgdir"/usr/bin/vuze

  # swt.jar
  case "$CARCH" in
    i686)   mv swt/swt32.jar "$pkgdir"/usr/lib/vuze-extreme-mod/swt.jar ;;
    x86_64) mv swt/swt64.jar "$pkgdir"/usr/lib/vuze-extreme-mod/swt.jar ;;
  esac

  # Icon, desktop and schemas
  mv vuze.png "$pkgdir"/usr/share/pixmaps/vuze-extreme-mod.png
  mv vuze.desktop "$pkgdir"/usr/share/applications/vuze-extreme-mod.desktop
  mv vuze.schemas "$pkgdir"/usr/share/gconf/schemas/vuze-extreme-mod.schemas

  # Licenses
  mv GPL.txt      "$pkgdir"/usr/share/licenses/vuze-extreme-mod/
  mv GPLv3.txt    "$pkgdir"/usr/share/licenses/vuze-extreme-mod/
  mv LICENSES.txt "$pkgdir"/usr/share/licenses/vuze-extreme-mod/
  mv TOS.txt      "$pkgdir"/usr/share/licenses/vuze-extreme-mod/
  ln -s vuze-extreme-mod/ "$pkgdir"/usr/share/licenses/vuze

  # Remove redundancies
  rm -r swt/
  rm    azureus
  rm    installer.log
  rm    README.txt

  # Move main stuff
  mv * "$pkgdir"/usr/lib/vuze-extreme-mod/

  msg2 "Tweaking paths"
  # Launcher
  sed 's|#PROGRAM_DIR=.*|PROGRAM_DIR="/usr/lib/vuze-extreme-mod"|' \
      -i "$pkgdir"/usr/bin/vuze-extreme-mod

  # Desktop
  sed -r -e 's|Name=Vuze|Name=Vuze Extreme Mod|' \
         -e 's|Exec=vuze %f|Exec=vuze-extreme-mod %U|' \
         -e 's|Icon=vuze.png|Icon=vuze-extreme-mod.png|' \
         -e 's|(x-bittorrent)|\1;x-scheme-handler/magnet;|' \
      -i "$pkgdir"/usr/share/applications/vuze-extreme-mod.desktop

  msg2 "Installing Extreme Mod..."
  bsdtar -xf "$srcdir"/$(basename ${source[1]}) -C "$pkgdir"/usr/lib/vuze-extreme-mod/

  # Different icons for menus and systray
  if [[ $_icon = blue ]] || [[ $_icon = gray ]]; then
    msg2 "Using alternative $_icon icons..."

    # Menus
    cd "$srcdir"
    install -m644 ${_icon}_128.png "$pkgdir"/usr/share/pixmaps/vuze-extreme-mod.png

    ## Systray
    # Extract Azureus2.jar from Extreme Mod tarball
    install -d tmp/
    bsdtar -xf $(basename ${source[1]}) Azureus2.jar
    bsdtar -xf Azureus2.jar -C tmp/

    # Place icons
    for i in 16 32 64 128; do
      install -m644 ${_icon}_${i}.png tmp/org/gudy/azureus2/ui/icons/a${i}.png
    done

    # Recreate Azureus2.jar
    cd tmp
    jar cf Azureus2.jar ./*/

    # Install
    install -m644 Azureus2.jar "$pkgdir"/usr/lib/vuze-extreme-mod/
  fi
}
