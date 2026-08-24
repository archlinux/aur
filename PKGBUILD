# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=g0v0-git
pkgver=2026.816.0.r38.gef035c9
pkgrel=1
pkgdesc="g0v0! -- free and open rhythm experience! (a community project based on osu!lazer codebase)"
arch=(x86_64 aarch64)
url="https://github.com/GooGuTeam/g0v0"
license=("MIT" "custom:CC-BY-NC 4.0")
makedepends=(git dotnet-sdk-8.0)
depends=(
  zlib
  libgl
  dotnet-runtime-8.0
  osu-mime
)
provides=(g0v0)
conflicts=(g0v0 g0v0-bin)
options=(!strip !debug)
source=(
  "g0v0-src::git+https://github.com/GooGuTeam/g0v0.git#branch=v2"
  "icon.png"
  "https://raw.githubusercontent.com/GooGuTeam/g0v0-resources/master/LICENCE.md"
  "g0v0.desktop"
  "g0v0-uri-handler.desktop"
  "g0v0"
)
sha256sums=('SKIP'
            'c93f6981c6c528e717d5215eeed775cf4926fe61476d95163b3ecd5770f40dda'
            '96276add86bd921e64255ce7e5487599dbe13e6e48e96a6af1a58cc99c187648'
            'b1d3d8ad2b05ff2f461d15ff8fd73ce6ffbb75568dae2bd123b0599292259c53'
            'dfbe774cb090a23f4000859dd9bb6c79717e20d091737893b915a55db5b4965a'
            'a6f11de4394f5d3f1f1426765f67233f5ca8dcacfc113094538e2fed6fb7535d')

prepare() {
  cd "$srcdir/g0v0-src"
  git submodule update --init --recursive --depth 1
}

pkgver() {
  cd "$srcdir/g0v0-src"
  git describe --tags --long --abbrev=7 | sed "s/^v//; s/-g0v0-/.r/; s/-g/.g/"
}

build() {
  cd "$srcdir/g0v0-src"
  local release_version="${pkgver%%.r*}"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$release_version"
}

package() {
  cd "$srcdir/g0v0-src"
  install -d "$pkgdir/opt/g0v0"
  cp -r output/* "$pkgdir/opt/g0v0"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/g0v0"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0.desktop"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0-uri-handler.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/g0v0.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENCE.md"

  # Fix Vulkan renderer. See: https://github.com/ppy/osu/discussions/27659#discussioncomment-9101487
  ln -sf /usr/lib/libdl.so.2 "$pkgdir/opt/g0v0/libdl.so"
}
