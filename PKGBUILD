# Maintainer: EdenQwQ <lsahlm1eden@gmail.com>

pkgname=clipcc-beta-bin
_pkgname=clipcc
pkgver=3.1.2_beta2
pkgrel=2
pkgdesc="This is ClipCC's beta release. Please note that beta release is unstable and some new features may not work as expected."
conflicts=("clipcc-bin" "clipcc")
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
noextract=("clipcc-3.1.2-beta2-win-x64.exe")
sha256sums=('b4d25ce5d4bb2dd99e99a871cad3c8ae4b4317a1106cd9d6b6b06c2a3cbec1ba'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'c293e53da40fa54dae3ec2598e89b3bb2f7159f57a37e739cbcb70e8663739ed'
            '3afe472ea0ceffe52834abed6d838f88892c22bc15ef421e01a8829fc8887be0'
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
