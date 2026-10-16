# Maintainer: Milad Alizadeh (git@mil.ad)
_pkgname=sioyek
pkgname="${_pkgname}-supernote"
pkgver=r2096.4719fbb2
pkgrel=1
pkgdesc="A PDF viewer designed for reading research papers and technical books with Supernote .mark file support."
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://github.com/mil-ad/sioyek"
license=("GPL3")
# mupdf is vendored: its SONAME encodes the minor version (libmupdf.so.28.3),
# so every system mupdf point release breaks a dynamically linked sioyek.
# Run ./update-mupdf.sh to pick up mupdf security fixes.
_mupdfver=1.28.4
depends=(qt6-wayland qt6-speech qt6-declarative qt6-svg sqlite3 zlib harfbuzz)
makedepends=("cmake" "git" "qt6-tools")
provides=("sioyek")
conflicts=("sioyek-git" "sioyek")
source=("git+https://github.com/mil-ad/sioyek.git#branch=feature/add-supernote-mark-support"
        "https://mupdf.com/downloads/archive/mupdf-${_mupdfver}-source.tar.gz")
sha512sums=('SKIP'
            '74c697fdfef8068f69fc61e9018d03fc29325f7f09e36b755e0218d0027c3ebe5d7bb3075a31a3be7dba4088380b3f638d877a0b1cadfc1ea8bb17b18667f4ed')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # CMakeLists.txt wants the mupdf submodule at mupdf/. The release tarball
  # stands in for it: it ships thirdparty/ populated, so no recursive fetch.
  rm -rf "${srcdir}/${_pkgname}/mupdf"
  mv "${srcdir}/mupdf-${_mupdfver}-source" "${srcdir}/${_pkgname}/mupdf"
}

build() {

  # As upstream's build_linux.sh, minus the apps sioyek doesn't need
  # (dropping them also keeps libX11/freeglut out of makedepends).
  # Default build=release puts the .a files in mupdf/build/release.
  make -C "${srcdir}/${_pkgname}/mupdf" \
    USE_SYSTEM_HARFBUZZ=yes \
    HAVE_X11=no \
    HAVE_GLUT=no \
    -j"$(nproc)" \
    libs

  # CMakeLists.txt adds the mupdf link dir only on APPLE, never names
  # mupdf-third, and references ${HARFBUZZ_LIBRARIES} without ever setting it
  # -- all three are needed to resolve libmupdf.a's undefined symbols.
  # CMAKE_CXX_STANDARD_LIBRARIES puts them last, as static linking requires.
  cmake -B build -S "${srcdir}/${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/Qt6 \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
    -DCMAKE_EXE_LINKER_FLAGS="-L${srcdir}/${_pkgname}/mupdf/build/release" \
    -DCMAKE_CXX_STANDARD_LIBRARIES="-lmupdf-third $(pkg-config --libs harfbuzz)"
  cmake --build build

  # Vendoring is pointless if we ship a binary that still needs system mupdf.
  if ldd build/sioyek | grep -q libmupdf; then
    echo "error: sioyek is still linked against the system libmupdf" >&2
    ldd build/sioyek | grep libmupdf >&2
    return 1
  fi
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/etc/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"

  install -Dm755 "build/sioyek" "${pkgdir}/usr/bin/sioyek"

  cd "${srcdir}/${_pkgname}"

  install -Dm644 "resources/sioyek.desktop" "${pkgdir}/usr/share/applications/sioyek.desktop"
  install -Dm644 "pdf_viewer/keys.config" "${pkgdir}/etc/${_pkgname}/keys.config"
  install -Dm644 "pdf_viewer/prefs.config" "${pkgdir}/etc/${_pkgname}/prefs.config"

  cp -r "pdf_viewer/shaders" "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 "tutorial.pdf" "${pkgdir}/usr/share/${_pkgname}/tutorial.pdf"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "resources/sioyek-icon-linux.png" "${pkgdir}/usr/share/pixmaps/"

  # Install man page if it exists
  if [ -f "resources/sioyek.1" ]; then
    install -Dm644 "resources/sioyek.1" "${pkgdir}/usr/share/man/man1/sioyek.1"
  fi
}
