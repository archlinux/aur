# Maintainer: Essem <smswessem@gmail.com>

pkgname=fdspacker
pkgver=1.0
_commit=3cb4b791246cf4772bf644f622486adbfe48f51a
pkgrel=1
pkgdesc="Simple tool to pack and unpack .fds files"
arch=(x86_64)
url="https://github.com/ClusterM/fdspacker"
license=(GPL-3.0-only)
_dotnet_version=6.0
depends=(
  "dotnet-runtime-$_dotnet_version"
  gcc-libs
  glibc
)
makedepends=(
  "dotnet-sdk-$_dotnet_version"
  git
)
options=(!debug !strip)
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet restore --locked-mode -r linux-x64 ./FDSPacker
  dotnet restore --locked-mode -r linux-x64 ./FDSPackerTests

  git remote set-url origin "$url"
}

build() {
  cd "$pkgname"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet publish \
    --no-restore \
    --framework "net$_dotnet_version" \
    -r linux-x64 \
    --no-self-contained \
    -c release \
    --output lib \
    ./FDSPacker
}

check() {
  cd "$pkgname"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet test \
    --no-restore \
    --framework "net$_dotnet_version" \
    ./FDSPackerTests
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp --archive -t "$pkgdir/usr/lib/$pkgname" lib/*

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
