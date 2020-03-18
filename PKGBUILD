# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt
pkgver=2.3.0.0
pkgrel=3
pkgdesc="Feature-filled Bittorrent client based on the Azureus project"
arch=('x86_64' 'armv7h')
url="https://www.biglybt.com/"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-user-dirs' 'java-runtime>=8')
optdepends=('jna' 'libappindicator-gtk3' 'ttf-dejavu')
options=('!strip')
install=$pkgname.install
source=("GitHub_BiglyBT_Installer_$pkgver.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$pkgver/GitHub_BiglyBT_Installer.sh")
sha256sums=('6adb597051bde45be4d814f947d77accc28c0329cd07624f2130b0e9b783f4eb')

package() {
  if [[ ! -f /usr/bin/javac ]]; then
    warning "Installation without JDK will cause prompts for Root password during build!"
  fi

  if [[ -d $pkgname ]]; then
    msg2 "Cleaning build environment..."
    rm -r $pkgname
  fi
  
  msg2 "Extracting GitHub_BiglyBT_Installer_$pkgver.sh..."
  export app_java_home="/usr/lib/jvm/default"

  # Prevent the installer from creating files in the user's homedir
  export HOME=$srcdir/home
  mkdir -p $srcdir/home/{Desktop,.local/share/applications}

  sh GitHub_BiglyBT_Installer_$pkgver.sh -q -dir "$srcdir"/$pkgname

  cd "$srcdir"/$pkgname

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/$pkgname/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" $pkgname
  sed -i -e "s|Exec=.*|Exec=$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" $pkgname.desktop
  
  msg2 "Moving stuff in place..."
  # Launchers
  mv $pkgname "$pkgdir"/usr/bin/

  # Icon and desktop
  mv $pkgname.svg "$pkgdir"/usr/share/pixmaps/
  mv $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Licenses
  mv 3rdPartyLicences.txt GPL.txt GPLv3.txt "$pkgdir"/usr/share/licenses/$pkgname/  

  msg2 "Removing redundancies..."
  rm swt/swt-{bsd,ppc64,ppc64le,x86}.jar
  rm biglybt-lightgray.svg biglybt.png
  rm installer.log
  rm {,un}registerBiglyBT uninstall updateBiglyBT

  msg2 "Installing to /opt..."
  mv * "$pkgdir"/opt/$pkgname/
}
