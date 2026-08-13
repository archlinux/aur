# Maintainer: Alfredo Montesinos <alfredo.montesinos@kubereva.com>

# A split package: one recipe, one AUR repository, two outputs. Users install
# `keeperfx-tux` and pacman pulls the data in as a dependency, so there is one
# name to remember and one command to run. Building both from a single pkgbase
# also makes a version mismatch between engine and data impossible rather than
# something CI has to police -- and a mismatch is exactly what once shipped a
# frozen config against a newer engine.
#
# _tag and pkgver are bumped by .github/workflows/publish-aur.yml when a release
# is published. pkgver is the tag without the leading "v" and the "-alpha" suffix.
_tag=v1.4.0.5425
# The launcher is a separate repository with no tags, so it is pinned by commit.
_launcher_commit=b27ddd5d267484351d6cd4d9ca45a9113f1d586c
pkgbase=keeperfx-tux
pkgname=('keeperfx-tux' 'keeperfx-tux-data' 'keeperfx-tux-launcher')
pkgver=1.4.0.5425
# rel 4: ship the pacman hook that reports a library break the soname
# dependencies below cannot catch, and pick up the launcher fix that stops a
# crash report carrying a log the failing run never wrote.
pkgrel=4
arch=('x86_64')
url="https://github.com/ForkedInTime/keeperfx-linux-alpha"
license=('GPL-2.0-or-later')
# In a split package, only makedepends (and any pkgbase-level depends) are
# installed to build with -- a depends= array inside package_*() is metadata for
# the built package and does nothing at build time. The engine's libraries are
# therefore listed here as well as on the output that runs against them; without
# that a clean chroot has no SDL3 headers and the engine will not compile.
# SDL3_net does not exist: networking is enet6, and the only SDLNet_ references
# left in the tree are comments.
makedepends=('git' 'python' 'curl' 'p7zip'
             # engine
             'sdl3' 'sdl3_mixer' 'sdl3_image'
             'ffmpeg' 'openal' 'luajit' 'libspng' 'minizip' 'zlib'
             'libepoxy' 'miniupnpc' 'libnatpmp' 'openssl' 'zstd'
             # Qt launcher
             'cmake' 'ninja' 'qt6-base' 'qt6-tools')
# !strip: this is an alpha -- usable backtraces in bug reports beat the saved MBs.
# !debug: without it, !strip leaves the debug sources in the main package.
# !lto:   linux.mk manages its own optimisation flags and LTO is unvalidated here;
#         letting makepkg inject it risks the kind of silent miscompile that
#         already forced a -march revert.
options=('!strip' '!debug' '!lto')
source=(
  "keeperfx-tux::git+https://github.com/ForkedInTime/keeperfx-linux-alpha.git#tag=${_tag}"
  "keeperfx-tux-${pkgver}-full.7z::${url}/releases/download/${_tag}/keeperfx-linux-alpha-x86_64-full.7z"
  "keeperfx-tux-launcher::git+https://github.com/ForkedInTime/keeperfx-launcher-qt-linux.git#commit=${_launcher_commit}"
  'keeperfx-tux.sh'
  'keeperfx-tux.desktop'
  'keeperfx-tux-launcher.sh'
  'keeperfx-tux.hook'
  'keeperfx-tux-libcheck.sh'
)
noextract=("keeperfx-tux-${pkgver}-full.7z")
sha256sums=(
  'SKIP'
  'a31e803e60bea582424b438bbaa1f05b360ea4ea0621c2545723a688103cdb2f'
  'SKIP'
  '8b897f0e147061f14fb0618a2737faefec037f338a1cac40d559b558ac1eef0c'
  '72d72a8e7c1221208eed0622a6e323399ba8cb139ab8840d620ef2697623a1b4'
  '1001a296fc71263c3a64d22f9bdfc398954119f80df89f49a4b42f2769e169a1'
  'ee2fc0f5b3d81dd55efe7d2aef6c4d67d18baff794114e3d6e334171842601eb'
  '37e0fcb5b46aa0b178380ea8f36aa62485b75b5425c1932c7ada7f4101efc870'
)

