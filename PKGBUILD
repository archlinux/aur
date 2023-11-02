# Maintainer: CoolandonRS <contact @ numra.net>
pkgname=dynknockd
_slnname=dynknock
_projname=Dynknock_Server
pkgver=1.1.0
pkgrel=4
pkgdesc="Port knocking server using a periodicaly changing sequence"
arch=('x86_64')
url='https://github.com/CoolandonRS/dynknock'
license=("GPL3")
depends=("gcc-libs" "zlib" "glibc")
makedepends=("dotnet-sdk>7.0.0" "subversion")
source=("dynknockd::svn+https://github.com/CoolandonRS/$_slnname/tags/v$pkgver/$_projname" "dynknockd.service")
sha256sums=('SKIP' '7a44ee4f1cf895967b711b74dfd05c8ccf12632590e81ba849bca3fe02c05394')

build() {
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
