# Maintainer: Treyfane Dingo <echo ZGluZ28rYXVyQGZ1cmNvbS5vcmcK | base64 -d>

_pkgname=QPrompt-Teleprompter
pkgname=qprompt-git
pkgver=2.0.0.rflatpak.0.gef9e038
pkgrel=1
pkgdesc="Teleprompter software for video creators (git version)"
arch=('x86_64')
url="https://qprompt.app/"
license=('GPL-3.0-only')
options=(!lto)

depends=(
  hicolor-icon-theme
  qt6-base
  qt6-declarative
  kcoreaddons
  kirigami
)

optdepends=(
  'qt6-wayland: Wayland platform support'
)

makedepends=(
  git
  cmake
  ninja
  extra-cmake-modules
  qt6-shadertools
  qt6-tools
  kirigami
)

provides=('qprompt')
conflicts=('qprompt')

source=("git+https://github.com/Cuperino/QPrompt-Teleprompter.git")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags \
        | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="${CFLAGS} -fPIC" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}"
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
