# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=ironpython-git
pkgver=r2315.ac72964d7
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono' 'msbuild-bin')
makedepends=('git')
options=('!strip' 'emptydirs' 'libtool')
source=($pkgname::git+https://github.com/IronLanguages/ironpython2.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git checkout ac72964d7
  git submodule update --init
}

build() {
  cd "$srcdir/$pkgname"
  git checkout ac72964d7
  msbuild.exe Build.proj /t:Build /p:Mono=true /p:BuildFlavour=Release \
    /p:Platform="Any CPU" /verbosity:minimal /nologo
}

package() {
  mkdir -p "$pkgdir/opt/ipy" "$pkgdir/usr/bin"
  cp -r $srcdir/$pkgname/bin/Release/* "$pkgdir/opt/ipy"
  for bin in ipy ipy64 ipyw ipyw64; do
    echo -e "#!/bin/sh\nmono /opt/ipy/$bin.exe $*" > "$pkgdir/usr/bin/$bin"
    chmod +x "$pkgdir/usr/bin/$bin"
  done
}
