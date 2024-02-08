# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bicep
pkgver=0.25.3
_commit=862708594aa0d8e292f33b355df25e7bacab6f55
pkgrel=1
pkgdesc="A declarative language for describing and deploying Azure resources"
arch=(x86_64)
url="https://github.com/Azure/bicep"
license=(MIT)
_dotnet_version=8.0
depends=(
  "dotnet-runtime-$_dotnet_version"
  gcc-libs
  glibc
)
makedepends=(
  "dotnet-sdk-$_dotnet_version"
  git
)
options=(!strip)
source=("git+$url.git?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub <noreply@github.com>

_archive="$pkgname"

prepare() {
  cd "$_archive"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet restore --locked-mode src/Bicep.Cli
  dotnet restore --locked-mode src/Bicep.Cli.IntegrationTests
  dotnet restore --locked-mode src/Bicep.Cli.UnitTests

  # I couldn't find any way of silencing the very verbose warnings from
  # Microsoft.SourceLink other than to set the remote to a proper URL..
  git remote set-url origin "$url"

  sed -i 's|<PublishTrimmed>true</PublishTrimmed>|<PublishTrimmed>false</PublishTrimmed>|' \
    src/Bicep.Cli/Bicep.Cli.csproj
}

build() {
  cd "$_archive"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet publish \
    --no-restore \
    --framework "net$_dotnet_version" \
    --runtime linux-x64 \
    --no-self-contained \
    --configuration release \
    --output lib \
    src/Bicep.Cli
}

check() {
  cd "$_archive"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet test \
    --no-restore \
    --framework "net$_dotnet_version" \
    ./src/Bicep.Cli.IntegrationTests
  dotnet test \
    --no-restore \
    --framework "net$_dotnet_version" \
    ./src/Bicep.Cli.UnitTests
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$pkgnum"
  cp --archive -t "$pkgdir/usr/lib/$pkgname-$pkgnum" lib/*

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$pkgnum/bicep" "$pkgdir/usr/bin/bicep"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
