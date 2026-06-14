# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=fastcap2
pkgver=2.1
pkgrel=3
pkgdesc="Capacitance Solver for 3D conductive geometries - including Python module"
arch=('x86_64')
_git_url="https://github.com/klayoutmatthias/FastCap2"
url="https://klayoutmatthias.github.io/FastCap2/index.html"
license=('LicenseRef-Custom')
depends=(
    'python'
    'glibc'
    'libstdc++'
    'libgcc'
)
makedepends=(
    'git'
    'cmake'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'gtest'
)
options=()
source=("${pkgname}::git+${_git_url}#tag=v${pkgver}")
b2sums=('cd4c1da8590ad2fccabbb9eddaeb6b2a844946674beb26b2de8ff947db7bf8547383279dd4e92b7e9c85b64bc6fbbbb3abc8df0f0394ca7c40865edbf1270c23')

build() {
    # locally set C++11
    CXXFLAGS="$CXXFLAGS --std=c++11"

    # Compile FastCap
    local cmake_options=(
        -B build
        -S "${pkgname}"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )

    cmake "${cmake_options[@]}"
    cmake --build build

    # Compile Python module
    (
        cd "${pkgname}"
        python -m build --wheel --no-isolation
    )
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
    # Install fastcap binaries
    (
        DESTDIR="$pkgdir" cmake --install build

        # Move all helper binaries to it's own subdirectory in lib
        local BINARIES=(busgen cubegen pipedgen pltcapgen teragen unittests)
        local LIBDIR="${pkgdir}/usr/lib/${pkgname}"

        mkdir -p "${LIBDIR}"
        cd "${pkgdir}/usr/bin" && mv -t "${LIBDIR}" "${BINARIES[@]}"
    )

    # Install License & Python module
    (
        cd ${pkgname}
        # Install license
        install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        # Install python module
        python -m installer --destdir="${pkgdir}" dist/*.whl
    )

}

# vim: set ts=4 sw=4 et:
