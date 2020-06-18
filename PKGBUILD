# Maintainer: Wil Thomason (wbthomason) <wbthomason@cs.cornell.edu>

pkgname=microsoft-python-language-server-git
pkgver=r955.2aef1f81
pkgrel=1
pkgdesc="Microsoft Language Server for Python"
url="https://github.com/Microsoft/python-language-server"
arch=(any)
license=(Apache)
depends=(dotnet-runtime)
makedepends=(dotnet-sdk git)
conflicts=('microsoft-python-language-server')
provides=('microsoft-python-language-server')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

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

  # Returns 1 but reports no error (???)
  dotnet publish -c Release --no-build -o "$pkgdir/usr/lib/$pkgname" || :

  install -D /dev/stdin "$pkgdir/usr/bin/mspyls" <<END
#!/bin/sh
exec dotnet /usr/lib/$pkgname/Microsoft.Python.LanguageServer.dll "\$@"
END
}
