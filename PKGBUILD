# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=paraphrase-git
_pkgname=paraphrase
pkgver=0.1.0.r273.g361a400
pkgrel=1
pkgdesc="Offline AI grammar checker, rewriter and reply writer that runs on your computer"
arch=('x86_64')
url="https://github.com/keshavbhatt/paraphrase"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libgomp'
  'libstdc++'
  'libxcb'
  'openssl'
  'qt6-base'
  'qt6-svg'
  'wayland'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'wayland-protocols'
)
optdepends=(
  'qt6-wayland: native Wayland windows'
  'xdg-desktop-portal: the global shortcut and pasting results back on Wayland'
  'xdg-desktop-portal-kde: the portals on KDE Plasma'
  'xdg-desktop-portal-gnome: the portals on GNOME'
  'kwallet: a key for the opt-in history on KDE'
  'gnome-keyring: a key for the opt-in history on GNOME'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# llama.cpp and yaml-cpp are git submodules, pinned by the main repository.
source=(
  "${_pkgname}::git+https://github.com/keshavbhatt/paraphrase.git"
  'llama.cpp::git+https://github.com/ggml-org/llama.cpp.git'
  'yaml-cpp::git+https://github.com/jbeder/yaml-cpp.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  # The version in CMakeLists.txt, then the commits since: 0.1.0.r123.gabc1234. Once releases
  # are tagged (v0.1.0), git describe takes over.
  if git describe --long --tags --match 'v*' >/dev/null 2>&1; then
    git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    local version
    version="$(sed -n 's/^ *VERSION \([0-9.]*\)$/\1/p' CMakeLists.txt | head -n 1)"
    printf '%s.r%s.g%s' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.third_party/llama.cpp.url "${srcdir}/llama.cpp"
  git config submodule.third_party/yaml-cpp.url "${srcdir}/yaml-cpp"
  git -c protocol.file.allow=always submodule update
}

build() {
  # Source file names in llama.cpp's and yaml-cpp's messages, without the build folder.
  export CFLAGS+=" -ffile-prefix-map=${srcdir}=."
  export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=."
  # llama.cpp is built for this machine's CPU (GGML_NATIVE) and linked into the daemon, so
  # no libllama or libggml lands in /usr/lib next to the system's own.
  cmake -B build -S "${_pkgname}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPARAPHRASE_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  # What llama.cpp and yaml-cpp install for developers: the programs are linked statically.
  rm -rf "${pkgdir}"/usr/include "${pkgdir}"/usr/lib/cmake "${pkgdir}"/usr/lib/pkgconfig
  find "${pkgdir}"/usr/lib -name '*.a' -delete 2>/dev/null || true
  find "${pkgdir}"/usr -type d -empty -delete
}
