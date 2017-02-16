# Maintainer: Det <nimetonmaili g-mail>

# Choose, which icons to use for menus and system tray ("blue", "gray" or "default").
_icon="default"

pkgname=vuze-dev
pkgver=5.7.4.1_B22
pkgrel=1
pkgdesc="A feature-rich Java-based BitTorrent client (previously called 'Azureus') - Bleeding edge version"
arch=('i686' 'x86_64')
url="http://dev.vuze.com/"
license=('GPL')
depends=('desktop-file-utils' 'java-runtime')
optdepends=('vuze-plugin-countrylocator: Country flags for the "Peers" tab'
            'vuze-plugin-mldht: The alternative Distributed Hash Table implementation (DHT) used by µTorrent'
            'xulrunner192: Needed for the channels GUI')
provides=('vuze')
options=('!strip')
install=$pkgname.install
versions=$(curl -sL http://dev.vuze.com/versions.json)
_stable_ver_flat=$(echo "$versions" | grep -Po 'version": "\K[^"]*' | tail -1) # 5730
_dev_ver_flat=$(echo "$versions" | grep -Pom1 'version": "\K[^"]*')            # 5731
_dev_ver=$(echo "$_dev_ver_flat" | sed -r 's/([0-9])/.\1/g' | cut -c 2-)       # 5.7.3.1
_dev_build=$(echo "$versions" | grep -Pom1 'build": "\K[^"]*')                 # 20
source=("http://downloads.sourceforge.net/azureus/vuze/Vuze_${_stable_ver_flat}/Vuze_${_stable_ver_flat}_linux.tar.bz2"
        "http://cf1.vuze.com/torrent/files/Azureus${_dev_ver_flat}-B${_dev_build}.jar"
         {blue,gray}_{16,32,64,128}.png)
noextract=($(basename ${source[1]}))
md5sums=(''
         'SKIP'
         '5eba696cfcc430504706f476e13b2ade'
         'a4cae0c46a6ac56322753f96f52b8f74'
         '5eba696cfcc430504706f476e13b2ade'
         '74fd7cf4d05e5c2111ec2dbf62b3c9d8'
         '4374a188968bf9f09cab090ca7d33ce4'
         '484182b170741132ffe2d78c6feaf230'
         '4374a188968bf9f09cab090ca7d33ce4'
         'db19086ba7bd8eefee05538f4c65aa68')

pkgver() {
  echo ${_dev_ver}_B${_dev_build}
}

package() {
  cd vuze

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/vuze-dev/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/vuze-dev/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Moving stuff in place..."
  # Launcher
  mv vuze "$pkgdir"/usr/bin/vuze-dev

  # swt.jar
  case "$CARCH" in
    i686)   mv swt/swt32.jar "$pkgdir"/opt/vuze-dev/swt.jar ;;
    x86_64) mv swt/swt64.jar "$pkgdir"/opt/vuze-dev/swt.jar ;;
  esac

  # Icon and desktop 
  mv vuze.png "$pkgdir"/usr/share/pixmaps/vuze-dev.png
  mv vuze.desktop "$pkgdir"/usr/share/applications/vuze-dev.desktop

  # Licenses
  mv GPL.txt      "$pkgdir"/usr/share/licenses/vuze-dev/
  mv GPLv3.txt    "$pkgdir"/usr/share/licenses/vuze-dev/
  mv LICENSES.txt "$pkgdir"/usr/share/licenses/vuze-dev/
  mv TOS.txt      "$pkgdir"/usr/share/licenses/vuze-dev/

  msg2 "Removing redundancies..."
  rm -r swt/
  rm    azureus
  rm    installer.log
  rm    README.txt
  rm    vuze.schemas

  msg2 "Installing to /opt..."
  mv * "$pkgdir"/opt/vuze-dev/

  msg2 "Fixing paths..."
  sed 's|#PROGRAM_DIR=.*|PROGRAM_DIR="/opt/vuze-dev"|' \
      -i "$pkgdir"/usr/bin/vuze-dev

  msg2 "Adding support for magnet links..."
  sed -r -e 's|Name=Vuze|Name=Vuze Development Build|' \
         -e 's|Exec=vuze %f|Exec=vuze-dev %U|' \
         -e 's|Icon=vuze.png|Icon=vuze-dev.png|' \
         -e 's|(x-bittorrent)|\1;x-scheme-handler/magnet;|' \
      -i "$pkgdir"/usr/share/applications/vuze-dev.desktop

  msg2 "Updating to Development Build..."
  install -m644 "$srcdir"/Azureus${_dev_ver_flat}-B${_dev_build}.jar -C "$pkgdir"/opt/vuze-dev/Azureus2.jar

  # Different icons for menus and systray
  if [[ $_icon = blue ]] || [[ $_icon = gray ]]; then
    msg2 "Using alternative $_icon icons..."

    # Menus
    cd "$srcdir"
    install -m644 ${_icon}_128.png "$pkgdir"/usr/share/pixmaps/vuze-dev.png

    ## Systray
    # Extract Azureus${_dev_ver_flat}-B${_dev_build}.jar
    install -d tmp/
    bsdtar -xf Azureus${_dev_ver_flat}-B${_dev_build}.jar -C tmp/

    # Place icons
    for i in 16 32 64 128; do
      install -m644 ${_icon}_${i}.png tmp/org/gudy/azureus2/ui/icons/a${i}.png
    done

    # Recreate Azureus2.jar
    cd tmp
    jar cf Azureus2.jar ./*/

    # Install
    install -m644 Azureus2.jar "$pkgdir"/opt/vuze-dev/
  fi
}
