# Maintainer: zhullyb <zhullyb at outlook dot com>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=fluent-reader-electron
_pkgname=fluent-reader
pkgver=1.1.4
pkgrel=1
pkgdesc='Modern desktop RSS reader built with Electron, React, and Fluent UI'
arch=('any')
url='https://hyliu.me/fluent-reader/'
license=('BSD')
depends=('hicolor-icon-theme' 'electron27')
makedepends=('nodejs' 'node-gyp' 'npm')
provides=("$_pkgname")
conflicts=(""$_pkgname"")
source=("https://github.com/yang991178/fluent-reader/archive/v${pkgver}.tar.gz"
        'fluent-reader.desktop'
        'fluent-reader.sh')
sha256sums=('0c5e5a610a563fe012a870efad7196c0d0f5979b592314864bc68ac913da98fa'
            '5774f9dcd354761fb94d5f8ee8a534d879a7497c1e1834273dd3f55fbfdd0be4'
            '6ac3a97107ebdf00fa924c8922a5cdef6d8cac5251301cbaefc7012d2c6e0e1c')

build() {
  cd ${_pkgname}-${pkgver}
  npm install
  export NODE_ENV=production
  export NODE_OPTIONS=--openssl-legacy-provider
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
 
