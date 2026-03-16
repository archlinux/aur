pkgname=stepreduce-git
pkgver=r13.63c8a10
pkgrel=1
pkgdesc="A deduplicating tool for step files"
arch=(x86_64)
url="https://gitlab.com/sethhillbrand/stepreduce"
license=(GPL-3.0-or-later)
source=(git+https://gitlab.com/sethhillbrand/stepreduce.git#commit=63c8a10795fe6136607041642c0e07e97b32a518)

makedepends=(
cmake
)

sha256sums=('f93676851ce822a0d8461d023278a426fbf45bdcaa1cd807caa6f49d317215f9')

pkgver() {
  cd stepreduce
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S stepreduce
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
    # exclude problematic tests
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
