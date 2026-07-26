# Maintainer : HMK

pkgname=svt-av1-hdr10plus-git
pkgver=4.1.0.r19.g8b4b9f562
pkgrel=2
pkgdesc='SVT-AV1 with enhancements for SDR and HDR encoding with HDR10+ and DoVi support. PGO.'
arch=('x86_64')
url='https://github.com/juliobbv-p/svt-av1-hdr'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('glibc' 'dovi-tool' 'libhdr10plus-rs-git')
makedepends=('git' 'cmake' 'yasm' 'clang' 'llvm' 'lld' 'ffmpeg')
provides=('svt-av1' 'svt-av1-git')
conflicts=('svt-av1' 'svt-av1-git' 'svt-av1-hdr' 'svt-av1-hdr-git' 'svt-av1-psy' 'svt-av1-psy-git' 'svt-av1-hdr-riv19')
source=('svt-av1-hdr::git+https://github.com/juliobbv-p/svt-av1-hdr.git'
        'PGO.mkv.0::https://web.archive.org/web/20260726164329if_/https://raw.githubusercontent.com/Akatmks/build-svt-av1/FoodMarket2/PGO.mkv.0'
        'PGO.mkv.1::https://web.archive.org/web/20260726164637if_/https://raw.githubusercontent.com/Akatmks/build-svt-av1/FoodMarket2/PGO.mkv.1'
        'PGO.mkv.2::https://web.archive.org/web/20260726164551if_/https://raw.githubusercontent.com/Akatmks/build-svt-av1/FoodMarket2/PGO.mkv.2')
sha256sums=('SKIP'
            '0cee120d240e1e67763ec2aae218f0c0d1de1e651cf7ecf5810505c772a05bdd'
            '71ea528d053be3385396e53acfd928c5b0becbbe699585a4a6e76d861e68c61b'
            'd6e81d8a702dc91821741a27f93d1232f847387254aeaac87e084425cfa48b64')

_pgo=1
_pgo_clip_seconds=20
_pgo_train_params=(--rc 1 --tbr 8000 --tune 5 --preset 2 --film-grain 12)
_pgo_runs=5

pkgver() {
    git -C svt-av1-hdr describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

_cmake_common=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_AVX512=ON
    -DNATIVE=ON
    -DBUILD_SHARED_LIBS=ON
    -DSVT_AV1_LTO=ON
    -DLIBDOVI_FOUND=1
    -DLIBHDR10PLUS_RS_FOUND=1
)

build() {
    export LDFLAGS+=' -Wl,-z,noexecstack'
    local _pgo_dir="$srcdir/pgo"

    if [ "$_pgo" != 1 ]; then
        cmake -B build -S svt-av1-hdr -DCMAKE_BUILD_TYPE=Release "${_cmake_common[@]}"
        make -C build
        return
    fi

    export CC=clang CXX=clang++

    cmake -B build-pgo -S svt-av1-hdr -DCMAKE_BUILD_TYPE=Release "${_cmake_common[@]}" \
        -DCMAKE_C_FLAGS_RELEASE="-fprofile-generate=$_pgo_dir -ftemporal-profile" \
        -DCMAKE_CXX_FLAGS_RELEASE="-fprofile-generate=$_pgo_dir -ftemporal-profile" \
        -DCMAKE_EXE_LINKER_FLAGS_RELEASE="-fprofile-generate=$_pgo_dir" \
        -DCMAKE_SHARED_LINKER_FLAGS_RELEASE="-fprofile-generate=$_pgo_dir"
    make -C build-pgo

    rm -rf "$_pgo_dir"; mkdir -p "$_pgo_dir"
    cat "$srcdir"/PGO.mkv.0 "$srcdir"/PGO.mkv.1 "$srcdir"/PGO.mkv.2 > "$_pgo_dir/PGO.mkv"
    ffmpeg -y -i "$_pgo_dir/PGO.mkv" -t "$_pgo_clip_seconds" -strict -1 \
        -f yuv4mpegpipe -pix_fmt yuv420p10le "$_pgo_dir/PGO.y4m"
    rm -f "$_pgo_dir/PGO.mkv"

    local _bin="svt-av1-hdr/Bin/Release/SvtAv1EncApp"
    local _libdir="svt-av1-hdr/Bin/Release"
    for i in $(seq 1 "$_pgo_runs"); do
        LLVM_PROFILE_FILE="$_pgo_dir/%p_%m.profraw" LD_LIBRARY_PATH="$_libdir" \
            "$_bin" -i "$_pgo_dir/PGO.y4m" -b /dev/null "${_pgo_train_params[@]}" \
            --pass 1 --stats "$_pgo_dir/stats.log"
        LLVM_PROFILE_FILE="$_pgo_dir/%p_%m.profraw" LD_LIBRARY_PATH="$_libdir" \
            "$_bin" -i "$_pgo_dir/PGO.y4m" -b /dev/null "${_pgo_train_params[@]}" \
            --pass 2 --stats "$_pgo_dir/stats.log"
    done
    llvm-profdata merge -o "$_pgo_dir/default.profdata" "$_pgo_dir"/*.profraw

    rm -rf build-pgo build
    cmake -B build -S svt-av1-hdr -DCMAKE_BUILD_TYPE=Release "${_cmake_common[@]}" \
        -DCMAKE_C_FLAGS_RELEASE="-fprofile-use=$_pgo_dir/default.profdata" \
        -DCMAKE_CXX_FLAGS_RELEASE="-fprofile-use=$_pgo_dir/default.profdata"
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 svt-av1-hdr/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
