# Maintainer: taotieren <admin@taotieren.com>

pkgbase=bin2cpp
pkgname=bin2cpp
pkgver=3.1.0
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
source=("${pkgname}::git+${url}.git#tag=${pkgver}"
	"0001-Use-the-kernel-version-as-a-fallback.patch")
sha256sums=('511965596926455f0c73c20b43a2b5264e3456ba057b373c09b27ab9f2bb1c2f'
            '68d7965d56cf62457c5aaee9f911cd8526f9b83557ca53a751ca062ed4bd44f2')
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
   patch -Np1 < ${srcdir}/0001-Use-the-kernel-version-as-a-fallback.patch
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
