# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=cling
pkgver=1.2
pkgrel=1
pkgdesc="Interactive C++ interpreter, built on the top of LLVM and Clang libraries"
arch=("i686" "x86_64")
url="https://root.cern/cling/"
license=("custom:Cling Release License")
depends=("libxml2")
makedepends=("git" "cmake" "ninja" "python")
optdepends=(
    "perl: support for scan-build, ccc-analyzer and c++-analyzer"
    "python: support for scan-view and Jupyter"
    "python-pygments: support for opt-viewer"
    "python-yaml: support for opt-viewer"
)
source=(
    "cling-llvm::git+https://github.com/root-project/llvm-project.git#tag=cling-llvm18-20250207-01"
    "cling::git+https://github.com/root-project/cling.git#tag=v$pkgver"
)
sha256sums=(
    "SKIP"
    "SKIP"
)
options=(!lto !debug)


build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake \
        -G Ninja \
        -DLLVM_ENABLE_BINDINGS=OFF \
        -DCLING_CXX_PATH="/opt/cling/bin/clang++" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/opt/cling" \
        -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
        -DLLVM_BUILD_LLVM_DYLIB=OFF \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_BUILD_DOCS=OFF \
        -DLLVM_BUILD_TOOLS=OFF \
        -DLLVM_ENABLE_SPHINX=OFF \
        -DLLVM_ENABLE_DOXYGEN=OFF \
        -DLLVM_EXTERNAL_PROJECTS=cling \
        -DLLVM_EXTERNAL_CLING_SOURCE_DIR="$srcdir/cling" \
        -DLLVM_ENABLE_PROJECTS=clang \
        "$srcdir/cling-llvm/llvm"

    ninja
}

binary_path(){
    FILE_PATH="$1"
    OLD_STRING="$2"
    NEW_STRING="$3"
    TMP_FILE_PATH="$4"

    if (( ${#NEW_STRING} > ${#OLD_STRING} )); then
        echo "Error: New string is longer than old string. Cannot patch."
        return 1
    fi
    printf "%s" "$NEW_STRING" > "$TMP_FILE_PATH"
    while (( ${#NEW_STRING} < ${#OLD_STRING} )); do
        NEW_STRING+="0";
        printf '\0' >> "$TMP_FILE_PATH"
    done
    SEEK=$(strings -t d "$FILE_PATH" | grep "$OLD_STRING" | head -n 1 | cut -d ' ' -f 1)
    if [ ! -z "$SEEK" ]; then
        dd if="$TMP_FILE_PATH" of="$FILE_PATH" obs=1 seek="$SEEK" conv=notrunc
    fi
}


package() {
    cd "$srcdir/build"

    DESTDIR="$pkgdir" ninja install

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"

    install -Dm644 "$srcdir/cling/LICENSE.TXT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # include CMake target import file so that other packages are able to use
    # `find_package(Cling REQUIRED)`
    install -Dm644 "$srcdir/build/tools/cling/lib/cmake/cling/ClingTargets.cmake" \
        "$pkgdir/opt/cling/lib/cmake/cling"

    # adjust cling target locations
    sed -Ei -e 's#(IMPORTED_LOCATION_RELEASE) ".*/([^/]*)"#\1 "/opt/cling/lib/\2"#g' \
        -e 's#(INTERFACE_COMPILE_DEFINITIONS "LLVM_PATH=).*#\1\\"/opt/cling\\""#g' \
        "$pkgdir/opt/cling/lib/cmake/cling/ClingTargets.cmake"

    # omit man page for clang's scan-build
    rm -f "$pkgdir/opt/cling/share/man/man1/scan-build.1"

    # remove empty directories
    rmdir -p --ignore-fail-on-non-empty "$pkgdir/opt/cling/share/man/man1"
    rmdir -p --ignore-fail-on-non-empty "$pkgdir/opt/cling/include/cling/cint"

    echo "----- Patching binaries ------"
    TMP_FILE_PATH="$srcdir"/tmpfile

    FILES=(
        "$pkgdir/opt/cling/bin/cling"
        "$pkgdir/opt/cling/lib/libcling.so.18.1"
        "$pkgdir/opt/cling/lib/libclingJupyter.so.18.1"
        "$pkgdir/opt/cling/lib/libclingInterpreter.a"
    )

    for FILE in "${FILES[@]}"; do
        OLD_PATH=" \"/opt/cling/include:$srcdir/cling/include:$srcdir/cling-llvm/llvm/../clang/include:$srcdir/build/tools/clang/include:$srcdir/cling-llvm/llvm/include:$srcdir/build/include\""
        NEW_PATH=" \"/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include\""
        binary_path "$FILE" "$OLD_PATH" "$NEW_PATH" "$TMP_FILE_PATH"

        OLD_PATH="/opt/cling/include:$srcdir/cling/include:$srcdir/cling-llvm/llvm/../clang/include:$srcdir/build/tools/clang/include:$srcdir/cling-llvm/llvm/include:$srcdir/build/include"
        NEW_PATH="/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include:/opt/cling/include"
        binary_path "$FILE" "$OLD_PATH" "$NEW_PATH" "$TMP_FILE_PATH"

        OLD_PATH="$srcdir/build"
        NEW_PATH="/opt/cling"
        binary_path "$FILE" "$OLD_PATH" "$NEW_PATH" "$TMP_FILE_PATH"
    done
    echo "------------------------------"
}
