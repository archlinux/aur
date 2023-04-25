# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar at gmail dot com>

pkgname=scratch3
conflicts=("scratch3-bin")

pkgver=3.29.1
pkgrel=3
_electronDist=electron13
_electronVersion=13.6.9

pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("x86_64" "i686" "aarch64" "arm7h")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=("c-ares" "ffmpeg" "gtk3" "libevent" "libxslt" "minizip" "nss" "re2" "snappy")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")

## /!\    bin version of electron   ↓↓↓ (AUR package)  /!\
makedepends=('npm' "${_electronDist}-bin" "nodejs-lts-fermium")
source=("https://github.com/LLK/scratch-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.xml"
        "$pkgname-icons.tar.gz"
        "$pkgname-patches.tar.gz")
sha256sums=('1daab6d39dc94deca057fbe90642b96ea0c143149ee04ee74dd9648b051e6a14'
            '0f4f25e55b988e45a2f240487c35b18c96bbbce0f6be60bbe204b33f6d77d6da'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf'
            '326558f3f2d4044ea897d22baab2f23fbfc2034d7d11dfb8215ee6ba29106001'
            'c4e442841e8c248cecf782155460f4cb36c41eedc3d60b61a704af0cff3af437')

appOutputDir="linux-unpacked"

case "$CARCH" in
  x86_64)  appOutputDir="linux-unpacked";;
  i686)    appOutputDir="linux-ia32-unpacked";;
  aarch64) appOutputDir="linux-arm64-unpacked";;
  arm7h)   appOutputDir="linux-armv7l-unpacked";;
  *)       appOutputDir="linux-notSupported";;
esac

## Needs testing (for arm7h and i686)!
## arm and arm6h: they don't seem to be supported by Electron.
## Value for aarch64 given and tested by one user: ok on Raspberry Pi 4B.
## Other values deduced from previous one with no warranty.
## To find them out, start installation like usual.
## If it succeeds, fine. If not, in the output of the build,
## look for this kind of line, at the end of the (failed) build:
##   • packaging  platform=linux arch=????? electron=15.x.y appOutDir=dist/linux-?????-unpacked
## In any case, please report to the maintainer, thanks.

prepare() {
   cd "$srcdir/"

#  Adjust electron version targeted in (generic) patch files
   sed -i "s|13.x.y|$_electronVersion|" package-json.patch
   sed -i "s|/usr/lib/electronXX|/usr/lib/$_electronDist|" electron-builder-yaml.patch
   sed -i "s|13.x.y|$_electronVersion|" electron-builder-yaml.patch

#  Copy patch files to be able to compile on Linux platform
   cp package-json.patch scratch-desktop-${pkgver}/
   cp electron-builder-yaml.patch scratch-desktop-${pkgver}/
   cp index-js-1.patch scratch-desktop-${pkgver}/src/main/
   cp index-js-2.patch scratch-desktop-${pkgver}/src/main/

   cd "scratch-desktop-${pkgver}/"
   patch < package-json.patch
   patch < electron-builder-yaml.patch

   cd "src/main/"
   patch < index-js-1.patch
#  With patch #2, ShowSaveDialog will remember last used dir like on Windows
#  Feel free to comment it out if you prefer the buggy version
   patch < index-js-2.patch
#  If someone could write something similar for the ShowOpenDialog...
}

build(){
   cd "$srcdir/scratch-desktop-${pkgver}/"

#  Node modules installation & application compilation
   npm install
   npm run clean && npm run compile && npm run fetch

#  Remove all refs to $srcdir in dist/main/main.js and dist/renderer/renderer.js
#  in order to avoid warnings at package error check.

   cd "$srcdir/scratch-desktop-${pkgver}/dist/renderer/"
   rmString="/\*! ${srcdir}/scratch-desktop-${pkgver}/src/renderer/index.js \*/"
   sed -i "s|${rmString}||" renderer.js

   cd "$srcdir/scratch-desktop-${pkgver}/dist/main/"
   rmString="/\*! ${srcdir}/scratch-desktop-${pkgver}/src/main/index.js \*/"
   sed -i "s|${rmString}||" main.js

   cd "$srcdir/scratch-desktop-${pkgver}/"

#  File generation
   npx electron-builder --linux

#  To avoid the default Electron icon to be used
   cp ../icon256.png "dist/${appOutputDir}/resources/icon.png"

#  Copy/move all license files in one single place ($srcdir)
   cp LICENSE ../
   cp TRADEMARK ../
#  Temporary fix for using electron13-bin
#    mv dist/${appOutputDir}/LICENSE* ../
   cp /usr/share/licenses/${_electronDist}-bin/LICENSE ../LICENSE-electron
   cp /usr/share/licenses/${_electronDist}-bin/LICENSES.chromium.html ../LICENSES.chromium.html

#  And the icon file in SVG format
   cp src/icon/ScratchDesktop.svg ../$pkgname.svg
}

package() {
   cd "$srcdir"
   install -dm755 ${pkgdir}/usr/bin
   ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
   install -Dm644 "${pkgname}.desktop" $pkgdir/usr/share/applications/${pkgname}.desktop
   install -Dm644 "${pkgname}.xml" $pkgdir/usr/share/mime/packages/${pkgname}.xml
   install -Dm644 "$pkgname.svg" $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
   install -Dm644 "cathead.svg" $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/x-scratch3-sprite.svg
   install -Dm644 TRADEMARK "$pkgdir/usr/share/licenses/$pkgname/TRADEMARK"
   install -Dm644 LICENS* -t "$pkgdir/usr/share/licenses/$pkgname"
   install -dm755 "${pkgdir}/opt/$pkgname"
   cd "scratch-desktop-${pkgver}/dist/${appOutputDir}"
   cp -r * -t "$pkgdir/opt/$pkgname"
}
