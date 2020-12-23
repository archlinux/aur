# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=2.6.0.0
_ver=${pkgver/b*/}
_modver=20201218
pkgrel=1
pkgdesc="A modded version of the BiglyBT client with multiple spoofing capabilities"
arch=('x86_64')
url="http://www.sb-innovation.de/f41/"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-user-dirs' 'java-runtime>=8')
optdepends=('jna' 'libappindicator-gtk3' 'ttf-dejavu')
options=('!strip')
install=$pkgname.install
source=("GitHub_BiglyBT_Installer_$pkgver.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$_ver/GitHub_BiglyBT_Installer.sh"
  "BiglyBT_${pkgver}_${_modver}.zip::http://www.sb-innovation.de/attachment.php?attachmentid=20844&d=1608276916")
noextract=($(basename ${source[1]}))
sha512sums=('95656cf495b8e85eac2a888a72f1ae1c7d51929d4af91d4a52963b57c7ecf86e614213364b563a5dc4627ec8d281cdb3aa40d5ef7553555c0d79b50c96cd6819'
  '2b9df855c4a0b2c5a584775c4de906a3166c4951dad5d94f99491a3b23ee3f1a1f10192151b11a2e976ee68db6a474c6d0a2953f7ef5e889e260aa923a1c25a8')

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

  cd "$srcdir/$pkgname"

  msg2 "Creating directory structure..."
  install -d "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/usr/share/pixmaps/"

  msg2 "Moving stuff in place..."
  # Launchers
  mv biglybt "$pkgdir/usr/bin/$pkgname"

  # Icon and desktop
  mv biglybt.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  mv biglybt.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Licenses
  mv 3rdPartyLicences.txt GPL.txt GPLv3.txt "$pkgdir/usr/share/licenses/$pkgname/"

  msg2 "Removing redundancies..."
  rm swt/swt-{bsd,ppc64,ppc64le,x86}.jar
  rm biglybt-lightgray.svg biglybt.png
  rm installer.log
  rm {,un}registerBiglyBT uninstall updateBiglyBT

  msg2 "Installing to /opt..."
  mv * "$pkgdir/opt/$pkgname/"

  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" "$pkgdir/usr/bin/$pkgname"
  sed -e "s|Name=.*|Name=BiglyBT Extreme Mod|" -e "s|Exec=.*|Exec=$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" \
    -i "$pkgdir/usr/share/applications/$pkgname.desktop"

  msg2 "Installing Extreme Mod..."
  bsdtar -xf "$srcdir/BiglyBT_${pkgver}_${_modver}.zip" -C "$pkgdir/opt/$pkgname/"
}
