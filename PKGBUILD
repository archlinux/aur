# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=canonical-multipass
_realname=multipass
pkgver=1.8.1
pkgrel=2
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
        git+https://github.com/pocoproject/poco.git
        multipassd.service
        libssh-static.patch
)

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
  git config submodule.3rd-party/poco.url $srcdir/poco

  git submodule update --recursive --init

  patch 3rd-party/libssh/CMakeLists.txt < ${srcdir}/libssh-static.patch
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
  # not needed in package
  rm "$pkgdir"/usr/lib/libssh.a
  install -Dm644 "$srcdir"/multipassd.service "$pkgdir"/usr/lib/systemd/system/multipassd.service
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f7aebd4ab185048ee10e8185ac230c8ac549ff29b2e52722fbf366ad6f3c6b59'
            '8cc982b96a800c9779134a00e741c472da7c8e11183931ec30b184c314364dde')
