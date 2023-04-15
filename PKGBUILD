# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.16.2
_pkgnum=${pkgver:0:1}
pkgrel=1
pkgdesc='A declarative language for describing and deploying Azure resources'
arch=(x86_64)
url='https://github.com/Azure/bicep'
license=(MIT)
makedepends=(dotnet-sdk)
depends=(dotnet-runtime)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b37cdb8f7b86b09e4d56b9a0c7a25dc16de3704f39edda211ca9eb6fddffdc6f')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  echo "{\"version\": \"$pkgver\"}" > version.json
}

build() {
  cd "$_archive"

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export NUGET_PACKAGES="$srcdir/$_archive/nuget"

  dotnet publish \
    --no-self-contained \
    --configuration Release \
    --output bin \
    --runtime "linux-x64" \
    ./src/Bicep.Cli/
}

check() {
  cd "$_archive"

  dotnet test ./src/Bicep.Cli.IntegrationTests
  dotnet test ./src/Bicep.Cli.UnitTests
}

package() {
  cd "$_archive"

  mkdir -p "$pkgdir/opt/azure/$pkgname/$_pkgnum"
  cp -ar bin/. "$pkgdir/opt/azure/$pkgname/$_pkgnum/"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/azure/$pkgname/$_pkgnum/bicep" "$pkgdir/usr/bin/bicep"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
