# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar@gmail.com>

pkgname=clipcc-bin
_pkgname=clipcc
conflicts=("scratch3")
pkgver=3.1.0
pkgrel=1
pkgdesc="ClipCC is a powerful scratch fork with plenty of extra features."
arch=("x86_64" "i686" "aarch64" "arm7h")
url="https://github.com/Clipteam"
license=("AGPL3")
depends=("c-ares" "ffmpeg" "flac" "gtk3" "libevent" "libxslt" "minizip" "nss" "re2" "snappy")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('electron13' 'p7zip' 'asar')
source=("https://github.com/Clipteam/clipcc-desktop/releases/download/3.1.0-beta3/clipcc-3.1.0-beta3-win-x64.exe"
        "https://github.com/Clipteam/clipcc-desktop/blob/master/LICENSE"
        "${_pkgname}.desktop"
        "${_pkgname}-icons.tar.gz"
        "${_pkgname}.xml")
noextract=("clipcc-3.1.0-beta3-win-x64.exe")
sha256sums=('4661045ecb362021cafc31648ff5ae50077df93a46be20712ab9b51ae8487140'
            '4dde424c05c7a3db9433661b9b3d2c48c81d5a12183135e4315e4da57464b98d'
            'c293e53da40fa54dae3ec2598e89b3bb2f7159f57a37e739cbcb70e8663739ed'
            '56ce70dde379981a301d7c4d70681073ac2be068af46f4cb67042bc2862a0fb4'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf')

prepare() {
  cd "$srcdir/"
# Extract files from "Scratch%20$pkgver%20Setup.exe" only what is needed with 7za
  7za x -aoa -y "clipcc-3.1.0-beta3-win-x64.exe" resources/ -o$pkgname/

# Adjust folder's attributes
  # chmod 755 $pkgname/resources/{,static/{,assets/}}

# Copy the electron files needed for scratch and rename the executable
  cp -rf /usr/lib/electron13/* $srcdir/$pkgname/
  mv $pkgname/electron $pkgname/$_pkgname
  
# All license files in one place
  mv $pkgname/LICENSE LICENSE-electron
  mv $pkgname/LICENSES.chromium.html LICENSES.chromium.html
  
# This file is useless
  # rm $pkgname/resources/default_app.asar

# We don't need, if any, windows/dos file executables, remove them.
  find $srcdir/$pkgname/ -type f -name "*.exe" -delete
  find $srcdir/$pkgname/ -type f -name "*.dll" -delete
  
# Hack to make scratch3 work with electron > 11 (Credit: unphysicalix)
  tmpdir=$(mktemp -d -p ${srcdir})
  asar extract ${srcdir}/$pkgname/resources/app.asar $tmpdir
  sed -i "s@nodeIntegration: true@nodeIntegration: true,\\\n contextIsolation: false@" ${tmpdir}/main.js
  asar pack $tmpdir ${srcdir}/$pkgname/resources/app.asar
  rm -rf $tmpdir
}

package() {
  install -dm755 ${pkgdir}/usr/bin
  ln -sf /opt/${pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  
  install -Dm644 "${_pkgname}.desktop" $pkgdir/usr/share/applications/${_pkgname}.desktop
  install -Dm644 "clipcc.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm644 "clipcc.svg" $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-scratch3-sprite.svg
  install -Dm644 "${_pkgname}.xml" $pkgdir/usr/share/mime/packages/${_pkgname}.xml
  install -Dm644 LICENS* -t "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "${pkgdir}/opt/$pkgname"
  cp -r $srcdir/$pkgname -t "$pkgdir/opt"
}
