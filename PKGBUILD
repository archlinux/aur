# Maintainer: mdmrk <mariodavo.20@gmail.com>
pkgname=sharpemu-git
pkgver=0.0.1.r234.gad92ab3
pkgrel=1
pkgdesc="Experimental PlayStation 5 emulator written in C#"
arch=('x86_64')
url="https://github.com/sharpemu/sharpemu"
license=('GPL-2.0-or-later AND MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'openssl' 'fontconfig' 'libx11'
         'vulkan-icd-loader')
makedepends=('git' 'dotnet-sdk>=10.0')
optdepends=('vulkan-driver: Vulkan GPU driver (vulkan-radeon, vulkan-intel, nvidia-utils, ...)')
provides=('sharpemu')
conflicts=('sharpemu')
options=('!strip' '!debug')
source=("sharpemu::git+$url.git"
        'sharpemu.desktop')
sha256sums=('SKIP'
            '5136e942050b7756659c91391de742a29e0db9e4064db3d045de0397752d567d')

pkgver() {
  cd sharpemu
  local ver
  ver=$(sed -n 's|.*<SharpEmuVersion>\(.*\)</SharpEmuVersion>.*|\1|p' Directory.Build.props | tr '-' '.')
  printf '%s.r%s.g%s' "${ver:-0.0.1}" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd sharpemu
  rm -f global.json
}

build() {
  cd sharpemu
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  dotnet publish src/SharpEmu.CLI/SharpEmu.CLI.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --self-contained true
}

package() {
  cd sharpemu
  local publishdir
  publishdir=(artifacts/publish/SharpEmu.CLI/Release/net*/linux-x64)

  install -Dm755 "$publishdir/SharpEmu" "$pkgdir/usr/lib/sharpemu/SharpEmu"
  find "$publishdir" -name 'libglfw*' \
    -exec install -Dm644 -t "$pkgdir/usr/lib/sharpemu/" {} +
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/sharpemu/SharpEmu "$pkgdir/usr/bin/sharpemu"

  install -Dm644 "$srcdir/sharpemu.desktop" \
    -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/images/logo.png \
    "$pkgdir/usr/share/pixmaps/sharpemu.png"

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSES/MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
