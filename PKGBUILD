# Maintainer: Huy Cuong Nguyen <huycn@users.noreply.github.com>

pkgname=git-credential-manager-linux
_name=gcml
pkgver=3.0.2
pkgrel=1
pkgdesc='Git Credential Manager rewritten in C++/Qt for Linux (no .NET runtime needed)'
arch=('x86_64' 'aarch64')
url='https://github.com/huycn/gcml'
license=('MIT')
depends=('gcc-libs' 'glibc' 'git' 'libsecret' 'openssl' 'qt6-base' 'qt6-svg')
makedepends=('cmake' 'ninja')
provides=('git-credential-manager')
conflicts=('git-credential-manager' 'git-credential-manager-bin')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f19ffdbd68ee36bad53b33268d96de5925966bb3fab252407cdb9108f1db4f5')

build() {
  # The build embeds `git rev-parse HEAD` in the version string: keep it from picking up this AUR repository.
  export GIT_CEILING_DIRECTORIES="$srcdir"
  # Tracing records source file names (__FILE__): make them relative instead of build paths.
  CXXFLAGS+=" -ffile-prefix-map=$srcdir/$_name-$pkgver=."
  cmake -S "$_name-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGCM_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
