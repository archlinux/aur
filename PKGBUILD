pkgname="yin-nvidia-git"
pkgver=0.1.r18.g7c5be49
pkgrel=1
pkgdesc="Lightweight, Hardware accelerated Wayland wallpaper daemon. With Nvidia Support"
arch=("x86_64")
url="https://github.com/saverinonrails/yin"
depends=("ffmpeg" "wayland" "stb")
makedepends=("git" "meson" "ninja" "wayland-protocols" "cuda")
options=('!debug')
conflicts=("yin-git")
source=("git+https://github.com/saverinonrails/yin.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/yin"

    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\(.*\)-\([0-9]*\)-g/\1.r\2.g/' \
        || printf "r%s.g%s\n" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/yin"

    meson setup release -Denable_cuda=true --buildtype=release --wipe
    meson compile -C release
}

package() {
    cd "$srcdir/yin"
    install -Dm755 release/yin "$pkgdir/usr/bin/yin"
    install -Dm755 release/yinctl "$pkgdir/usr/bin/yinctl"
}
