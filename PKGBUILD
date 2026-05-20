# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: robertfoster

pkgname=stable-diffusion.cpp-git
_name=${pkgname%-git}
pkgver=r633.5b0267e
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++"
arch=('aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
depends=(
    'openblas'
    'libwebp'
)
makedepends=(
    'cmake'
    'pnpm' # frontend
    'ninja'
    'git'
)
conflicts=("$_name")
provides=("$_name")
source=("$_name::git+https://github.com/leejet/stable-diffusion.cpp.git"
        'git+https://github.com/ggml-org/ggml.git'
        'git+https://github.com/leejet/sdcpp-webui.git'
        'git+https://github.com/webmproject/libwebm.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_name"
    git submodule init
    git config submodule.ggml.url "$srcdir/ggml"
    git config submodule.examples/server/frontend.url "$srcdir/sdcpp-webui"
    git config submodule.thirdparty/libwebm.url "$srcdir/libwebm"
    git config submodule.thirdparty/libwebp.update none

    git -c protocol.file.allow=always submodule update
}

build() {
    cmake \
        -G Ninja \
        -B build \
        -S "$_name" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DSD_BUILD_SHARED_LIBS=ON \
        -DSD_BUILD_SHARED_GGML_LIB=OFF \
        -DSD_USE_SYSTEM_WEBP=ON \
        -DSD_USE_SYSTEM_WEBM=OFF \
        -DGGML_BLAS=ON \
        -DGGML_BLAS_VENDOR=OpenBLAS
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install/local examples/install

    install -Dm644 "$srcdir/$_name/LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname"
}
