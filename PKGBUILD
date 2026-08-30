# Maintainer: Yubo Cao <cao2006721@gmail.com>

pkgname=parallel-code-bin
_pkgname='Parallel Code'
pkgver=1.15.0
pkgrel=1
pkgdesc='Dispatch AI coding agents in parallel, each in its own git worktree (Claude Code, Codex, Gemini, ...)'
arch=('x86_64')
url='https://github.com/johannesjo/parallel-code'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('parallel-code')
conflicts=('parallel-code')
options=('!strip' '!debug')
source=("https://github.com/johannesjo/parallel-code/releases/download/v${pkgver}/parallel-code_${pkgver}_amd64.deb")
sha256sums=('b2a38c2c0bc3fea5d00aa13ef766699bfe4bac05a261f0648bd97bc793b5fc82')

package() {
    # The .deb is an `ar` archive containing data.tar.xz; unpack the payload
    # straight into $pkgdir. bsdtar reads the ar member transparently.
    bsdtar -xf "parallel-code_${pkgver}_amd64.deb" -C "$srcdir" data.tar.xz
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    # Provide a launcher on PATH
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/parallel-code" "$pkgdir/usr/bin/parallel-code"

    # Fix permissions (electron sandbox helper needs setuid)
    chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox" 2>/dev/null || true

    # Ship the MIT license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    if [ -f "$pkgdir/opt/$_pkgname/LICENSE.electron.txt" ]; then
        install -Dm644 "$pkgdir/opt/$_pkgname/LICENSE.electron.txt" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    fi
}
