# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=ironpython-git
pkgver=2.7.7.ac72964d7
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono')
makedepends=('git' 'msbuild-bin')
options=('!strip' 'emptydirs' 'libtool')
source=($pkgname::git://github.com/IronLanguages/ironpython2.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g;s|^ipy\.||'
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  msbuild.exe Build.proj /t:Build /p:Mono=true /p:BuildFlavour=Release /p:Platform="Any CPU" /verbosity:minimal /nologo
}

package() {
  mkdir -p "$pkgdir/opt/ipy" "$pkgdir/usr/bin"
  cp -r $srcdir/$pkgname/bin/Release/* "$pkgdir/opt/ipy"
  for bin in ipy ipy64 ipyw ipyw64; do
    echo -e "#!/bin/sh\nmono /opt/ipy/$bin.exe $*" > "$pkgdir/usr/bin/$bin"
    chmod +x "$pkgdir/usr/bin/$bin"
  done
}
