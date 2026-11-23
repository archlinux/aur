# Maintainer: ParticleG <particle_g at outlook dot com>
#
# Source of the AUR package. linux/aur/build.sh fills in pkgver, pkgrel, _loader and the checksums
# from linux/Cargo.toml, the release tag and linux/loader-release.json.

pkgname=astralparty-toys-linux
pkgver=0.1.0
pkgrel=1
_loader=3.8.3
pkgdesc='Native Linux build of AstralParty.Toys: launch Astral Party through Steam and manage CesiumLoader'
arch=('x86_64')
url='https://github.com/ParticleG/AstralParty.Toys.Linux'
license=('AGPL-3.0-only')
# icu is loaded at run time by .NET; xdg-utils provides xdg-open for the Steam launch.
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'icu' 'libgcc'
         'libsoup3' 'libstdc++' 'webkit2gtk-4.1' 'xdg-utils' 'zlib')
makedepends=('cargo' 'dotnet-sdk-8.0' 'jq' 'unzip')
optdepends=('protontricks: install, update and uninstall CesiumLoader'
            'steam: launch the game')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/linux-v$pkgver.tar.gz"
        "cesium-loader-$_loader.zip::https://github.com/higashitaniyume/CesiumLoader/releases/download/modloader-$_loader/cesium-loader-$_loader.zip")
noextract=("cesium-loader-$_loader.zip")
sha256sums=('fd65ca6aa4f6228b7a44fb650e0b137e0b99d942152c7a3f1351d2c9230a331d'
            '5960a562c9048f0c99c7b6c94bbda1b9db430522298e635497d1b32fc012848b')

_srcname=AstralParty.Toys.Linux-linux-v$pkgver

build() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  export DOTNET_CLI_HOME="$srcdir/dotnet-home" NUGET_PACKAGES="$srcdir/nuget"
  # The build script verifies the loader archive against linux/loader-release.json.
  CESIUM_LOADER_ARCHIVE="$srcdir/cesium-loader-$_loader.zip" bash linux/build-linux.sh
}

package() {
  local app="$pkgdir/usr/lib/$pkgname"
  install -d "$app" "$pkgdir/usr/bin"
  bsdtar -xf "$_srcname/linux/target/AstralParty.Toys-linux-x64.tar.gz" -C "$app" --strip-components 1 --no-same-owner
  mv "$app/share" "$pkgdir/usr/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$app/LICENSE" "$app/CesiumLoader-LICENSE.txt" "$app/CesiumLoader-NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/lib/$pkgname/astralparty-toys-linux" "$pkgdir/usr/bin/astralparty-toys-linux"
}
