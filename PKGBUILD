# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: relrel <relrelbachar at gmail dot com>

pkgname=scratch3
conflicts=("scratch3-bin")
pkgver=3.27.0
pkgrel=4
pkgdesc="Scratch 3.0 as a self-contained desktop application"
arch=("x86_64" "aarch64")
url="https://scratch.mit.edu"
license=("custom:BSD-3-Clause")
depends=("gtk3" "nss")
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('npm' 'patch' 'sed')
source=("https://github.com/LLK/scratch-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.xml"
        "$pkgname-icons.tar.gz"
        "$pkgname-patches.tar.gz")
sha256sums=('0bb89f64bc933a00a56fd87a3a27b2106b42d0dc1ba61cf1a9f3f19beae5cec8'
            '0f4f25e55b988e45a2f240487c35b18c96bbbce0f6be60bbe204b33f6d77d6da'
            '86c8e16d9316dcbe21c19928381a498f5198708cae0ed25bfa3c09371d02deaf'
            '326558f3f2d4044ea897d22baab2f23fbfc2034d7d11dfb8215ee6ba29106001'
            'd8e403d2a994e315dbe5a7d910710387dcf45fa49c5f1d3c988fbdde2d97b4b2')

appOutputDir="linux-unpacked"

case "$CARCH" in
  x86_64)  appOutputDir="linux-unpacked";;
  aarch64) appOutputDir="linux-arm64-unpacked";;
  arm)     appOutputDir="linux-armv5-unpacked";;
  arm6h)   appOutputDir="linux-armv6-unpacked";;
  arm7h)   appOutputDir="linux-armv7-unpacked";;
  *)       appOutputDir="linux-unpacked";;
esac

## Needs testing (for aarch64, arm, arm6h, arm7h)!
## Values for aarch64 given by one user but no feedback yet.
## Other values deduced from previous one.
## To find them out, start installation like usual.
## If it succeeds, fine. If not, in the output of the build,
## look for this kind of line, at the end of the build:
##   • packaging  platform=linux arch=????? electron=13.6.3 appOutDir=dist/linux-?????-unpacked
## In any case, please give a feedback to the maintainer, thanks.

prepare() {
   cd "$srcdir"

#  Copy patch files to be able to compile on Linux platform
#  and with our own electron version (13.6.3)
   cp package-json.patch scratch-desktop-${pkgver}/
   cp electron-builder-yaml.patch scratch-desktop-${pkgver}/
   cp electron-builder-wrapper-js.patch scratch-desktop-${pkgver}/scripts/
   cp index-js.patch scratch-desktop-${pkgver}/src/main/

   cd "scratch-desktop-${pkgver}"
   patch < package-json.patch
   patch < electron-builder-yaml.patch

   cd scripts
   patch < electron-builder-wrapper-js.patch

   cd ../src/main/
   patch < index-js.patch
   cd ../..

#  Dependencies installation & application compilation
   npm install
   npm run clean && npm run compile && npm run fetch

#  Remove all refs to $srcdir in dist/main/main.js and dist/renderer/renderer.js
#  in order to avoid warnings at package error research.

   cd dist/renderer
   rmString="/\*! ${srcdir}/scratch-desktop-3.27.0/src/renderer/index.js \*/"
   sed -e "s|${rmString}||" renderer.js > renderer2.js
   mv renderer2.js renderer.js

   cd ../main
   rmString="/\*! ${srcdir}/scratch-desktop-3.27.0/src/main/index.js \*/"
   sed -e "s|${rmString}||" main.js > main2.js
   mv main2.js main.js
   cd ../..

#  File generation
   npx electron-builder --linux

#  To avoid the default Electron icon to be used
   cp ../icon256.png dist/${appOutputDir}/resources/icon.png

#  Copy/move all license files in one single place ($srcdir)
   cp LICENSE ../
   cp TRADEMARK ../
   mv dist/${appOutputDir}/LICENSE* ../

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
