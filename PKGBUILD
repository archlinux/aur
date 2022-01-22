# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar@gmail.com>

pkgname=clipcc-bin
_pkgname=clipcc
# conflicts=("scratch3")
pkgver=3.1.0_beta3
pkgrel=2
pkgdesc="ClipCC is a powerful scratch fork with plenty of extra features."
arch=("x86_64")
url="https://github.com/Clipteam"
license=("AGPL3")
depends=("c-ares" "ffmpeg" "flac" "gtk3" "libevent" "libxslt" "minizip" "nss" "re2" "snappy")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('electron13' 'p7zip' 'asar')
source=("https://github.com/Clipteam/clipcc-desktop/releases/download/${pkgver//_/-}/clipcc-${pkgver//_/-}-win-x64.exe"
        "LICENSE"
        "${_pkgname}.desktop"
        "${_pkgname}-icons.tar.gz"
        "${_pkgname}.xml")
noextract=("clipcc-3.1.0-beta3-win-x64.exe")
sha256sums=('4661045ecb362021cafc31648ff5ae50077df93a46be20712ab9b51ae8487140'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'c293e53da40fa54dae3ec2598e89b3bb2f7159f57a37e739cbcb70e8663739ed'
            '3afe472ea0ceffe52834abed6d838f88892c22bc15ef421e01a8829fc8887be0'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf')

prepare() {
  cd "$srcdir/"
# Extract files from "Scratch%20$pkgver%20Setup.exe" only what is needed with 7za
  7za x -aoa -y "clipcc-${pkgver//_/-}-win-x64.exe" resources/ -o$pkgname/

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
  install -Dm644 "sparrow.svg" $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-${_pkgname}-sprite.svg
  install -Dm644 "${_pkgname}.xml" $pkgdir/usr/share/mime/packages/${_pkgname}.xml
  install -Dm644 LICENS* -t "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "${pkgdir}/opt/$pkgname"
  cp -r $srcdir/$pkgname -t "$pkgdir/opt"
}