# Data trees taken from the release archive. It also contains the engine binary,
# the Qt launcher, a bundled 7z.so, keeperfx.cfg and version.txt: those are either
# the engine package's job or user state, so they are deliberately skipped.
_data_trees=(data sound ldata campgns levels lang fxdata creatrs mods music multiplayer)

prepare() {
  cd "${srcdir}/${pkgbase}"
  # These four deps are fetched by the makefile rather than vendored. Doing it in
  # prepare() keeps the network access out of build(), which is where makepkg
  # expects an already-populated source tree.
  make -f linux.mk \
    deps/centijson/include/json.h \
    deps/astronomy/include/astronomy.h \
    deps/enet6/include/enet6/enet.h \
    deps/libcurl/lib/libcurl.a

  cd "${srcdir}"
  7z x -y "keeperfx-tux-${pkgver}-full.7z" -o"extracted" > /dev/null
}

build() {
  cd "${srcdir}/${pkgbase}"

  # ver_defs.h is only regenerated when version.mk changes, so a stale build
  # number would otherwise be baked in -- and the launcher gates settings on it.
  rm -f src/ver_defs.h
  # The suffix follows the tag being packaged, exactly as the release workflows do.
  # Hardcoding "alpha" here stamped version.txt as an alpha even when building a
  # stable tag, and the launcher reads that file to decide which update channel an
  # install is on -- so every Arch user of a stable release would have been put on
  # the alpha channel and offered alpha updates.
  local _ver_suffix=
  case "${_tag}" in
    *-alpha)     _ver_suffix=alpha ;;
    *-prototype) _ver_suffix=Prototype ;;
  esac
  make -f linux.mk \
    BUILD_NUMBER="$(git rev-list --count HEAD)" \
    VER_SUFFIX="${_ver_suffix}" \
    -j"$(nproc)"

  # The UTF-8 fonts are required since upstream #4920 but linux.mk does not build
  # them; the project's CI generates them from tools/fxfontmaker.
  (
    cd tools/fxfontmaker
    local PY; PY=$(command -v python3 || command -v python)
    "$PY" rescale_unifont_hex.py unifont-17.0.04.hex unifont12.hex
    "$PY" bdf_to_hex.py wenquanyi_9pt.bdf wenquanyi.hex
    "$PY" merge_hex.py unifont12.hex wenquanyi.hex merged12.hex
    "$PY" unifont_hex_to_binary.py unifont-17.0.04.hex    font16.fxfont     16
    "$PY" unifont_hex_to_binary.py unifont_jp-17.0.04.hex font16_JPN.fxfont 16
    "$PY" unifont_hex_to_binary.py unifont_t-17.0.04.hex  font16_CHT.fxfont 16
    "$PY" unifont_hex_to_binary.py merged12.hex           font12.fxfont     12
    rm -f merged12.hex wenquanyi.hex unifont12.hex
  )

  # The Qt launcher. CMake pulls bit7z and LIEF from GitHub via CPM at configure
  # time and builds them in-tree. Neither can come from the system:
  # bit7z is packaged nowhere for Arch, and lief-bin ships only the shared
  # library while this build asks for COMPONENTS STATIC. CPM_USE_LOCAL_PACKAGES
  # was tried and is deliberately not used -- besides failing on LIEF, it picked
  # up an unpackaged bit7z from /usr/local on the build machine, which would have
  # produced a package that only builds where that stray copy exists.
  cd "${srcdir}/keeperfx-tux-launcher"
  # A stale CMakeCache.txt survives makepkg -f, and it remembers the flags of the
  # previous configure, so start clean. CPM_DOWNLOAD_ALL then stops CPM probing the
  # system at all: it must fetch and build both dependencies in-tree, which is what
  # keeps the result independent of whatever happens to be on the build machine.
  # CMAKE_SKIP_RPATH stops the build tree's own paths being written into the
  # binary: CPM builds zlib in-tree, and its build directory otherwise ends up as
  # a RUNPATH that namcap rejects and that would not exist on a user's machine.
  # Nothing is lost -- zlib, Qt and OpenSSL all resolve from the system.
  rm -rf build
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPM_USE_LOCAL_PACKAGES=OFF \
    -DCPM_DOWNLOAD_ALL=ON \
    -DCMAKE_SKIP_RPATH=ON
  cmake --build build
}

