# Maintainer: Kirill Tikhomirov <kirill2980440@gmail.com>
pkgname=libretro-ffmpeg-git
pkgver=r65594.072d953b01
pkgrel=1
pkgdesc="FFmpeg core for libretro/RetroArch"
arch=('x86_64')
url="https://github.com/libretro/RetroArch/tree/master/cores/libretro-ffmpeg"
license=('GPL-3.0')
groups=('libretro')
depends=('ffmpeg')
makedepends=('git')
provides=('libretro-ffmpeg')
conflicts=('libretro-ffmpeg')
source=("RetroArch::git+https://github.com/libretro/RetroArch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/RetroArch"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/RetroArch"
    git config core.sparseCheckout true
    cat > .git/info/sparse-checkout << 'EOF'
cores/libretro-ffmpeg/*
libretro-common/*
deps/*
EOF
    git read-tree -m -u HEAD
}

build() {
    cd "$srcdir/RetroArch/cores/libretro-ffmpeg"
    make
}

package() {
    install -Dm644 "$srcdir/RetroArch/cores/libretro-ffmpeg/ffmpeg_libretro.so" "$pkgdir/usr/lib/libretro/ffmpeg_libretro.so"
}
