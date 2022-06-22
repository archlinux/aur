# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby
pkgver=1.0.181
pkgrel=2
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://eugeny.github.io/terminus/"
license=('MIT')
conflicts=('terminus-terminal')
replaces=('terminus-terminal')
depends=('glib2' 'gtk3' 'nss' 'libxcrypt-compat')
makedepends=('git' 'npm' 'yarn' 'python' 'nodejs-lts-gallium' 'cmake' 'node-gyp')
source=("git+https://github.com/Eugeny/tabby.git#tag=v$pkgver")
sha256sums=('SKIP')

build(){
  cd "$srcdir/$pkgname/"
  export ARCH=x86_64
  yarn install
  ./scripts/install-deps.js
  yarn run build
  ./scripts/build-native.js
  ./node_modules/.bin/electron-builder --linux deb
}

package() {
  cd "$srcdir/$pkgname/dist/"
  ar x *.deb
  tar -xf data.tar.xz
  cp -r usr/ "$pkgdir"
  cp -r opt/ "$pkgdir"

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/"$pkgname" <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

END

}
