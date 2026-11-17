# Prebuilt multi-arch AUR PKGBUILD template for Jiku.
# shellcheck shell=bash
pkgname=jiku-bin
pkgver='0.0.2'
pkgrel=1
pkgdesc='Desktop orchestration daemon, CLI/MCP controller, and SQLite FTS5 memory companion for Koma (prebuilt release binaries)'
arch=('x86_64' 'aarch64')
url='https://komawm.org/jiku/'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'ca-certificates')
optdepends=('koma: Wayland tiling compositor host' 'libnotify: desktop alert notifications' 'bubblewrap: outer filesystem sandbox')
provides=('jiku')
conflicts=('jiku')
options=('!debug' '!strip')
source_x86_64=("jiku-${pkgver}-x86_64.tar.zst::https://cdn.komawm.org/releases/jiku/v0.0.2/jiku-${pkgver}-x86_64-unknown-linux-gnu.tar.zst")
source_aarch64=("jiku-${pkgver}-aarch64.tar.zst::https://cdn.komawm.org/releases/jiku/v0.0.2/jiku-${pkgver}-aarch64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('8abcdb31a59be022470fe9155bc93c62611c45302898f15ba81fa494e2796d60')
sha256sums_aarch64=('7cd5af0c4f06e14141bc8c804c75b48a49f0351c9c1e12983101821b6ecd62aa')

package() {
    cd "jiku-${pkgver}-${CARCH}-unknown-linux-gnu" || return 1
    install -Dm755 bin/jikud "$pkgdir/usr/bin/jikud"
    install -Dm755 bin/jiku "$pkgdir/usr/bin/jiku"
    install -Dm644 resources/jikud.service "$pkgdir/usr/lib/systemd/user/jikud.service"
    install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/jiku/examples/config.toml"
    install -Dm644 examples/init.lua "$pkgdir/usr/share/doc/jiku/examples/init.lua"
    if [[ -d skills ]]; then
        install -d "$pkgdir/usr/share/doc/jiku/skills"
        cp -R skills/. "$pkgdir/usr/share/doc/jiku/skills/"
    fi
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/jiku/LICENSE"
    if [[ -d completions ]]; then
        install -d "$pkgdir/usr/share/bash-completion/completions" \
            "$pkgdir/usr/share/zsh/site-functions" \
            "$pkgdir/usr/share/fish/vendor_completions.d"
        install -Dm644 completions/jiku.bash "$pkgdir/usr/share/bash-completion/completions/jiku"
        install -Dm644 completions/jiku.zsh "$pkgdir/usr/share/zsh/site-functions/_jiku"
        install -Dm644 completions/jiku.fish "$pkgdir/usr/share/fish/vendor_completions.d/jiku.fish"
    fi
}
