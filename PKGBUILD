# Maintainer: xander-lin

pkgname=fcitx5-vinput-git
_pkgname=fcitx5-vinput
pkgver=0.1.0.r124.9870b71
pkgrel=1
pkgdesc="Voice input addon for fcitx5: push-to-talk ASR via CapsLock"
arch=('x86_64')
url="https://github.com/xander-lin/vinput"
license=('MIT')
depends=('fcitx5' 'libebur128' 'libpulse' 'curl' 'speexdsp' 'libsoxr')
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=PKGBUILD.install
# Primary: Gitee (fast in China). Fallback: change to github.com/xander-lin/vinput
source=("$_pkgname::git+https://gitee.com/xander-lin/vinput.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags 2>/dev/null || printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup build --prefix=/usr --buildtype=plain
    meson compile -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    for f in config/*.json; do
        install -Dm644 "$f" "$pkgdir/usr/share/doc/$_pkgname/$f"
    done
}
