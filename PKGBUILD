# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.24.24
pkgrel=1
pkgdesc='A declarative language for describing and deploying Azure resources'
arch=(x86_64)
url='https://github.com/Azure/bicep'
license=(MIT)
depends=(
  dotnet-runtime-7.0
  gcc-libs
  glibc
)
makedepends=(dotnet-sdk-7.0)
checkdepends=(git)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4be0e7c779bd84464b9e6df97ef7c96d2e5dfe3ca3dee22575f32cb2c84ecc2a')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  printf '{"version": "%s"}' "$pkgver" > version.json
}

build() {
  cd "$_archive"

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  export NUGET_PACKAGES="$PWD/nuget"

  dotnet publish \
    --configuration Release \
    --framework net7.0 \
    --no-self-contained \
    --output lib \
    --runtime linux-x64 \
    src/Bicep.Cli/
}

check() {
  cd "$_archive"

  git init --quiet
  dotnet test ./src/Bicep.Cli.IntegrationTests
  dotnet test ./src/Bicep.Cli.UnitTests
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$pkgnum/"
  cp --archive --no-preserve=ownership lib/. "$pkgdir/usr/lib/$pkgname-$pkgnum/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$pkgnum/bicep" "$pkgdir/usr/bin/bicep"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
