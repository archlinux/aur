# Maintainer: xander-lin

pkgname=fcitx5-ainput-git
_pkgname=fcitx5-ainput
# Placeholder only — makepkg needs a non-empty pkgver before it downloads the
# VCS source, and AUR/paru display whatever sits here (they cannot run
# pkgver()). Keep it at the current real version so the AUR listing is not
# stale; the authoritative version is computed from git history by pkgver()
# below at build time. Bump this + regenerate .SRCINFO before pushing to AUR.
pkgver=0.1.0.r186.3614a20
pkgrel=1
pkgdesc="Voice input addon for fcitx5: push-to-talk ASR via CapsLock"
# Both are first-class: nothing in the addon is architecture specific (the
# Rust core uses no intrinsics and the C++ shell is plain fcitx5 glue). The
# dependency set must exist in Arch Linux ARM before claiming aarch64.
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/ainput"
license=('MIT')
depends=('fcitx5' 'libebur128' 'libpulse' 'curl' 'speexdsp' 'libsoxr')
makedepends=('git' 'meson' 'ninja' 'cargo')
install=PKGBUILD.install
source=("$_pkgname::git+https://gitee.com/xander-lin/ainput.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/$_pkgname/README.zh-CN.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
