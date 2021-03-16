# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
pkgver=1.6.2
pkgrel=1
pkgdesc="Multipass is a lightweight VM manager for Linux, Windows and macOS."
arch=('x86_64')
url="https://multipass.run"
license=('GPL3')
depends=('apparmor' 'qt5-base')
optdepednds=('qt5-x11extras')
makedepends=('cmake')
source=("git+https://github.com/canonical/${_realname}.git#tag=v${pkgver}"
        git+https://github.com/CanonicalLtd/grpc.git
        git+https://github.com/canonical/yaml-cpp.git
        git+https://github.com/CanonicalLtd/libssh.git
        git+https://git.tukaani.org/xz-embedded.git
        git+https://github.com/CanonicalLtd/semver.git
        git+https://github.com/ricab/scope_guard.git
        git+https://github.com/Skycoder42/QHotkey.git
        git+https://github.com/fmtlib/fmt.git
)
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

prepare() {
  cd "${srcdir}/${_realname}"
  git submodule init

  ### these are copied from the git submodules of the repo
  git config submodule.3rd-party/grpc.url $srcdir/grpc
  git config submodule.3rd-party/yaml-cpp.url $srcdir/yaml-cpp
  git config submodule.3rd-party/libssh/libssh.url $srcdir/libssh
  git config submodule.3rd-party/xz-decoder/xz-embedded.url $srcdir/xz-embedded
  git config submodule.3rd-party/semver.url $srcdir/semver
  git config submodule.3rd-party/scope_guard.url $srcdir/scope_guard
  git config submodule.3rd-party/qhotkey.url $srcdir/QHotkey
  git config submodule.3rd-party/fmt.url $srcdir/fmt

  git submodule update --recursive
}

build() {
  mkdir -p "_build"
  cd "_build"
  export CXXFLAGS=-Wno-error=deprecated-declarations
  cmake \
      -Wno-dev \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      "${srcdir}/${_realname}"
  make
}

package() {
  cd "_build"
  make DESTDIR="$pkgdir" install
}
