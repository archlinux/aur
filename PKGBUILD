# Maintainer: Winicius Cota <winicius.cota@gmail.com>
pkgname=bsg-diaspora-sa-vr
pkgver=1.0
pkgrel=1
_engine=e7e0727768bc98d47091ef2d0153dc3a57bed9b6
pkgdesc="Battlestar Galactica: Diaspora on a modern FreeSpace Open engine with VR (OpenXR/Vulkan), 14 extra missions, HD textures"
arch=('x86_64')
url="https://github.com/winiciuscota/diaspora-vr-port"
license=('CCPL' 'custom:fs2_open')
depends=('sdl2' 'openal' 'ffmpeg' 'libpng' 'jansson' 'freetype2' 'lz4' 'vulkan-icd-loader' 'shaderc' 'curl' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'ninja' 'python' 'glslang' 'vulkan-headers' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor'
             'libxi' 'wayland' 'mesa' 'speech-dispatcher')
optdepends=('wivrn-server: stream VR to a Quest headset'
            'monado: OpenXR runtime for PC VR headsets'
            'steam: SteamVR OpenXR runtime')
_rel="https://github.com/winiciuscota/diaspora-vr-port/releases/download/v$pkgver"
source=("fs2open::git+https://github.com/winiciuscota/fs2open-diaspora-vr.git#commit=$_engine"
        "$_rel/diaspora-vr-mod-$pkgver.tar.gz"
        "$_rel/diaspora-vr-hd-textures-2x.zip"
        "$_rel/diaspora-vr-hd-cockpits-4x.zip"
        "$_rel/diaspora-vr-voices.zip"
        'http://diaspora.fs2downloads.com/Diaspora_R1_Linux.tar.lzma'
        'http://diaspora.fs2downloads.com/Diaspora_R1_Patch_1.1.tar.lzma'
        'http://diaspora.fs2downloads.com/Diaspora_R1_Patch_1.1.1.tar.lzma'
        'bsg-diaspora-sa-vr'
        'bsg-diaspora-sa-vr.desktop'
        'bsg-diaspora-sa-vr-vr.desktop')
sha256sums=('SKIP' 'd3d75cfe3a709075e351bb1e25eb1e04f80fe60e271d3c1565ab147d599a443a' 'c527c6b77046e663292e7ca2a008c8582bba5bb1279e5a65f8d493948fdce88c' 'd2f627c64efc64e8c12707812c8899fcaa21175d709c72ef30af46fb4f3f5105' '35d4690fba66019a2a8ccf0d0ff5cc35516f1837e66cc736e5c312e05341ea98' '598910f2382ab2c8b10aa02cc6fb00c55ed4cd5a1a64d580deb1a0d4e521cf17' '759491c5614a4b814ff9199aaa59bd43d034c0ddf25070e94b2019571e127ba4' '1569d6990b110cbee240b76727b1a015188cd34c53ecdfea7e84d9de151ce7b4' 'e90dedf4f22c9df4de4f506ee9f550a1d7ed19074e2c1cda3833dffe1ff417a6' '2c62c57e43cb72431453ea59627885f600e502833db345d36226d00704ffe0a9' 'e66c78af5ef95960fd8454efbb08837859f65652b86484cf3a9924d69689be07')
# ~5 GiB of game data: compressing it again takes long and saves little
PKGEXT='.pkg.tar'

prepare() {
  cd fs2open
  git submodule update --init --recursive --depth 1

  # Diaspora R1 + the 1.1 and 1.1.1 patches
  local game="$srcdir/Diaspora_R1_Linux/Diaspora"
  tar -xf "$srcdir/Patch_Files.1.1.tar" -C "$game"
  tar -xf "$srcdir/Patch_Files.1.1.1.tar" -C "$game"
}

build() {
  cmake -S fs2open -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/$pkgname/engine \
    -DFSO_BUILD_TESTS=OFF -DFSO_BUILD_FRED2=OFF -DFSO_BUILD_QTFRED=OFF -DFSO_BUILD_INCLUDE_TOOLS=OFF \
    -DFSO_RELEASE_LOGGING=ON -DFSO_BUILD_WITH_OPENXR=ON -DFSO_BUILD_WITH_VULKAN=ON -DFSO_BUILD_WITH_DISCORD=OFF \
    -Wno-dev
  # each compiler job needs ~1.5 GiB: limit the parallel jobs by RAM so smaller machines don't run out of memory
  local mem_gb jobs
  mem_gb=$(awk '/MemTotal/ {print int($2 / 1048576)}' /proc/meminfo)
  jobs=$(( mem_gb * 2 / 3 )); [ "$jobs" -lt 1 ] && jobs=1; [ "$jobs" -gt "$(nproc)" ] && jobs=$(nproc)
  cmake --build build -j "$jobs"
}

package() {
  local root="$pkgdir/opt/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  local bin; bin=$(find "$root/engine" -maxdepth 2 -type f -name 'fs2_open_*' | head -1)
  [ -n "$bin" ] || { echo "no fs2_open binary installed"; return 1; }
  mv "$bin" "$root/engine/fs2_open"

  # game data (Diaspora R1 + patches), then the mod with the extra missions, HD textures and voices
  local game="$srcdir/Diaspora_R1_Linux/Diaspora"
  install -d "$root/game"
  cp -a "$game"/*.vp "$root/game/"
  [ -d "$game/data" ] && cp -a "$game/data" "$root/game/"
  # the mod tarball and the texture / voice zips all unpack into $srcdir/diaspora_fixes
  cp -a "$srcdir/diaspora_fixes" "$root/game/"
  rm -f "$root/game/diaspora_fixes/icon-256.png"
  # Diaspora's old command line file lists flags the modern engine no longer knows; the launcher passes what is needed
  rm -f "$root/game/data/cmdline_fso.cfg"
  find "$root/game" -type d -exec chmod 755 {} + ; find "$root/game" -type f -exec chmod 644 {} +

  install -Dm755 "$srcdir/bsg-diaspora-sa-vr" "$pkgdir/usr/bin/bsg-diaspora-sa-vr"
  install -Dm644 "$srcdir/bsg-diaspora-sa-vr.desktop" "$pkgdir/usr/share/applications/bsg-diaspora-sa-vr.desktop"
  install -Dm644 "$srcdir/bsg-diaspora-sa-vr-vr.desktop" "$pkgdir/usr/share/applications/bsg-diaspora-sa-vr-vr.desktop"
  install -Dm644 "$srcdir/diaspora_fixes/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/bsg-diaspora-sa-vr.png"
  install -Dm644 fs2open/Copying.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
