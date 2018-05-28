# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal
_pkgname=terminus
_pkgver=1.0.0
pkgver=v1.0.0.alpha.47.r0.g1d69082
pkgrel=2
alpha=47
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://eugeny.github.io/terminus/"
license=('MIT')
depends=('nodejs' 'fontconfig')
makedepends=('git' 'npm' 'yarn' 'python2')
source=("git+https://github.com/Eugeny/terminus#tag=v${_pkgver}-alpha.${alpha}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}  

build(){
  cd "$srcdir/$_pkgname/"
  yarn install
  ./scripts/install-deps.js
  yarn run build
  ./scripts/build-native.js
  ./scripts/build-linux.js
  
}

package() { 
  cd "$srcdir/$_pkgname/dist/"
  ar x *.deb
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Terminus/terminus

END

}
