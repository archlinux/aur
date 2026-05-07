pkgname=stepreduce-git
_build_fragment="commit=63c8a10795fe6136607041642c0e07e97b32a518"
pkgver=r13.63c8a10
pkgrel=1
pkgdesc="A deduplicating tool for step files"
arch=(x86_64)
url="https://gitlab.com/sethhillbrand/stepreduce"
license=(GPL-3.0-or-later)
source=(git+https://gitlab.com/sethhillbrand/stepreduce.git#commit=63c8a10795fe6136607041642c0e07e97b32a518)

b2sums=('79c21d903793236cb1cd0b35e7d08a9b4a5f5c11d8daa55b1073d4feb6b33980a99af428fe3b4162c2bdf13fb68ad3daaae8355741f4060b6c120672ae18936b')

depends=(
opencascade
)

makedepends=(
git
cmake
)

pkgver() {
  cd stepreduce
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build_dir
    -S stepreduce
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build_dir
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build_dir
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
  #DESTDIR="$pkgdir" cmake --install build_dir
  install -Dt "${pkgdir}/usr/bin" -m0755 build_dir/stepreduce
}
