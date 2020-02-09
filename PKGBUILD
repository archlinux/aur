# Maintainer: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=1.9.0.0
_ver=${pkgver/b*}
pkgrel=1
pkgdesc="A modded version of the BiglyBT client with multiple spoofing capabilities"
arch=('x86_64')
url="http://www.sb-innovation.de/f41/"
license=('GPL3')
depends=('desktop-file-utils' 'java-runtime>=9' 'jna')
options=('!strip')
install=$pkgname.install
source=("GitHub_BiglyBT_Installer_$pkgver.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$_ver/GitHub_BiglyBT_Installer.sh"
        "BiglyBT_1.9.0.0_20190330.zip::http://www.sb-innovation.de/attachment.php?attachmentid=19949&d=1553928941")
noextract=($(basename ${source[1]}))
sha512sums=('c8edd22ebb7628c11eeb2378a3c77affa755e3b8e94e9724dede593c6ef0ea690923d8089795d8ef919b072693b4fb1b9828f74a2164199b7d822064ad936871'
            '2798c32cd8f8e6d8fd563bcdc12e710c4a1acf731f12d2d08fc7b4ea971543546b5e2ff2ba97bd1119a67f0962807d054844aa272fd21513ce5a13120ce1a5e4')

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
  sh GitHub_BiglyBT_Installer_$pkgver.sh -q -dir "$srcdir"/$pkgname

  cd "$srcdir"/$pkgname

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/$pkgname/
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Moving stuff in place..."
  # Launchers
  mv biglybt "$pkgdir"/usr/bin/$pkgname

  # Icon and desktop
  mv biglybt.svg "$pkgdir"/usr/share/pixmaps/$pkgname.svg
  mv biglybt.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Licenses
  mv 3rdPartyLicences.txt GPL.txt GPLv3.txt "$pkgdir"/usr/share/licenses/$pkgname/  

  msg2 "Removing redundancies..."
  rm swt/swt-{bsd,ppc64,ppc64le,x86}.jar
  rm biglybt-lightgray.svg biglybt.png
  rm installer.log
  rm {,un}registerBiglyBT uninstall updateBiglyBT

  msg2 "Installing to /opt..."
  mv * "$pkgdir"/opt/$pkgname/
  
  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" "$pkgdir"/usr/bin/$pkgname
  sed -e "s|Name=.*|Name=BiglyBT Extreme Mod|" -e "s|Exec=.*|Exec=$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" \
      -i "$pkgdir"/usr/share/applications/$pkgname.desktop

  msg2 "Installing Extreme Mod..."
  bsdtar -xf "$srcdir"/BiglyBT_1.9.0.0_20190330.zip -C "$pkgdir"/opt/$pkgname/
}
