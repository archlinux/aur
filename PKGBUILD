# Maintainer: PASRC <pasrc at proton dot me>

pkgname=chimera-tas
_tag=nightly-2026-11-23
pkgver=20261123
pkgrel=1
pkgdesc="Modular frontend for creating tool-assisted speedruns (TAS)"
arch=('x86_64' 'aarch64')
url="https://github.com/ToolAssisted-run/chimera"
# Chimera, miniBox, Lua, cJSON, miniz and glad are MIT; the bundled SDL3,
# OpenAL Soft, zstd and SQLite keep their own terms
license=('MIT' 'Zlib' 'LGPL-2.0-or-later' 'BSD-3-Clause OR GPL-2.0-only' 'blessing')
depends=(
  'bash'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'alsa-lib'
  'cmake'
  'git'
  'jack'
  'libpulse'
  'libusb'
  'meson'
  'nasm'
  'ninja'
  'patchelf'
  'pipewire'
  'python'
)
optdepends=(
  'ffmpeg: Encode Video (File > Encode Video)'
  'pipewire: audio output through PipeWire'
  'libpulse: audio output through PulseAudio'
  'libusb: more gamepads, such as the GameCube adapter'
)
# Chimera keeps its settings, cores and firmware beside the program, so
# /opt/chimera-tas is left writable by everyone (see package()).
install=chimera-tas.install
source=(
  "chimera::git+https://github.com/ToolAssisted-run/chimera.git#tag=${_tag}"
  "chimera-minibox::git+https://github.com/ToolAssisted-run/chimera-common-minibox.git"
  "SDL::git+https://github.com/libsdl-org/SDL.git"
  "libusb::git+https://github.com/libusb/libusb.git"
  "lua::git+https://github.com/lua/lua.git"
  "zstd::git+https://github.com/facebook/zstd.git"
  "openal-soft::git+https://github.com/kcat/openal-soft.git"
  "sqlite3-cb::git+https://github.com/ericsink/cb.git"
  "chimera-tas.sh"
  "chimera-tas.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '069fa8ced2e67c0caac67555a781c1b446d06ee3539c41839dd2e510a44f0e17'
            '1579d9576dac149f459b4b8174393a4a60171150f1ce6ddacfd5aa977382e40b')

_opt=/opt/chimera-tas

prepare() {
  cd chimera
  git submodule init
  git config submodule.extern/chimera-common-minibox.url "$srcdir/chimera-minibox"
  git config submodule.extern/SDL3/SDL.url "$srcdir/SDL"
  git config submodule.extern/SDL3/libusb.url "$srcdir/libusb"
  git config submodule.extern/lua.url "$srcdir/lua"
  git config submodule.extern/zstd.url "$srcdir/zstd"
  git config submodule.extern/openal-soft.url "$srcdir/openal-soft"
  git config submodule.extern/sqlite3.url "$srcdir/sqlite3-cb"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd chimera
  arch-meson build \
    --prefix "$srcdir/stage" \
    --libdir dll \
    --buildtype release \
    -Dqt_ui=enabled \
    -Db_lto=false
  meson compile -C build
  meson install -C build --no-rebuild
}

package() {
  cd chimera
  local dll="$srcdir/stage/dll"
  local dest="$pkgdir$_opt"

  # The layout of upstream's Linux bundle (tools/stage-qt-linux.py), minus the
  # Qt it bundles: the system's Qt is used instead.
  install -dm755 "$dest"/{lib,bin}
  install -m755 "$dll/chimera" "$dest/chimera"
  install -m755 "$dll/chimera-run" "$dll/chimera-mcp" "$dest/bin/"
  local f
  for f in "$dll"/*.so*; do
    install -m755 "$f" "$dest/lib/"
  done
  cp -r --no-preserve=ownership "$dll/languages" "$dest/lib/languages"

  # each program finds Chimera's libraries in lib/
  patchelf --set-rpath '$ORIGIN/lib' "$dest/chimera"
  patchelf --set-rpath '$ORIGIN/../lib' "$dest"/bin/chimera-run "$dest"/bin/chimera-mcp
  for f in "$dest"/lib/*.so*; do
    patchelf --set-rpath '$ORIGIN' "$f"
  done

  # Encode Video looks for bin/ffmpeg beside the program
  ln -s /usr/bin/ffmpeg "$dest/bin/ffmpeg"

  install -dm755 "$dest/themes"
  install -m644 themes/*.chimeraTheme.json "$dest/themes/"
  install -dm755 "$dest/cores"
  install -m644 tools/cores-README.txt "$dest/cores/README.txt"

  # writable by users: settings, cores, firmware and Config > Paths folders
  # live here
  chmod 777 "$dest" "$dest/cores"

  install -Dm755 "$srcdir/chimera-tas.sh" "$pkgdir/usr/bin/chimera-tas"
  install -Dm644 "$srcdir/chimera-tas.desktop" "$pkgdir/usr/share/applications/chimera-tas.desktop"
  install -Dm644 docs/Chimera.icon/Assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/chimera-tas.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"

  # the bundled libraries' own licences
  local lic="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 extern/chimera-common-minibox/LICENSE "$lic/minibox-LICENSE"
  install -Dm644 extern/SDL3/SDL/LICENSE.txt "$lic/SDL3-LICENSE"
  install -Dm644 extern/openal-soft/COPYING "$lic/openal-soft-COPYING"
  install -Dm644 extern/zstd/LICENSE "$lic/zstd-LICENSE"
  install -Dm644 extern/zstd/COPYING "$lic/zstd-COPYING"
  install -Dm644 extern/cjson/LICENSE "$lic/cjson-LICENSE"
  install -Dm644 extern/miniz/LICENSE "$lic/miniz-LICENSE"
  install -Dm644 extern/glad/LICENSE "$lic/glad-LICENSE"
  # Lua's notice is at the end of lua.h
  sed -n '/^\* Copyright (C) 1994/,/^\*\*\*\*/p' extern/lua/lua.h > "$lic/lua-LICENSE"
}
