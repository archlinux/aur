# clang-format-all: every clang-format major version, installed as clang-format-N.
#
#  * 3.9 .. 20  -> static binaries from muttleyxd/clang-tools-static-binaries
#  * 21 ..      -> built from the official llvm-project source release
#
# To add a new LLVM release: append "<major>:<full version>" to _src_versions,
# bump pkgver, then run `updpkgsums && makepkg --printsrcinfo > .SRCINFO`.

pkgname=clang-format-all
pkgver=23.1.5
pkgrel=1
pkgdesc="All clang-format versions (3.9 to 23) installed side by side as clang-format-N"
arch=('x86_64')
url="https://github.com/muttleyxd/clang-tools-static-binaries"
license=('Apache-2.0 WITH LLVM-exception' 'NCSA')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'ninja' 'python')  # python is required by LLVM's own CMake build
options=('!strip' '!debug' '!lto')

# Prebuilt static binaries: release tag -> versions
_old_tag=master-2da3e7b
_old_versions=(3.9 4 5 6 7 8 9 10 11)
_new_tag=master-796e77c
_new_versions=(12 13 14 15 16 17 18 19 20)
# Built from source: <installed name>:<llvm version>
_src_versions=(21:21.1.8 22:22.1.8 23:23.1.5)

_bin_url=https://github.com/muttleyxd/clang-tools-static-binaries/releases/download
_llvm_url=https://github.com/llvm/llvm-project/releases/download

source=("LICENSE.TXT.clang-8-and-lower::$_bin_url/$_old_tag/LICENSE.TXT.clang-8-and-lower"
        "LICENSE.TXT.clang-9-and-higher::$_bin_url/$_old_tag/LICENSE.TXT.clang-9-and-higher")
for _v in "${_old_versions[@]}"; do
    source+=("clang-format-$_v::$_bin_url/$_old_tag/clang-format-${_v}_linux-amd64")
done
for _v in "${_new_versions[@]}"; do
    source+=("clang-format-$_v::$_bin_url/$_new_tag/clang-format-${_v}_linux-amd64")
done
noextract=()
for _v in "${_src_versions[@]}"; do
    source+=("$_llvm_url/llvmorg-${_v#*:}/llvm-project-${_v#*:}.src.tar.xz")
    noextract+=("llvm-project-${_v#*:}.src.tar.xz")
done

sha256sums=('2050acfe8b8d5ae1ef971b6ab419cd9f46e3f2d779a09966105622b3112600d9'
            'ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47'
            '094380fd6e2e7c35c9021f3f02ec9a204af5ab0cd196939eb511274cd15ce45b'
            'bccc5098d162c9606e0bdb436d5fed2da1d97ae2362d50b1a677da4fdaa9e31d'
            '12b798b1a9317780d9aa02b5f536c5071124c4f404dd74a3d2db61a2ea04a1fe'
            'd72cb3f10fcc17ed8405566d27c8ebd53c180e109267474f3689c01ce04b7ce8'
            '51c76b45c3f8bdebd178f35e41e19b23de52a8ff29a15226e72c552f4e2c07aa'
            '1877d2412003454ba7f09c1e2b26c70b9742781f3a46103de67f2530925e7904'
            '1b4e5329b21057f69633622e0d3eefe09bf3a6557e2f0a4a456521bdadf9d8e2'
            '3b6efad56475a957f51e975b06f2e6972ad8bd4609a280164bcdc28bde81130e'
            '99e7691c5864eb0c479f958038af48103e75cdb1e00e55ae6041241c68f4c8b2'
            '136093d865abab16bff6edaf289df39d27ddecdbdbf6851859e7b99d438448a2'
            '532987276956692c77f36fbda3119376b156d8b8f3d0e34962efebf943df449e'
            '27d2f2d8a42da0a0f55bfbaac8e503ebc364581d504f035544e8b6460880fa9e'
            '0c42810b8824fab14906ac85dcad709e0ae76129dd3cc393c78ba715645ee83c'
            '9e7de3a64c3bc473fb59c229034f7f5f8fb8ea761d0b6ae45ce16e96fe1eda22'
            '45b4ecd5e2a48b17d10e41da6b576afd9dc535468043fe8a18d107510605bb9e'
            'bef23637c7c7d1c127d52f6c691e55b6ead1ff00e8199a36ecfd19ff554037dd'
            '8d0b2012a70032666cbc4503ff10b4a37aad556c24f5ab6a09f67e17c5b9c9c1'
            'e900c1e520b6c9b9c99e43c0f45ccd12927838741cfc60c077a33dec69bb60cc'
            '4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142'
            '922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888'
            'fb50b1eac93ddeb3aa8dab4cfe324dff74f4a9c2bdee6160c9e36188f8d06a6e')

prepare() {
    local v full
    for v in "${_src_versions[@]}"; do
        full=${v#*:}
        rm -rf "llvm-project-$full.src"
        # Only the parts needed to build clang-format
        bsdtar -xf "llvm-project-$full.src.tar.xz" \
            "llvm-project-$full.src/llvm" \
            "llvm-project-$full.src/clang" \
            "llvm-project-$full.src/cmake" \
            "llvm-project-$full.src/third-party" \
            "llvm-project-$full.src/libc"
    done
}

build() {
    local v full
    for v in "${_src_versions[@]}"; do
        full=${v#*:}
        cmake -S "llvm-project-$full.src/llvm" -B "build-$full" -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DLLVM_ENABLE_PROJECTS=clang \
            -DLLVM_TARGETS_TO_BUILD=X86 \
            -DLLVM_ENABLE_ASSERTIONS=OFF \
            -DLLVM_BUILD_LLVM_DYLIB=OFF \
            -DBUILD_SHARED_LIBS=OFF \
            -DLLVM_INCLUDE_TESTS=OFF \
            -DLLVM_INCLUDE_BENCHMARKS=OFF \
            -DLLVM_INCLUDE_EXAMPLES=OFF \
            -DLLVM_INCLUDE_DOCS=OFF \
            -DLLVM_ENABLE_BINDINGS=OFF \
            -DLLVM_ENABLE_ZLIB=OFF \
            -DLLVM_ENABLE_ZSTD=OFF \
            -DLLVM_ENABLE_LIBXML2=OFF \
            -DLLVM_ENABLE_LIBEDIT=OFF \
            -DLLVM_ENABLE_LIBPFM=OFF \
            -DLLVM_ENABLE_TERMINFO=OFF \
            -DCLANG_INCLUDE_TESTS=OFF \
            -DCLANG_INCLUDE_DOCS=OFF \
            -DCLANG_ENABLE_ARCMT=OFF \
            -DCLANG_ENABLE_STATIC_ANALYZER=OFF \
            -DCLANG_PLUGIN_SUPPORT=OFF
        ninja -C "build-$full" clang-format
    done
}

package() {
    local v libdir="$pkgdir/usr/lib/$pkgname"
    install -dm755 "$libdir" "$pkgdir/usr/bin"

    for v in "${_old_versions[@]}" "${_new_versions[@]}"; do
        install -m755 "clang-format-$v" "$libdir/clang-format-$v"
    done
    for v in "${_src_versions[@]}"; do
        install -m755 "build-${v#*:}/bin/clang-format" "$libdir/clang-format-${v%%:*}"
    done
    for v in "$libdir"/clang-format-*; do
        ln -s "/usr/lib/$pkgname/${v##*/}" "$pkgdir/usr/bin/${v##*/}"
    done

    install -Dm644 LICENSE.TXT.clang-8-and-lower LICENSE.TXT.clang-9-and-higher \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
