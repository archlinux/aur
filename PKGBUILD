# Maintainer: Markus Hoffmann

pkgname=spiceforge
pkgver=0.0.1
pkgrel=1
pkgdesc='Real-time audio circuit simulator and schematic editor based on LiveSPICE'
arch=('x86_64')
url='https://github.com/mikeoliphant/SpiceForge'
license=('MIT' 'Apache-2.0')
depends=('aspnet-runtime-10.0' 'glibc' 'xdg-utils')
makedepends=('aspnet-targeting-pack-10.0' 'dotnet-sdk-10.0' 'nodejs>=22' 'npm')
optdepends=('jack: live audio through JACK or PipeWire JACK'
            'chromium: editor in a standalone browser window')
options=('!debug')
_srcname="SpiceForge-$pkgver"
_livespice=b2a4bb0ec4d3c4cdb158530ab4b20c13207030f7
_jacksharpcore=8ca7a0452fccbfa8a31709926a6d73025c437ad9
_computeralgebra=20634f1c2465471133abb166a26b321e0003fe5b
source=(
  "${_srcname}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "LiveSPICE-$_livespice.tar.gz::https://github.com/mikeoliphant/LiveSPICE/archive/$_livespice.tar.gz"
  "JackSharpCore-$_jacksharpcore.tar.gz::https://github.com/mikeoliphant/JackSharpCore/archive/$_jacksharpcore.tar.gz"
  "ComputerAlgebra-$_computeralgebra.tar.gz::https://github.com/dsharlet/ComputerAlgebra/archive/$_computeralgebra.tar.gz"
)
sha256sums=(
  '14db27fba06e42bcb7ef245688a024733722af4cd2fa49af9cce2c00b92a0ea8'
  '5304cee73b4ff35d5f6697ffa96ba99f3a0a3ace7c967526c9219de955cbc784'
  '932700d795ede8ed96d3931d8827332abe9c7613f18d3c545906248f5c1cd84c'
  '3526a7f8f1582d56ecdb2084301c8aa9ba151b924cdd512d729a6df7bc9872e3'
)

prepare() {
  cp -aT "LiveSPICE-$_livespice" "$_srcname/Dependencies/LiveSPICE"
  cp -aT "JackSharpCore-$_jacksharpcore" "$_srcname/Dependencies/JackSharpCore"
  cp -aT "ComputerAlgebra-$_computeralgebra" "$_srcname/Dependencies/LiveSPICE/ComputerAlgebra"
}

build() {
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_GENERATE_ASPNET_CERTIFICATE=false
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export NUGET_PACKAGES="$srcdir/nuget"
  export npm_config_cache="$srcdir/npm-cache"

  cd "$_srcname/SpiceForgeWebUI"
  npm ci
  npm run build
  rm -f dist/app.js.map

  cd ..
  # Arch's ASP.NET Core targeting pack can lack NuGet pruning metadata.
  dotnet publish SpiceForgeServer -c Release --no-self-contained \
    -p:SpiceForgeVersion="$pkgver" -p:StaticWebAssetsEnabled=false \
    -p:IsTransformWebConfigDisabled=true -p:AllowMissingPrunePackageData=true \
    -p:DebugType=embedded -p:PathMap="$srcdir=/_/" \
    -o "$srcdir/publish"
}

package() {
  local _app="$pkgdir/usr/lib/spiceforge"

  cd "$_srcname"
  install -dm755 "$_app" "$pkgdir/usr/bin"
  cp -a "$srcdir/publish/." "$_app/"
  cp -a SpiceForgeWebUI/dist "$_app/wwwroot"
  cp -a Dependencies/LiveSPICE/Tests/Examples "$_app/Examples"
  ln -s ../lib/spiceforge/SpiceForgeServer "$pkgdir/usr/bin/spiceforge"

  install -Dm644 /dev/stdin "$_app/appsettings.json" <<'EOF'
{
  "open": "app"
}
EOF
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_app"/licenses/*.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" CREDITS.md
  install -Dm644 Assets/Icon/SpiceForge-256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/spiceforge.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/spiceforge.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=SpiceForge
Comment=Simulate audio circuits and edit schematics
Exec=spiceforge
Icon=spiceforge
Terminal=false
Categories=AudioVideo;Audio;
EOF
}
