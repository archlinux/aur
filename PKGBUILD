# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=tabby
pkgver=1.0.205
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://eugeny.github.io/terminus/"
license=('MIT')
conflicts=('terminus-terminal')
replaces=('terminus-terminal')
depends=('glib2' 'gtk3' 'nss' 'libxcrypt-compat')
makedepends=('git' 'npm' 'yarn' 'python' 'nodejs-lts-hydrogen' 'cmake' 'node-gyp' 'rpm-tools')
source=("git+https://github.com/Eugeny/tabby.git#tag=v$pkgver")
sha256sums=('SKIP')

build(){
  cd "$srcdir/$pkgname/"
#  export ARCH=x86_64
  yarn install
  ./scripts/install-deps.mjs
  yarn run build
  ./scripts/build-native.mjs
  ./scripts/build-linux.mjs
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
