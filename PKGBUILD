# Maintainer: Troy C. <troxor at users.noreply.github.com>
# Contributor: linrs <LinRs at users.noreply.github.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Rene Schoebel <schoebel.r at gmail dot com>
# Contributor: ZekeSulastin <zekesulastin@gmail.com>
# Contributor: Mr_Robotic_Evil <mr.robotic.evil@googlemail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

# This PKGBUILD only generates the engine binary.
# The retail Freespace 2 data is required to play the
# original game and most mods.  You can use a non-AUR/pacman'd
# copy, but you'll be on your own as far as running the game
# and mods are concerned.
# Check the AUR package 'fs2_open-data' for details.

pkgname=fs2_open
pkgver=26.0.0
pkgrel=2
pkgdesc="An enhancement of the FreeSpace 2 engine, need game data"
url="https://scp.indiegames.us/"
arch=(i686 x86_64)
license=('LicenseRef-fs2_open')
depends=(glibc libgcc libx11 libstdc++ libjpeg-turbo libpng freetype2 ffmpeg sdl2 lua51 openal jansson bash hicolor-icon-theme)
makedepends=(cmake)
optdepends=('fs2_open-mediavps: extensive audiovisual enhancements'
            'fs2_open-data: extensive retail data'
            'wxlauncher: cross-platform fs2 launcher'
            'doxygen: generate engine API docs when building from source')

_upstream_tag=release_26_0_0
_extracted="fs2open.github.com-${_upstream_tag}"

# Submodule commits from: git submodule status (at $_upstream_tag)
_submod_rpavlik=7cef9577d6fc35057ea57f46b4986a8a28aeff50
_submod_librocket=b0c18e17d257a46db8395485895185915f483ede

source=("fs2open-${pkgver}.tar.gz::https://github.com/scp-fs2open/fs2open.github.com/archive/refs/tags/${_upstream_tag}.tar.gz"
        "cmake-modules-${_submod_rpavlik}.tar.gz::https://github.com/rpavlik/cmake-modules/archive/${_submod_rpavlik}.tar.gz"
        "libRocket-${_submod_librocket}.tar.gz::https://github.com/scp-fs2open/libRocket/archive/${_submod_librocket}.tar.gz"
        'fs2_open.desktop')
sha256sums=('f21f62f88474bf89525bca39a9d28539a8b234dec3f7566dc290387ac9d845ae'
            '7b6912da01a56eeca58c13f8bbb07b6120af8f04722316747dc8132a8ec65aca'
            '444266ebd5fc1f48e565b91abdaa2bee87a621f792450c4339a5cc7be6f946ab'
            '5e5205173637029217c77cd426582d3df55d9c6671b271379d023664484a6153')

prepare() {
  cd "${_extracted}"
  rm -rf cmake/external/rpavlik-cmake-modules lib/libRocket
  mv "$srcdir/cmake-modules-${_submod_rpavlik}" cmake/external/rpavlik-cmake-modules
  mv "$srcdir/libRocket-${_submod_librocket}" lib/libRocket
  # Upstream uses fs2_open_${version}_${arch}_${SIMD}; force a fixed name for packaging.
  sed -i 's/OUTPUT_NAME "fs2_open_${FSO_BINARY_SUFFIX}"/OUTPUT_NAME "fs2_open"/' freespace2/CMakeLists.txt
}

build() {
  # Strip $srcdir from debug paths (namcap) and improve reproducibility.
  local _map="-ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_map}"
  CXXFLAGS+=" ${_map}"

  cmake -B build -S "${_extracted}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DFSO_BUILD_WITH_VULKAN=OFF \
    -DFSO_BUILD_WITH_OPENXR=OFF

  cmake --build build
}

package() {
  install -Dm755 build/bin/fs2_open "$pkgdir/usr/lib/$pkgname/fs2_open"
  install -d "$pkgdir/opt/$pkgname"
  ln -sf "/usr/lib/$pkgname/fs2_open" "$pkgdir/opt/$pkgname/fs2_open"

  # Engine resolves game data relative to PWD; keep /opt/fs2_open as cwd for CLI users.
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/fs2_open" << 'EOF'
#!/bin/sh
cd /opt/fs2_open || exit 1
exec ./fs2_open "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/fs2_open"

  install -Dm644 "${_extracted}/Copying.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${_extracted}/freespace2/resources/app_icon.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/fs2_open.png"
  install -Dm644 fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
}
