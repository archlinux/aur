# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar at gmail dot com>

pkgname=scratch3
conflicts=("scratch3-bin")

pkgver=3.30.5
pkgrel=2
_electronDist=electron13
_electronVersion=13.6.9
_node_version=16

pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("x86_64" "i686" "aarch64" "arm7h")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=("c-ares" "ffmpeg" "gtk3" "libevent" "libxslt" "minizip" "nss" "re2" "snappy")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")

## /!\    bin version of electron   ↓↓↓ (AUR package)  /!\
makedepends=("nvm" "${_electronDist}-bin")
source=("https://github.com/scratchfoundation/scratch-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.xml"
        "$pkgname-icons.tar.gz"
        "$pkgname-patches.tar.gz")
sha256sums=('7a626b38d75a04a01b1be45c8167854973de5f600daf627c8b367bf02025860b'
            '0f4f25e55b988e45a2f240487c35b18c96bbbce0f6be60bbe204b33f6d77d6da'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf'
            '326558f3f2d4044ea897d22baab2f23fbfc2034d7d11dfb8215ee6ba29106001'
            '4a10d77dc5146e02af47680a88589cee9e0cc102951737957711f3186e1ba3f6')

appOutputDir="linux-unpacked"

case "$CARCH" in
  x86_64)  appOutputDir="linux-unpacked";;
  i686)    appOutputDir="linux-ia32-unpacked";;
  aarch64) appOutputDir="linux-arm64-unpacked";;
  arm7h)   appOutputDir="linux-armv7l-unpacked";;
  *)       appOutputDir="linux-notSupported";;
esac

_ensure_local_nvm() {
    command -v nvm >/dev/null && nvm deactivate && nvm unload
    unset npm_config_prefix
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
   cd "${srcdir}/scratch-desktop-${pkgver}"
   _ensure_local_nvm
   nvm ls "$_node_version" &>/dev/null || nvm install "$_node_version" || false

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
   _ensure_local_nvm
   nvm use "$_node_version"

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
