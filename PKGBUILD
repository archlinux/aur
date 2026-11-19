# Prebuilt multi-arch AUR PKGBUILD template for Koma.
# shellcheck shell=bash
pkgname=koma-bin
pkgver='0.0.5'
pkgrel=1
pkgdesc='Wayland tiling compositor with explicit desktop automation interfaces (prebuilt release binaries)'
arch=('x86_64' 'aarch64')
url='https://komawm.org'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libdrm' 'libinput' 'libxkbcommon' 'mesa' 'seatd' 'systemd-libs' 'libglvnd' 'wayland')
optdepends=('xwayland-satellite: X11 client support' 'xdg-desktop-portal-gnome: screencast and file portals' 'polkit: VT switching under systemd-logind without seatd' 'jiku: optional desktop orchestration companion daemon')
provides=('koma')
conflicts=('koma')
options=('!debug' '!strip')
source_x86_64=("koma-${pkgver}-x86_64.tar.zst::https://cdn.komawm.org/releases/koma/v0.0.5/koma-${pkgver}-x86_64-unknown-linux-gnu.tar.zst")
source_aarch64=("koma-${pkgver}-aarch64.tar.zst::https://cdn.komawm.org/releases/koma/v0.0.5/koma-${pkgver}-aarch64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('33ddea9110e61bce7ac28c2d3fecd701b335e4a6f57a7e338bba6717198f49b7')
sha256sums_aarch64=('dee805f0bc24be253bb46b476097420fcae4cf1de3b488dc8ec7c435fb540b83')

package() {
    cd "koma-${pkgver}-${CARCH}-unknown-linux-gnu" || return 1
    install -Dm755 bin/koma "$pkgdir/usr/bin/koma"
    install -Dm755 bin/komactl "$pkgdir/usr/bin/komactl"
    install -Dm755 bin/koma-overview "$pkgdir/usr/bin/koma-overview"
    install -Dm755 resources/koma-session "$pkgdir/usr/bin/koma-session"
    install -Dm644 resources/koma.desktop "$pkgdir/usr/share/wayland-sessions/koma.desktop"
    install -Dm644 resources/koma.service "$pkgdir/usr/lib/systemd/user/koma.service"
    install -Dm644 resources/koma-shutdown.target "$pkgdir/usr/lib/systemd/user/koma-shutdown.target"
    install -Dm644 resources/koma-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/koma-portals.conf"
    install -Dm644 resources/greetd-config.toml "$pkgdir/usr/share/doc/koma/examples/greetd-config.toml"
    install -Dm644 examples/init.lua "$pkgdir/usr/share/doc/koma/examples/init.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/koma/LICENSE"
    if [[ -d completions ]]; then
        install -d "$pkgdir/usr/share/bash-completion/completions" \
            "$pkgdir/usr/share/zsh/site-functions" \
            "$pkgdir/usr/share/fish/vendor_completions.d"
        install -Dm644 completions/koma.bash "$pkgdir/usr/share/bash-completion/completions/koma"
        install -Dm644 completions/koma.zsh "$pkgdir/usr/share/zsh/site-functions/_koma"
        install -Dm644 completions/koma.fish "$pkgdir/usr/share/fish/vendor_completions.d/koma.fish"
        install -Dm644 completions/komactl.bash "$pkgdir/usr/share/bash-completion/completions/komactl"
        install -Dm644 completions/komactl.zsh "$pkgdir/usr/share/zsh/site-functions/_komactl"
        install -Dm644 completions/komactl.fish "$pkgdir/usr/share/fish/vendor_completions.d/komactl.fish"
    fi
}
