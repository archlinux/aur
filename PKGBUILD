pkgname=groonga-normalizer-mysql
pkgver=1.3.0
pkgrel=1
pkgdesc="A MySQL compatible normalizer plugin for Groonga."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/groonga/groonga-normalizer-mysql"
license=('LGPL-2.0-only')
source=(
  "https://github.com/groonga/groonga-normalizer-mysql/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/groonga/groonga-normalizer-mysql/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
sha512sums=(
  "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
  "SKIP"
)
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)
depends=(
  gcc
  groonga
)
makedepends=(
  cmake
  ninja
)
checkdepends=(
  git
  make
  ruby-bundler
  ruby-erb
)

# See also: https://wiki.archlinux.org/title/CMake_package_guidelines
build() {
  rm -rf build
  local cmake_options=(
    -B build
    -S "${pkgname}-${pkgver}"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_SKIP_RPATH=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  export GEM_HOME="${PWD}/gem"
  PATH="${GEM_HOME}/bin:${PATH}"
  MAKEFLAGS="-j$(nproc)" gem install --no-user-install grntest
  BUILD_DIR="${PWD}" \
    "../${pkgname}-${pkgver}/test/run-test.sh" \
    --n-retries=2 \
    --read-timeout=30 \
    --reporter=mark
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