package_keeperfx-tux() {
  pkgdesc="KeeperFX Tux Edition — native Linux build of the Dungeon Keeper engine remake"
  depends=(
    # Sonames, not package names. On a rolling distribution the package name is
    # the wrong unit: an unversioned 'ffmpeg' let pacman move 8.1.2 -> 9.0 under
    # an already-built package, every libav* soname the engine linked shifted at
    # once, and the binary stopped loading -- with nothing said at upgrade time
    # and the failure surfacing only as a "crash" when the user pressed Play.
    # makepkg rewrites each of these from the built ELF into a versioned
    # dependency ('libavformat.so=63-64'), so the next bump is refused by pacman
    # before it happens: an explicit rebuild prompt instead of a broken install.
    'libavformat.so' 'libavcodec.so' 'libswresample.so' 'libswscale.so'
    'libavutil.so' 'libopenal.so' 'libspng.so' 'libz.so' 'libepoxy.so'
    'libminiupnpc.so' 'libssl.so' 'libcrypto.so' 'libzstd.so'
    # These four ship no soname in provides= at all, so they can only be named
    # directly and stay exposed to the same failure. SDL3 holds its ABI at
    # .so.0 by project policy and the other three are low-churn, which is why
    # ffmpeg is the one that actually bit.
    'sdl3' 'sdl3_mixer' 'sdl3_image' 'luajit' 'minizip' 'libnatpmp'
    # Implicit but real: the engine links these, the wrapper is a bash script,
    # and the icons need the hicolor theme hierarchy to exist.
    'glibc' 'gcc-libs' 'bash' 'hicolor-icon-theme'
    # Pulled in automatically, so installing this one name gives a complete,
    # playable install rather than an engine with nothing to run.
    "keeperfx-tux-data=${pkgver}-${pkgrel}"
    # The launcher is the front door: it finds your Dungeon Keeper installation,
    # copies the files it needs, and configures the game. Installing the engine
    # without it would lose the only route a new player has to a playable install.
    "keeperfx-tux-launcher=${pkgver}-${pkgrel}"
  )
  conflicts=('keeperfx-linux-alpha' 'keeperfx-linux-alpha-git')
  provides=("keeperfx-tux=${pkgver}")

  cd "${srcdir}/${pkgbase}"
  local _share="${pkgdir}/usr/share/${pkgbase}"

  # /usr/share is for architecture-independent files, so the ELF lives in
  # /usr/lib. Its location is free: the wrapper links it into the game directory
  # and the engine roots itself at argv[0], not at the binary's real path.
  install -Dm755 bin/keeperfx "${pkgdir}/usr/lib/${pkgbase}/keeperfx"
  install -dm755 "${_share}"

  # The launcher reads the engine version from version.txt: a native ELF carries
  # no Windows PE ProductVersion resource for it to inspect.
  sed -n 's/.*VER_STRING  "\(.*\)".*/\1/p' src/ver_defs.h > "${_share}/version.txt"

  # Text/config data that tracks the engine version.
  local _d
  for _d in fxdata creatrs mods; do
    install -dm755 "${_share}/${_d}"
    cp -r "config/${_d}/." "${_share}/${_d}/"
  done
  for _d in campgns levels lang multiplayer; do
    [ -d "${_d}" ] || continue
    install -dm755 "${_share}/${_d}"
    cp -r "${_d}/." "${_share}/${_d}/"
  done

  # Generated fonts live alongside the text config, as the engine expects.
  install -m644 tools/fxfontmaker/*.fxfont "${_share}/fxdata/"

  # The engine refuses to start without keeperfx.cfg ("Configuration load error").
  # Shipped as a template the wrapper copies into the game directory, because the
  # user edits it and it must not be overwritten by an upgrade.
  install -m644 config/keeperfx.cfg "${_share}/keeperfx.cfg"

  # The soname dependencies above cover every library that publishes one, but
  # six of the engine's do not and neither do the launcher's Qt and OpenSSL --
  # for those pacman has nothing to compare and cannot refuse the upgrade. This
  # hook cannot prevent that either; it reports it at the moment it happens,
  # instead of leaving a broken install to be found the next time someone plays.
  install -Dm755 "${srcdir}/keeperfx-tux-libcheck.sh" \
    "${pkgdir}/usr/share/libalpm/scripts/keeperfx-tux-libcheck"
  install -Dm644 "${srcdir}/keeperfx-tux.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/keeperfx-tux-libcheck.hook"

  install -Dm755 "${srcdir}/keeperfx-tux.sh" "${pkgdir}/usr/bin/keeperfx-tux"
  install -Dm644 "${srcdir}/keeperfx-tux.desktop" \
    "${pkgdir}/usr/share/applications/keeperfx-tux.desktop"

  local _px
  for _px in 016 032 048 064 128; do
    [ -f "res/keeperfx_icon${_px}-08bpp.png" ] || continue
    install -Dm644 "res/keeperfx_icon${_px}-08bpp.png" \
      "${pkgdir}/usr/share/icons/hicolor/$((10#${_px}))x$((10#${_px}))/apps/keeperfx-tux.png"
  done
  for _px in 256 512; do
    [ -f "res/keeperfx_icon${_px}-24bpp.png" ] || continue
    install -Dm644 "res/keeperfx_icon${_px}-24bpp.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_px}x${_px}/apps/keeperfx-tux.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
}

package_keeperfx-tux-data() {
  pkgdesc="Game data for KeeperFX Tux Edition (campaigns, graphics, sounds) — you still supply your own Dungeon Keeper files"
  arch=('any')
  # Nothing here is executable: nothing to strip, no debug info to split out.
  options=('!strip' '!debug')

  local _share="${pkgdir}/usr/share/${pkgbase}-data"
  install -dm755 "${_share}"

  local _d
  for _d in "${_data_trees[@]}"; do
    if [ ! -d "${srcdir}/extracted/${_d}" ]; then
      # music/ is legitimately empty in some releases; anything else missing means
      # the archive layout changed and this PKGBUILD needs revisiting.
      if [ "${_d}" = music ]; then continue; fi
      echo "error: expected directory '${_d}' is missing from the release archive" >&2
      return 1
    fi
    cp -r "${srcdir}/extracted/${_d}" "${_share}/"
  done

  find "${_share}" -type d -exec chmod 755 {} +
  find "${_share}" -type f -exec chmod 644 {} +

  install -Dm644 "${srcdir}/extracted/README.txt" \
    "${pkgdir}/usr/share/doc/${pkgbase}-data/README.txt" 2>/dev/null || true
}

package_keeperfx-tux-launcher() {
  pkgdesc="Qt launcher for KeeperFX Tux Edition — finds your Dungeon Keeper install, copies the files in, configures and plays"
  depends=('qt6-base' 'zlib' 'openssl' 'glibc' 'gcc-libs' 'bash' 'hicolor-icon-theme')
  optdepends=('keeperfx-tux: the game it launches')

  cd "${srcdir}/keeperfx-tux-launcher"

  # The launcher resolves its config and the game binary against
  # QCoreApplication::applicationDirPath(), and Qt reads /proc/self/exe, so a
  # symlink reports the target's directory rather than the game directory. It
  # therefore cannot live in /usr/bin and be linked in; the wrapper copies it.
  install -Dm755 build/keeperfx-launcher-qt "${pkgdir}/usr/lib/${pkgbase}/keeperfx-launcher-qt"
  install -Dm755 "${srcdir}/keeperfx-tux-launcher.sh" "${pkgdir}/usr/bin/keeperfx-tux-launcher"

  install -Dm644 packaging/keeperfx-launcher-qt.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/keeperfx-tux-launcher.png"

  # This is the front door, so it takes the plain name; the engine's own entry is
  # the "play directly" shortcut for once the game is set up.
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/keeperfx-tux-launcher.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=KeeperFX
GenericName=Dungeon Keeper
Comment=Install, configure and play KeeperFX (Dungeon Keeper) on Linux
Exec=keeperfx-tux-launcher
Icon=keeperfx-tux-launcher
Terminal=false
Categories=Game;StrategyGame;
Keywords=dungeon;keeper;keeperfx;
StartupWMClass=keeperfx-launcher-qt
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
