# Maintainer: Horror Proton <https://github.com/horror-proton>

pkgname=maa-assistant-arknights
_pkgver=v4.12.2
pkgver="$(echo ${_pkgver//-/.} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime)
makedepends=(eigen git cmake python ninja python-pyelftools elfutils patchelf unzip zip)
source=("MaaAssistantArknights::git+$url.git#tag=$_pkgver"
        'MaaDeps::git+https://github.com/MaaAssistantArknights/MaaDeps.git'
        'vcpkg::git+https://github.com/microsoft/vcpkg.git'
        'MaaDeps.patch')
install="${pkgname}.install"
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '3a24dda8815a4f2ccd3caa26cdb9f17f')

_vcpkg_empty_overlay() {
    mkdir -p "$1"
    echo 'set(VCPKG_POLICY_EMPTY_PACKAGE enabled)' > "$1"/portfile.cmake
    echo "{ \"name\": \"$1\", \"version\": \"$2\" }" > "$1"/vcpkg.json
}

prepare() {
    cd "$srcdir/MaaAssistantArknights"

    git submodule init
    git config submodule.MaaDeps.url "$srcdir/MaaDeps"
    git -c protocol.file.allow=always submodule update MaaDeps

    sed -i 's/RUNTIME\sDESTINATION\s\./ /g; s/LIBRARY\sDESTINATION\s\./ /g; s/PUBLIC_HEADER\sDESTINATION\s\./ /g' CMakeLists.txt

    cd "MaaDeps"
    git submodule init
    git config submodule.vcpkg.url "$srcdir/vcpkg"
    git -c protocol.file.allow=always submodule update vcpkg
    git restore .
    git clean -ff

    sed -i $'s/\r$//' maadeps.cmake
    patch -p1 -i ../../MaaDeps.patch

    cd "vcpkg-overlay/ports"
    _vcpkg_empty_overlay eigen3 $(pacman -Q eigen | awk '{print $2}')
    _vcpkg_empty_overlay opencv $(pacman -Q opencv | awk '{print $2}')
    _vcpkg_empty_overlay opencv4 $(pacman -Q opencv | awk '{print $2}')
    _vcpkg_empty_overlay maa-onnxruntime $(grep '^Version: ' /usr/lib/pkgconfig/libonnxruntime.pc | awk '{print $2}')
}

build() {
    cd "$srcdir/MaaAssistantArknights"
    cd "MaaDeps"
    python ./build.py

    cd "$srcdir"
    cmake -B build -S MaaAssistantArknights \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_CXX_FLAGS=-I"$PWD"/MaaAssistantArknights/MaaDeps/vcpkg/installed/maa-x64-linux/include \
        -DINSTALL_THIRD_LIBS=ON \
        -DINSTALL_RESOURCE=ON \
        -DINSTALL_PYTHON=ON \
        -DMAA_VERSION="$_pkgver"
    cmake --build build
}

package() {
    cd "$srcdir"
    cmake --install build --prefix "$pkgdir"/usr

    cd "$pkgdir"/usr
    mkdir -p share/"${pkgname}"
    mv Python share/"${pkgname}"
    mv resource share/"${pkgname}"
}
