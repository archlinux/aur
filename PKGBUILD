# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt
pkgver=3.4.0.0
pkgrel=1
pkgdesc="Feature-filled Bittorrent client based on the Azureus project"
arch=('x86_64' 'armv7h')
url="https://www.biglybt.com/"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-user-dirs' 'java-runtime>=8')
optdepends=('jna' 'libappindicator-gtk3' 'ttf-dejavu')
options=('!strip')
install=$pkgname.install
source=("GitHub_BiglyBT_Installer_$pkgver.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$pkgver/GitHub_BiglyBT_Installer.sh")
sha256sums=('0c52741e7b6ff1265e1ce979b8e0977ac2cd4f8cb69e15a7078281dd34a58a4e')

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

  msg2 "Enabling IPv6..."
  sed -i 's/JAVA_PROPS="-Djava.net.preferIPv4Stack=true"/#JAVA_PROPS="-Djava.net.preferIPv4Stack=true"/' $pkgname

  msg2 "Moving stuff in place..."

  # Launcher
  sed -i 's/\r//' $pkgname
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
