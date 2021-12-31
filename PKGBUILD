# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar@gmail.com>

pkgname=scratch3-bin
_pkgname=scratch3
conflicts=("scratch3")
pkgver=3.27.0
pkgrel=2
pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("x86_64")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=("c-ares" "ffmpeg" "flac" "gtk3" "libevent" "libxslt" "minizip" "nss" "re2" "snappy")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('electron13' 'p7zip' 'asar')
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20$pkgver%20Setup.exe"
        "https://raw.githubusercontent.com/LLK/scratch-desktop/develop/LICENSE"
        "${_pkgname}.desktop"
        "${_pkgname}-icons.tar.gz"
        "${_pkgname}.xml")
noextract=("Scratch%20$pkgver%20Setup.exe")
sha256sums=('343135e697db089a7ce6e8736950c4693b418d7cbc41151e33a45cac4ecc89db'
            '8d7c41e0bba6db4070714002851a5d16edc08f3918ed8badb510b4ce9246da8f'
            '0f4f25e55b988e45a2f240487c35b18c96bbbce0f6be60bbe204b33f6d77d6da'
            '1445107a18b05cee3db8d6cd59e57b9a0468f70d9aceffefd0a1f24196f8b2da'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf')

prepare() {
  cd "$srcdir/"
# Extract files from "Scratch%20$pkgver%20Setup.exe" only what is needed with 7za
  7za x -aoa -y "Scratch%20$pkgver%20Setup.exe" resources/ -o$pkgname/

# Adjust folder's attributes
  chmod 755 $pkgname/resources/{,static/{,assets/}}

# Copy the electron files needed for scratch and rename the executable
  cp -rf /usr/lib/electron13/* $srcdir/$pkgname/
  mv $pkgname/electron $pkgname/$_pkgname
  
# All license files in one place
  mv $pkgname/LICENSE LICENSE-electron
  mv $pkgname/LICENSES.chromium.html LICENSES.chromium.html
  
# This file is useless
  rm $pkgname/resources/default_app.asar

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
  install -Dm644 "ScratchDesktop.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm644 "cathead.svg" $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-scratch3-sprite.svg
  install -Dm644 "${_pkgname}.xml" $pkgdir/usr/share/mime/packages/${_pkgname}.xml
  install -Dm644 LICENS* -t "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "${pkgdir}/opt/$pkgname"
  cp -r $srcdir/$pkgname -t "$pkgdir/opt"
}
