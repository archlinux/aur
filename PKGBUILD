# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.20.4
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
sha256sums=('ae6f6e15ee14a0ae58b91b2002ca28f9b1f8a05d9d1c17f4b75572ee778bc1b4')

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
