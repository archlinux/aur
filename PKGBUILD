# Maintainer: Det <nimetonmaili g-mail>
# Contributor: joseph28cb

# Choose, which icons to use for menus and system tray ("blue", "gray" or "default").
_icon="default"

pkgname=vuze-extreme-mod
pkgver=5.7.5.0
_ver=5750
pkgrel=1
pkgdesc="A modded version of the Vuze BitTorrent client with multiple spoofing capabilities"
arch=('x86_64')
url="http://www.sb-innovation.de/f41/"
license=('GPL')
depends=('desktop-file-utils' 'java-runtime')
optdepends=('vuze-plugin-countrylocator: Country flags for the "Peers" tab'
            'vuze-plugin-mldht: The alternative Distributed Hash Table implementation (DHT) used by µTorrent'
            'xulrunner192: Needed for the channels GUI')
provides=('vuze')
options=('!strip')
install=$pkgname.install
source=("http://downloads.sourceforge.net/azureus/vuze/Vuze_${_ver}/Vuze_${_ver}_linux.tar.bz2"
        'http://www.sb-innovation.de/attachments/f41/17559d1488493507-vuze-extreme-mod-sb-innovation-5-7-5-0-vpem_5750-00.zip'
         {blue,gray}_{16,32,64,128}.png)
noextract=($(basename ${source[1]}))
md5sums=('fb8f224700331de86caa8648418fb41b'
         '05c0d1c5bd369abbd1f38556703c2524'
         '5eba696cfcc430504706f476e13b2ade'
         'a4cae0c46a6ac56322753f96f52b8f74'
         '5eba696cfcc430504706f476e13b2ade'
         '74fd7cf4d05e5c2111ec2dbf62b3c9d8'
         '4374a188968bf9f09cab090ca7d33ce4'
         '484182b170741132ffe2d78c6feaf230'
         '4374a188968bf9f09cab090ca7d33ce4'
         'db19086ba7bd8eefee05538f4c65aa68')

package() {
  rm -rf VPEM_*
  cd vuze

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/$pkgname/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Moving stuff in place..."
  # Launcher
  mv vuze "$pkgdir"/usr/bin/$pkgname

  # swt.jar
  mv swt/swt64.jar "$pkgdir"/opt/$pkgname/swt.jar

  # Icon and desktop 
  mv vuze.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  mv vuze.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Licenses
  for i in GPL.txt GPLv3.txt LICENSES.txt TOS.txt; do
    mv $i "$pkgdir"/usr/share/licenses/$pkgname/
  done

  msg2 "Removing redundancies..."
  rm -r swt/
  rm    azureus
  rm    installer.log
  rm    README.txt
  rm    vuze.schemas

  msg2 "Installing to /opt..."
  mv * "$pkgdir"/opt/$pkgname/

  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" "$pkgdir"/usr/bin/$pkgname

  msg2 "Adding support for magnet links..."
  sed -r -e "s|Name=Vuze|Name=Vuze Extreme Mod|" \
         -e "s|Exec=vuze %f|Exec=$pkgname %U|" \
         -e "s|Icon=vuze.png|Icon=$pkgname.png|" \
         -e "s|(x-bittorrent)|\1;x-scheme-handler/magnet;|" \
         -i "$pkgdir"/usr/share/applications/$pkgname.desktop

  msg2 "Installing Extreme Mod..."
  bsdtar -xf "$srcdir"/$(basename ${source[1]})
  mv "$srcdir"/vuze/VPEM_*/* "$pkgdir"/opt/$pkgname/

  # Different icons for menus and systray
  if [[ $_icon = blue ]] || [[ $_icon = gray ]]; then
    msg2 "Using alternative $_icon icons..."

    # Menus
    cd "$srcdir"
    install -m644 ${_icon}_128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    # Extract .jar
    install -d tmp/
    bsdtar -xf $(basename ${source[1]}) Azureus2.jar
    bsdtar -xf Azureus2.jar -C tmp/

    # Place icons
    for i in 16 32 64 128; do
      install -m644 ${_icon}_${i}.png tmp/org/gudy/azureus2/ui/icons/a${i}.png
    done

    # Recreate .jar
    cd tmp
    jar cf Azureus2.jar ./*/

    # Install
    install -m644 Azureus2.jar "$pkgdir"/opt/$pkgname/
  fi
}
