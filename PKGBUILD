# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=nsfw
pkgver='0.1.184'
pkgrel=1
pkgdesc="NSW File CLI Tool"
arch=('x86_64')
url="https://github.com/emargee/nsfw"
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('git' 'dotnet-sdk-8.0')
source=("git+https://github.com/emargee/nsfw.git#tag=v${pkgver}")
md5sums=('SKIP')
options=('!debug' '!strip')

prepare() {
  cd "$srcdir/${pkgname}"

  rm -rf dist
}

build() {
  cd "$srcdir/${pkgname}"

  # It would be preferable to instead place libe_sqlite3.so in /usr/lib/nsfw/
  # and have the binary search this directory for the library, however I
  # haven't been able to figure out how to do this
  dotnet publish src/nsfw/nsfw.csproj \
      -c Release \
      -o ./dist/ \
      -r linux-x64 \
      -p:IncludeNativeLibrariesForSelfExtract=true
}

package() {
  cd "$srcdir/${pkgname}"

  mkdir -p "$pkgdir/usr/bin"
  cp "./dist/nsfw" "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/licenses/nsfw"
  cp "./LICENSE" "$pkgdir/usr/share/licenses/nsfw"
}
