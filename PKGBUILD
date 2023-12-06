# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.23.1
pkgrel=3
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
sha256sums=('2997d5cffe1c72f5bec204fe2e7509877b9d2bdf715219fa7a895d74118cd7c3')

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
