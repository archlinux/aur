# Maintainer: taotieren <admin@taotieren.com>

pkgbase=bin2cpp
pkgname=bin2cpp
pkgver=3.1.1
pkgrel=1
pkgdesc="bin2cpp: The easiest way to embed small files into a c++ executable. bin2cpp converts text or binary files to C++ files (*.h, *.cpp) for easy access within the code."
arch=($CARCH)
url="https://github.com/end2endzone/bin2cpp"
license=('MIT')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
)
makedepends=(
    cmake
    doxygen
    gtest
    git
    ninja
    pkgconf
    #AUR
    rapidassist
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('c6de4b825fb74ec07f6ce104d2c9634e7053f58481c5a9e4c2f0ec50b767da41')
options=(!strip !lto !debug)

build() {
    #     export LDFLAGS="-L/lib64"
    #     if test -n "$LD_LIBRARY_PATH"; then
    #         export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib64"
    #     else
    #         export LD_LIBRARY_PATH=/lib64
    #     fi
    PLATFORM=x64
    cd "${srcdir}/${pkgname}/"
    sed -e 's|"."|"share/bin2cpp"|g' \
        -e 's|"docs"|"share/doc/bin2cpp"|g' \
        -i CMakeLists.txt
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBIN2CPP_BUILD_TEST=OFF \
        -DBIN2CPP_BUILD_SAMPLES=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm0644 "${srcdir}"/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
