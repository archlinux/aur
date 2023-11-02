# Maintainer: CoolandonRS <contact @ numra.net>
pkgname=dynknockd
_slnname=dynknock
_projname=Dynknock_Server
pkgver=1.1.0
pkgrel=2
pkgdesc="Port knocking server using a periodicaly changing sequence"
arch=('x86_64')
url='https://github.com/CoolandonRS/dynknock'
license=("GPL3")
depends=("gcc-libs" "zlib" "glibc")
makedepends=("dotnet-sdk>7.0.0" "subversion")
source=("svn+https://github.com/CoolandonRS/$_slnname/tags/v$pkgver/$_projname", "dynknockd.service")
sha256sums=('SKIP', 'c7a31b893bb373704bffc09d767d3c2853a277479f29382214e2f357e2d1b055')

build() {
  rm -rf $pkgname
  mv $_projname $pkgname
  cd $pkgname
  # For some reason, trimming assemblies breaks libpcap, so we don't.
  MSBUILDDISABLENODEREUSE=1 dotnet publish --configuration Release --self-contained true --runtime linux-x64 -p:PublishTrimmed=false --output ../$pkgname ./$_projname.csproj
}

package() {
  install -d $pkgdir/usr/{bin,lib}
  install -d $pkgdir/etc/dynknock/hallways
  install -Dm644 ./dynknockd.service "$pkgdir/usr/lib/systemd/system/dynknockd.service"
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/$_projname" "$pkgdir/usr/bin/$pkgname"
}
