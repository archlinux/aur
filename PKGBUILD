# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r77575.a6499b621e6
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
conflicts=(ladybird)
provides=(ladybird)
depends=(
  curl
  fast_float
  ffmpeg
  fmt
  harfbuzz
  icu
  libavif
  libgl
  libjpeg-turbo
  libjxl
  libtiff
  libtommath
  libwebp
  qt6-base
  qt6-multimedia
  qt6-tools
  qt6-wayland
  sdl3
  simdjson
  sqlite
  ttf-liberation
  woff2
  mimalloc
  
  angle # AUR
  simdutf-git # 'simdutf' is v6, we need v7.
  cpptrace # AUR
  libpng-apng # AUR, extra/libpng doesn't provide APNG.
)
makedepends=(autoconf-archive automake cargo cmake git nasm ninja patchelf skia-static tar unzip zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd ladybird
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e '/march=/d' -i ladybird/Meta/CMake/compile_options.cmake
  sed -e 's/78\.2 EXACT/78.2/' -i ladybird/Meta/CMake/check_for_dependencies.cmake
}

build() {
  cd "${srcdir}"

  export PKG_CONFIG_PATH="$(realpath .)"
  unset CARGO_TARGET_DIR
  export RUSTUP_TOOLCHAIN=stable

  cmake \
    -B build \
    -S ladybird \
    -DENABLE_RUST=YES \
    -DBUILD_SHARED_LIBS=OFF \
    -DLADYBIRD_CACHE_DIR=Build/caches \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_LTO_FOR_RELEASE=OFF \
    -DCMAKE_INSTALL_PREFIX='/opt/ladybird/usr' \
    -DENABLE_INSTALL_HEADERS=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}" \
    -GNinja \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  find "$pkgdir" -name '*.a' -delete
  find "$pkgdir" -name '*.cmake' -delete

  find "$pkgdir" -type f -executable -exec sh -c '
    for exe; do
      r=$(patchelf --print-rpath "$exe" 2>/dev/null)
      [ "${r%%/opt/angle/lib*}" = "$r" ] && patchelf --set-rpath "/opt/angle/lib${r:+:$r}" "$exe"
    done
  ' sh {} +

  # Make the desktop file point to the file in /opt
  RELATIVE_DESKTOP_FILE_PATH='usr/share/applications/org.ladybird.Ladybird.desktop'
  sed -i -e 's#Exec=Ladybird #Exec=/opt/ladybird/usr/bin/Ladybird #' "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}"


  install -Dm644 ladybird/LICENSE -t "${pkgdir}/opt/ladybird/usr/share/licenses/${pkgname}/"
  install -Dm644 "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}" "${pkgdir}/${RELATIVE_DESKTOP_FILE_PATH}"

  # Links
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/metainfo" "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  ln -s /opt/ladybird/usr/bin/Ladybird "${pkgdir}/usr/bin/Ladybird"
  ln -s /opt/ladybird/usr/share/licenses/ladybird-git "${pkgdir}/usr/share/licenses/ladybird-git"
  ln -s /opt/ladybird/usr/share/metainfo/org.ladybird.Ladybird.metainfo.xml "${pkgdir}/usr/share/metainfo/org.ladybird.Ladybird.metainfo.xml"
  ln -s /opt/ladybird/usr/share/icons/hicolor/scalable/apps/org.ladybird.Ladybird.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.ladybird.Ladybird.svg"
  ln -s /opt/ladybird/usr/share/Lagom/icons/128x128/app-browser.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.ladybird.Ladybird.png"
  ln -s /opt/ladybird/usr/share/Lagom/icons/48x48/app-browser.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.ladybird.Ladybird.png"
}
