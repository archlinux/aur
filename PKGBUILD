# Maintainer: EdenQwQ <lsahlm1eden@gmail.com>

pkgname=clipcc
_pkgname=clipcc
pkgver=3.1.3
pkgrel=1
pkgdesc="ClipCC is a powerful scratch fork with plenty of extra features."
conflicts=("clipcc-beta-bin" "clipcc-bin")
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
noextract=("clipcc-${pkgver//_/-}-win-x64.exe")
sha256sums=('2143a4ee037d74889ba5169562e786edd4706507f21fbde1e7c70d5ffc4b5373'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'e7240b1e4739cbbb955d7d75e852ecfe4f092d005e2af16e3f52a35e22dfa843'
            '4ed04f630047dd48a9a4f22b678cfb851711432c32815415e737f04bc7b2b1aa'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf')

prepare() {
  cd "$srcdir/"
  7za x -aoa -y "clipcc-${pkgver//_/-}-win-x64.exe" resources/ -o$pkgname/

  cp -rf /usr/lib/electron13/* $srcdir/$pkgname/
  mv $pkgname/electron $pkgname/$_pkgname
  
  mv $pkgname/LICENSE LICENSE-electron
  mv $pkgname/LICENSES.chromium.html LICENSES.chromium.html
  
  find $srcdir/$pkgname/ -type f -name "*.exe" -delete
  find $srcdir/$pkgname/ -type f -name "*.dll" -delete
  
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
