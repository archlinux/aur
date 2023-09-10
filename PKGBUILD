# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.21.1
pkgrel=1
pkgdesc='A declarative language for describing and deploying Azure resources'
arch=(x86_64)
url='https://github.com/Azure/bicep'
license=(MIT)
depends=(
  dotnet-runtime
  gcc-libs
  glibc
)
makedepends=(dotnet-sdk)
checkdepends=(git)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03dabaa0bbfb8056464f59184179621e68bf0684132a9081c52f19d1c046da18')

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
    --output bin \
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

  mkdir -p "$pkgdir/opt/azure/$pkgname/$pkgnum"
  cp -ar bin/. "$pkgdir/opt/azure/$pkgname/$pkgnum/"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/azure/$pkgname/$pkgnum/bicep" "$pkgdir/usr/bin/bicep"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
