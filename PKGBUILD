# Maintainer: MapleProjects <maple@localhost>
# Fork of nightcap (CoderDayton), which is a fork of mocktail (komaruworld).
# Mapleblox policy: every core, direct Vulkan, host-detected backend.

pkgname=mapleblox-git
pkgver=0.5.2.r290.g0000000
pkgrel=1
pkgdesc='Roblox runtime for Linux, tuned for maximum performance (Mapleblox fork)'
arch=('x86_64')
url='https://github.com/MapleProjects/Mapleblox'
license=('Apache-2.0')
depends=(
  'capstone'
  'curl'
  'ffmpeg'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libelf'
  'libglvnd'
  'libplacebo'
  'libpng'
  'libsecret'
  'libsoup3'
  'libutf8proc'
  'libyaml'
  'minizip'
  'openssl'
  'sdl3>=3.4'
  'sdl3_ttf'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'zlib'
)
makedepends=(
  'cmake>=3.20'
  'cargo'
  'git'
  'lld'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'vulkan-headers'
)
optdepends=('gamemode: Feral GameMode integration')
provides=('mocktail' 'nightcap' 'mapleblox')
conflicts=('mocktail' 'nightcap' 'nightcap-git' 'nightcap-bin' 'mapleblox')
options=('!debug')
source=(
  'mapleblox::git+https://github.com/MapleProjects/Mapleblox.git#branch=main'
)
sha256sums=('SKIP')

pkgver() {
  cd mapleblox

  local version
  version="$(git describe --tags --abbrev=0 --match='v[0-9]*' 2>/dev/null)"
  version="${version#v}"
  printf '%s.r%s.g%s' \
    "${version:-0.0.0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mapleblox

  sed -i \
    's|add_subdirectory(third_party/Vulkan-Headers EXCLUDE_FROM_ALL)|find_package(VulkanHeaders CONFIG REQUIRED)|' \
    CMakeLists.txt
}

build() {
  cmake -S mapleblox -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DMOCKTAIL_DEFAULT_COMPATIBILITY_MANIFEST=/usr/share/mocktail/metadata/roblox_compatibility.json \
    -DMOCKTAIL_DEFAULT_SIGNING_TRUST_MANIFEST=/usr/share/mocktail/metadata/roblox_signing_certificates.json \
    -DMOCKTAIL_DEFAULT_DOWNLOAD_SOURCES_MANIFEST=/usr/share/mocktail/metadata/roblox_download_sources.json \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 mapleblox/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Drop the upstream branding so the system only shows the fork.
  rm -f "${pkgdir}/usr/share/applications/io.github.CoderDayton.nightcap.desktop"
  rm -f "${pkgdir}/usr/share/metainfo/io.github.CoderDayton.nightcap.metainfo.xml"
  rm -f "${pkgdir}"/usr/share/icons/hicolor/*/apps/io.github.CoderDayton.nightcap.png
  rm -f "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.CoderDayton.nightcap.svg"

  # Mapleblox entry: same binary, own name and icon, so the launcher shows the
  # fork instead of the upstream project.
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/mapleblox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Mapleblox
GenericName=Roblox Player
Comment=Roblox on Linux with maximum performance
Exec=env SDL_VIDEODRIVER=wayland,x11 mocktail %u
Icon=mapleblox
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/roblox;x-scheme-handler/roblox-player;
StartupWMClass=io.github.MapleProjects.mapleblox
EOF

  install -Dm644 mapleblox/packaging/mapleblox.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mapleblox.svg"
}