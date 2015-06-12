# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=ironpython-git
pkgver=2.7.2.a2.471.g7be8b73
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono')
makedepends=('git')
options=('!strip' 'emptydirs' 'libtool')
source=($pkgname::git://github.com/IronLanguages/main.git
        site.patch)
md5sums=('SKIP'
         'dd484ca6dfe03277d8a13e7b1cfe6662')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g;s|^ipy\.||'
}

build() {
  cd "$srcdir/$pkgname"
  sed -i "/NoWarn/s|444;||" Solutions/Common.proj
  xbuild Solutions/IronPython.sln /p:Mono=true /p:Configuration="Release"
}

package() {
  mkdir -p "$pkgdir/opt/ipy" "$pkgdir/usr/bin"
  cp -r $srcdir/$pkgname/bin/Release/* "$pkgdir/opt/ipy"
  for bin in ipy ipy64 ipyw ipyw64; do
    echo -e "#!/bin/sh\nmono /opt/ipy/$bin.exe $*" > "$pkgdir/usr/bin/$bin"
    chmod +x "$pkgdir/usr/bin/$bin"
  done

  cd "$pkgdir/opt/ipy/Lib"
  patch -p0 < "$srcdir/site.patch"
}

