# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil.lgbt>
# Maintainer: ThePuzzlemaker <tpzker at thepuzzlemaker dot info>
_dotnet_version=10.0
pkgname=clangsharp-pinvoke-generator
# Unknown why the versions don't line up here. v20 tag has v21 code and is labelled v21 internally.
# See https://github.com/dotnet/ClangSharp/issues/685
pkgver=21.1.8.2
_tagver=20.1.8.2
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
    "${pkgname}-${_tagver}.tar.gz::https://github.com/dotnet/ClangSharp/archive/refs/tags/v${_tagver}.tar.gz"
    "002-arch-clang-cpp-libs.patch"
)
sha256sums=('ba5660953df2d6c74e18d7d9443de0befaddc567ed848d3156d74ee4f4514c74'
            '816216493ca272ec115f0972088d07f0cd5f3ee930df9313a3e54dbdee934381')  
_libver=21.1.8

prepare() {
    cd ClangSharp-${_tagver}

    # Arch packs all clang libraries as libclang-cpp.so
    patch -Np1 -i "../002-arch-clang-cpp-libs.patch"
}

build() {
    local cmake_options=(
        -B cmake_build
        -S ClangSharp-${_tagver}
        -DCMAKE_BUILD_TYPE=Release
    )

    cmake "${cmake_options[@]}"
    cmake --build cmake_build
    dotnet publish \
        ClangSharp-${_tagver}/sources/ClangSharpPInvokeGenerator/ClangSharpPInvokeGenerator.csproj \
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
    dotnet test ./ClangSharp-${_tagver}/ClangSharp.slnx -c Release -f net${_dotnet_version} --no-build
}

package() {
    install -Dm755 "${srcdir}/build/ClangSharpPInvokeGenerator" "${pkgdir}/usr/bin/ClangSharpPInvokeGenerator"
    ln -s "ClangSharpPInvokeGenerator" "${pkgdir}/usr/bin/clangsharp-pinvoke-generator"
    install -Dm644 "${srcdir}/ClangSharp-${_tagver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/cmake_build/lib/libClangSharp.so.${_libver}" "${pkgdir}/usr/lib/libClangSharp.so.${_libver}"
    ln -s "libClangSharp.so.${_libver}" "${pkgdir}/usr/lib/libClangSharp.so"
}
