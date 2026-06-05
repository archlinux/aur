# Maintainer: Amog-us <ask at amogussugomus at proton dot me>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=rats-search-git
_pkgname=rats-search
pkgver=2.0.28.r1.gc354324
pkgrel=1
pkgdesc="High-performance BitTorrent P2P search engine with integrated torrent client"
arch=('x86_64')
url="https://github.com/librats/rats-search"
license=('MIT')

depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'qt6-base>=6.9'
  'qt6-websockets>=6.9'
)

makedepends=(
  'cmake>=3.16'
  'git'
  'ninja'
  'qt6-tools>=6.9'
)

provides=('rats-search')
conflicts=('rats-search')

source=(
  "${pkgname}::git+${url}.git"
  "manticore-binary::git+https://github.com/DEgITx/manticore-binary.git"
  "librats::git+https://github.com/librats/librats.git"
)

b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "2.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule.imports.url "${srcdir}/manticore-binary"
  git config submodule.src/librats.url "${srcdir}/librats"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cmake \
    -S "${srcdir}/${pkgname}" \
    -B "${srcdir}/build" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRATS_SEARCH_BUILD_TESTS=OFF \
    -DRATS_SEARCH_USE_SYSTEM_LIBRATS=OFF \
    -DRATS_ENABLE_ASAN=OFF \
    -DRATS_ENABLE_TSAN=OFF

  cmake --build "${srcdir}/build"
}

package() {
  cd "${srcdir}/${pkgname}"

  # Put the real executable into a private libdir so the bundled imports/
  # layout stays discoverable by the app.
  install -Dm755 "${srcdir}/build/bin/RatsSearch" \
    "${pkgdir}/usr/lib/rats-search/RatsSearch"

  # Bundled Manticore searchd from upstream submodule.
  # The app searches imports/linux/x64/searchd relative to its executable.
  if [[ -d "imports/linux/x64" ]]; then
    install -dm755 "${pkgdir}/usr/lib/rats-search/imports/linux/x64"
    cp -a "imports/linux/x64/." \
      "${pkgdir}/usr/lib/rats-search/imports/linux/x64/"

    if [[ -f "${pkgdir}/usr/lib/rats-search/imports/linux/x64/searchd" ]]; then
      chmod 755 "${pkgdir}/usr/lib/rats-search/imports/linux/x64/searchd"
    fi
  fi

  # CLI wrapper.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/rats-search" <<'EOF'
#!/bin/sh
exec /usr/lib/rats-search/RatsSearch "$@"
EOF

  # Desktop entry.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rats-search.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Rats Search
Comment=BitTorrent P2P search engine with integrated torrent client
Exec=rats-search
Icon=rats-search
Terminal=false
Categories=Network;FileTransfer;P2P;Qt;
Keywords=Torrent;BitTorrent;Search;P2P;
StartupNotify=true
EOF

  # Icon.
  install -Dm644 "resources/icons/512x512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rats-search.png"

  # License.
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
