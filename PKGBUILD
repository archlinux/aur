# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=microsoft-python-language-server
pkgver=2019.1
pkgrel=1
pkgdesc="Microsoft Language Server for Python"
url="https://github.com/Microsoft/python-language-server"
arch=(any)
license=(Apache)
depends=(dotnet-runtime)
makedepends=(dotnet-sdk)
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

prepare() {
  cd $pkgname/src/LanguageServer/Impl
  dotnet restore
}

build() {
  cd $pkgname/src/LanguageServer/Impl
  dotnet build -c Release --no-restore
}

package() {
  cd $pkgname/src/LanguageServer/Impl
  dotnet publish -c Release --no-build -o "$pkgdir/usr/lib/$pkgname"
  install -D /dev/stdin "$pkgdir/usr/bin/mspyls" <<END
#!/bin/sh
exec dotnet /usr/lib/$pkgname/Microsoft.Python.LanguageServer.dll "\$@"
END
}
