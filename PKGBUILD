# Maintainer: Vasiliy <ldzkeymylp@gmail.com>
pkgname=osu-radio-git
pkgver=0.1.0alpha.r55.g3cf6e1c
pkgrel=1
pkgdesc='Desktop music player for local osu! libraries (development version)'
arch=('x86_64')
url='https://github.com/Jayko321/osu-radio'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'alsa-lib' 'qt6-base>=6.8' 'qt6-declarative>=6.8' 'qt6-svg' 'qt6-wayland' 'dotnet-runtime-10.0' 'xdg-desktop-portal' 'xdg-desktop-portal-impl')
makedepends=('git' 'rustup' 'dotnet-sdk-10.0' 'lld' 'pkgconf' 'clang')
optdepends=('osu: osu!stable library' 'osu-lazer-bin: osu!lazer library')
provides=('osu-radio')
conflicts=('osu-radio' 'osu-radio-bin')
options=('!lto' '!debug')
source=("osu-radio::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/osu-radio"
  printf '0.1.0alpha.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/osu-radio"
  export CARGO_HOME="$srcdir/cargo-home" RUSTUP_HOME="$srcdir/rustup-home"
  export CARGO_TARGET_DIR="$srcdir/target-production" DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export NUGET_PACKAGES="$srcdir/nuget-packages" NUGET_HTTP_CACHE_PATH="$srcdir/nuget-http-cache"
  export XDG_CACHE_HOME="$srcdir/cache" XDG_CONFIG_HOME="$srcdir/config"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1 QMAKE=/usr/bin/qmake6
  export RUSTFLAGS='-C link-arg=-fuse-ld=lld'
  export OSU_LAZER_REALM_PARSER_PATH=/usr/lib/osu-radio/osu-lazer-realm-parser
  unset RUSTUP_TOOLCHAIN CARGO_ENCODED_RUSTFLAGS
  rustup toolchain install --no-self-update
  local sdk
  sdk=$(dotnet --list-sdks | awk '/^10\./ { version=$1 } END { print version }')
  [[ -n $sdk ]] || { echo 'dotnet-sdk-10.0 is required' >&2; return 1; }
  printf '{"sdk":{"version":"%s","rollForward":"latestPatch"}}\n' "$sdk" > tools/osu-lazer-realm-parser/global.json
  (cd tools/osu-lazer-realm-parser && dotnet publish --configuration Release --runtime linux-x64 --self-contained false --output "$srcdir/helper-publish")
  cargo build --release --locked -p osu-radio-qt -p osu-radio-server
}

package() {
  cd "$srcdir/osu-radio"
  install -Dm755 "$srcdir/target-production/release/osu-radio-qt" "$pkgdir/usr/bin/osu-radio-qt"
  ln -s osu-radio-qt "$pkgdir/usr/bin/osu-radio"
  install -Dm755 "$srcdir/target-production/release/osu-radio-server" "$pkgdir/usr/bin/osu-radio-server"
  install -d "$pkgdir/usr/lib/osu-radio"
  cp -r "$srcdir/helper-publish/." "$pkgdir/usr/lib/osu-radio/"
  find "$pkgdir/usr/lib/osu-radio" -type f -exec chmod 644 {} +
  chmod 755 "$pkgdir/usr/lib/osu-radio/osu-lazer-realm-parser" "$pkgdir/usr/lib/osu-radio/librealm-wrappers.so"
  install -Dm644 packaging/arch/osu-radio.desktop "$pkgdir/usr/share/applications/osu-radio.desktop"
  install -d "$pkgdir/usr/share/icons"
  cp -r packaging/icons/hicolor "$pkgdir/usr/share/icons/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/osu-radio/LICENSE"
  install -m644 packaging/arch/licenses/* "$pkgdir/usr/share/licenses/osu-radio/"
}
