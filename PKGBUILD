# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=vrcft-avalonia-git
pkgver=r212.1.1.1.0.r21.g4974f8f
pkgrel=2
pkgdesc="Cross-platform VRCFaceTracking made with Avalonia"
arch=('x86_64')
url="https://github.com/dfgHiatus/VRCFaceTracking.Avalonia"
license=('Apache-2.0')
source=(
  "vrcft::git+https://github.com/dfgHiatus/VRCFaceTracking.Avalonia"
  "fix-BinaryBaseParameter.patch"
  "VRCFaceTracking.Avalonia.desktop"
  "VRCFaceTracking.Avalonia.png"
)
sha256sums=(
  'SKIP'
  'a5871eadbb87f5eb6f9cfb42a0a2311eed05648054dbeef7048494d8f0f5b934'
  '3c3b38c08d6bdcc5610def27bb80c9ed0bef8618af94f2a6be6747399bdefc54'
  'f7bd3f98d1938601c69bc94cd4634c01913b826943eaec26546ef62f25047599'
)
makedepends=(
  'git'
  'dotnet-sdk>=10.0'
)
conflicts=('vrcft' 'vrcft-avalonia')
provides=('vrcft' 'vrcft-avalonia')

detect_platform() {
  if [[ "$(uname -m)" == "aarch64" ]]; then
      echo "linux-arm64"
  else
      echo "linux-x64"
  fi
}

_build_project="src/VRCFaceTracking.Avalonia.Desktop/VRCFaceTracking.Avalonia.Desktop.csproj"
_platform="$(detect_platform)"
_dotnet_version="10.0"

pkgver() {
  cd "$srcdir/vrcft"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

prepare() {
  cd "$srcdir/vrcft"
  git submodule update --init --recursive
  dotnet restore "$_build_project" -r "$_platform"
  # apply patch to src/VRCFaceTracking
  cd "$srcdir/vrcft/src/VRCFaceTracking"
  git reset --hard HEAD
  git apply "$srcdir/fix-BinaryBaseParameter.patch"
}

build() {
  cd "$srcdir/vrcft"
  dotnet publish "$_build_project" -r "$_platform" -c "Linux Release" --self-contained -f "net$_dotnet_version"
}

package() {
  cd "$srcdir"
  install -d -Dm755 "$pkgdir/opt"
  install -d -Dm755 "$pkgdir/opt/vrcft-avalonia"
  cp -r "$srcdir/vrcft/src/VRCFaceTracking.Avalonia.Desktop/bin/Linux Release/net10.0/linux-x64/." "$pkgdir/opt/vrcft-avalonia"
  install -d -Dm755 "$pkgdir/usr/bin"
  ln -s "/opt/vrcft-avalonia/VRCFaceTracking.Avalonia.Desktop" "$pkgdir/usr/bin/vrcft"
  install -d -Dm755 "$pkgdir/usr/share"
  install -d -Dm755 "$pkgdir/usr/share/applications"
  install -Dm644 VRCFaceTracking.Avalonia.desktop -t "$pkgdir/usr/share/applications"
  install -d -Dm755 "$pkgdir/usr/share/icons"
  install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
  install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/128x128"
  install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 VRCFaceTracking.Avalonia.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
}