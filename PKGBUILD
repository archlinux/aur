# Maintainer: xander-lin

pkgname=fcitx5-vinput-git
_pkgname=fcitx5-vinput
# Placeholder only — makepkg needs a non-empty pkgver before it downloads the
# VCS source, and AUR/paru display whatever sits here (they cannot run
# pkgver()). Keep it at the current real version so the AUR listing is not
# stale; the authoritative version is computed from git history by pkgver()
# below at build time. Bump this + regenerate .SRCINFO before pushing to AUR.
pkgver=0.1.0.r151.f6ecc4b
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
source=("$_pkgname::git+https://gitee.com/xander-lin/vinput.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup build --prefix=/usr --buildtype=plain -Dcpp_args='-O2 -march=native'
    meson compile -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    # No /etc layer: defaults live in code, user files are optional and sparse.
    # Shipped examples carry comments and document every field.
    for f in config/*.example; do
        install -Dm644 "$f" "$pkgdir/usr/share/doc/$_pkgname/$f"
    done
}
