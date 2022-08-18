# Maintainer: zhullyb <zhullyb at outlook dot com>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=fluent-reader-electron
_pkgname=fluent-reader
pkgver=1.1.2
pkgrel=1
pkgdesc='Modern desktop RSS reader built with Electron, React, and Fluent UI'
arch=('any')
url='https://hyliu.me/fluent-reader/'
license=('BSD')
depends=('hicolor-icon-theme' 'electron19')
makedepends=('nodejs' 'node-gyp' 'npm')
provides=("$_pkgname")
conflicts=(""$_pkgname"")
source=("https://github.com/yang991178/fluent-reader/archive/v${pkgver}.tar.gz"
        'fluent-reader.desktop'
        'fluent-reader.sh')
sha256sums=('313bf3d0a3ac607d919434234828064f6739b6f009a39088b44531a6c91ff060'
            '5774f9dcd354761fb94d5f8ee8a534d879a7497c1e1834273dd3f55fbfdd0be4'
            '6ba3512d8e8c5f95e00ca2ada566c22aabfb90b6f53f4b639735fcbf1a06f998')

build() {
  cd ${_pkgname}-${pkgver}
  npm install
  export NODE_ENV=production
  npm run build
  node_modules/.bin/electron-builder --linux dir -p never
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 "bin/linux/x64/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$_pkgname/app.asar"
  
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$_pkgname.desktop"
  
  install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" LICENSE
}
 
