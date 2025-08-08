# Maintainer: DeX77 <dex+arch at dragonslave dot de>

pkgname=maxr
pkgver=0.2.17
pkgrel=1
pkgdesc="OpenSource reimplementation for M.A.X."
arch=('x86_64')
url="https://www.maxr.org"
license=('GPL-2.0-only AND CC-BY-SA-3.0')
depends=('sdl2_mixer' 'sdl2_net' 'gcc-libs' 'sdl2-compat' 'glibc' 'bash')
makedepends=('git' 'cmake')
_tag=4adca7eff33bcf229f506a90052c7c34cf51f5c3 # git rev-parse "release-${pkgver}"
_doc_test_tag=ae7a135
_nlohmann_tag=9cca280
_spiritless_po=5d729be
source=("git+https://github.com/maxr-dot-org/maxr.git#tag=$_tag"
        "git+https://github.com/oo13/spiritless_po.git#commit=$_spiritless_po"
        "git+https://github.com/doctest/doctest.git#commit=$_doc_test_tag"
        "git+https://github.com/nlohmann/json.git#commit=$_nlohmann_tag")
b2sums=('771620fba2226555fd28bfaa5268956cabe7c25940f0e7fcf9ab6a88ed6e25a2b5a325e3a9fb41303263225c10a70fbbd01f65ef37b98dcdc896705c4ebdcda9'
        '83c33b79a9bdc54b65b5ab11bd24118eb710f6196daac9eaab136ae2ec861dda8d46277e67a264a9e8e332b2158e9a6b160a212af1e3ef16e60e58b1bb92b680'
        '4d808f831400e0e98f24aab8aa51b6af1ae16af341a87776335068099d3d0ddc25175f154ee5ba79a465ef878e952e8fe577f9e20e3bb82b3d95b87a893d58f8'
        '8840eb8346065a766c5fff736b36d042ae746696183612c0fb5f6b10b873e29e8f3cc3594c20f0c2a76c59b4a25cbe6ca9825947cf751798b5b0ac60c4dccbd7')

pkgver() {
    cd "$pkgname"
    git describe  | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd maxr
  git submodule init
  git config submodule.libs/submodules/spiritless_po.url "$srcdir/spiritless_po"
  git config submodule.libs/submodules/doctest.url "$srcdir/doctest"
  git config submodule.libs/submodules/json.url "$srcdir/json"
  git -c protocol.file.allow=always submodule update
}

build() {
    cd maxr
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=None \
          -D CMAKE_INSTALL_PREFIX=/usr
    make -C build
}

check() {
  cd maxr

  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel "$(nproc)"
    # exclude problematic tests
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"
}

package() {
    cd maxr
    make -C build install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
