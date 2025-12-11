# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil.lgbt>
_dotnet_version=10.0
pkgname=clangsharp-pinvoke-generator
pkgver=20.1.2.4
pkgrel=1
pkgdesc="A tool that takes a C/C++ header files as input and generates C# interop code"
arch=('x86_64')
url="https://github.com/dotnet/ClangSharp"
options=(!strip)
license=('MIT')
depends=(
  "dotnet-runtime-${_dotnet_version}"
  'llvm'
  'llvm-libs'
  'clang'
)
makedepends=("dotnet-sdk-${_dotnet_version}" 'cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/dotnet/ClangSharp/archive/refs/tags/v${pkgver}.tar.gz"
    "001-cmake-version-fix.patch"
    "002-arch-clang-cpp-libs.patch"
    "003-clang-21-compatibility.patch"
)
sha256sums=('93eda9ec3c01daeb712f3940fb249b608e70536cd94e5044210d917c5c227092'
            'cb402c2415a4a0fbe8dc89d33f2febbfd6a0f0be67e4e40608dda37d8f64af20'
            '816216493ca272ec115f0972088d07f0cd5f3ee930df9313a3e54dbdee934381'
            'a7162b0788f44c679b866935ea75d45c387e4c7366949302d7b6109e90663b9b')
_libver=20.1.2

prepare() {
    cd ClangSharp-${pkgver}

    # Fix CMake 4.0 compatibility issue
    patch -Np1 -i "../001-cmake-version-fix.patch"

    # Arch packs all clang libraries as libclang-cpp.so
    patch -Np1 -i "../002-arch-clang-cpp-libs.patch"

    # Patch for Clang 21 compatibility
    patch -Np1 -i "../003-clang-21-compatibility.patch"
}

build() {
    local cmake_options=(
        -B cmake_build
        -S ClangSharp-${pkgver}
        -DCMAKE_BUILD_TYPE=Release
    )

    cmake "${cmake_options[@]}"
    cmake --build cmake_build
    dotnet publish \
        ClangSharp-${pkgver}/sources/ClangSharpPInvokeGenerator/ClangSharpPInvokeGenerator.csproj \
        --runtime linux-x64 \
        --sc \
        -o "${srcdir}/build" \
        -c Release \
        -f net${_dotnet_version} \
        -p:AnalysisLevel=None \
        -p:DebugType=None \
        -p:DebugSymbols=false \
        -p:PublishReadyToRun=true \
        -p:PublishSingleFile=true \
        -p:IncludeNativeLibrariesForSelfExtract=true \
        -p:PackAsTool=false
}

check() {
    dotnet test ./ClangSharp-${pkgver}/ClangSharp.sln -c Release -f net${_dotnet_version} --no-build
}

package() {
    install -Dm755 "${srcdir}/build/ClangSharpPInvokeGenerator" "${pkgdir}/usr/bin/ClangSharpPInvokeGenerator"
    ln -s "ClangSharpPInvokeGenerator" "${pkgdir}/usr/bin/clangsharp-pinvoke-generator"
    install -Dm644 "${srcdir}/ClangSharp-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/cmake_build/lib/libClangSharp.so.${_libver}" "${pkgdir}/usr/lib/libClangSharp.so.${_libver}"
    ln -s "libClangSharp.so.${_libver}" "${pkgdir}/usr/lib/libClangSharp.so"
}
