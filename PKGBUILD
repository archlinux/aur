pkgname=vvc-vtm-git
_gitname=VVCSoftware_VTM
pkgver=8473
pkgrel=1
pkgdesc="VVC Test Model (VTM) reference encoder/decoder - git version"
arch=('x86_64')
url="https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'gcc' 'make')
source=("git+https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git rev-list --count HEAD
}

build() {
    cd "$_gitname"

    mkdir -p build
    cd build

    cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS_RELEASE="-O3 -march=native -mtune=native \
                            -fno-plt -fomit-frame-pointer \
                            -fno-semantic-interposition \
                            -falign-functions=32 \
                            -falign-loops=32 \
                            -funroll-loops \
                            -fno-math-errno \
                            -fno-trapping-math \
                            -flto \
                            -Wno-error=unused-but-set-variable \
                            -Wno-error=unused-variable \
                            -Wno-error=maybe-uninitialized" \
    -DCMAKE_CXX_FLAGS_RELEASE="-O3 -march=native -mtune=native \
                                -fno-plt -fomit-frame-pointer \
                                -fno-semantic-interposition \
                                -falign-functions=32 \
                                -falign-loops=32 \
                                -funroll-loops \
                                -fno-math-errno \
                                -fno-trapping-math \
                                -flto \
                                -Wno-error=unused-but-set-variable \
                                -Wno-error=unused-variable \
                                -Wno-error=maybe-uninitialized" \
    -DCMAKE_EXE_LINKER_FLAGS="-flto" \
    -DCMAKE_SHARED_LINKER_FLAGS="-flto" \
    -Wno-dev

    make -j"$(nproc)"
}

package() {
    cd "$_gitname"

    # Binaries
    install -d "$pkgdir/usr/bin"
    for f in bin/umake/gcc-16.1/x86_64/release/*; do
        base="$(basename "$f")"

        # avoid gnu parallel conflict
        [[ "$base" == "parcat" ]] && continue

        # install with VTM prefix for clarity
        install -m755 "$f" "$pkgdir/usr/bin/VTM$base"
    done

    # Library
    install -d "$pkgdir/usr/lib"
    for f in lib/umake/gcc-16.1/x86_64/release/*.a; do
        install -m644 "$f" "$pkgdir/usr/lib/"
    done

    # License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
