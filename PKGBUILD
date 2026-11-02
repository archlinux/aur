# Maintainer: Jiān <coolduderude dot null at gmail dot com>

pkgname=il2cppdumper
_name=Il2CppDumper
_commit=4741d46ba9cd6159c5d853eb9d6fc48b4bfa2b1a
pkgver=6.7.46.r1.g4741d46
pkgrel=1
pkgdesc="Unity IL2CPP metadata dumper"
arch=('x86_64')
url='https://github.com/Perfare/Il2CppDumper'
license=('MIT')
arch=('x86_64')
depends=('dotnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0')
provides=('il2cppdumper')
conflicts=('il2cpp-dumper-bin')
options=('!strip' '!debug')
source=("git+$url.git#commit=$_commit"
        '0001-change-sdk.patch'
        '0002-improve-cli-for-linux.patch'
)
sha256sums=('SKIP'
            'a8ce33344ddc67e09a307bd0d2428dcabd0d7dcfe656e3d0d011a3972ddb33f9'
            '37a90f7db86a948c0c7108fa8b62ed3490cc8b4be58313183103c2550eb6f932')

#pkgver() {
#  cd "$_name"
#  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  cd "$_name/Il2CppDumper"
  for p in "$srcdir"/*.patch; do
    patch -Np2 -i "$p"
  done
  export NUGET_PACKAGES="$srcdir/nuget" DOTNET_NOLOGO=1 DOTNET_CLI_TELEMETRY_OUTPUT=1
  dotnet restore -r linux-x64
}

build() {
  cd "$_name/Il2CppDumper"
  export NUGET_PACKAGES="$srcdir/nuget" DOTNET_NOLOGO=1 DOTNET_CLI_TELEMETRY_OUTPUT=1
  dotnet publish \
    -c Release \
    -p:DebugType=none \
    --no-restore \
    -p:PublishSingleFile=true \
    -p:NuGetAudit=false \
    -o "$srcdir/out"
}

package() {
  # At this point we have a single executable, which doesn't need a dotnet runtime.
  install -Dm755 "$srcdir/out/Il2CppDumper" "$pkgdir/usr/bin/il2cppdumper"

  # Add License
  install -Dm644 "$srcdir/$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 0002-improve-cli-for-linux.patch changes the behaviour of the config file
  install -Dm644 "$srcdir/out/config.json" "$pkgdir/usr/share/doc/$pkgname/il2cppdumper.example.json"

  # Add Readme
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/Il2CppDumper"/*.md

  # Add scripts for different reverse engineering tools
  install -Dm644 -t "$pkgdir/usr/share/il2cppdumper/scripts" "$srcdir/out"/*.py
}
