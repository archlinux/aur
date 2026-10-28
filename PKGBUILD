# Maintainer: HexRebel (AUR: rebellen) <200467570+HexRebel@users.noreply.github.com>
pkgname=mascot
pkgver=0.7.0
pkgrel=1
pkgdesc="Shimeji-style desktop mascots for Wayland that you can talk to (a chat bubble for local or hosted language models)"
arch=('x86_64')
url="https://github.com/HexRebel/mascot"
license=('GPL-2.0-or-later' 'CC0-1.0' 'LicenseRef-Shimeji')
depends=('wayland' 'libarchive' 'python' 'python-pillow' 'quickshell' 'aichat')
makedepends=('git' 'wayland-protocols' 'uthash')
optdepends=('ollama: local language models'
            'curl: keep a local model loaded while the bubble is open'
            'ttf-nerd-fonts-symbols: the icons in the chat bubble'
            'xdg-utils: mascot prototypes poses opens its page in the browser')
source=("$pkgname::git+https://github.com/HexRebel/mascot.git#tag=v$pkgver"
        "json.h::git+https://github.com/sheredom/json.h.git"
        "qoi::git+https://github.com/phoboslab/qoi.git"
        "py-qoi::git+https://github.com/mathpn/py-qoi.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$pkgname"
    # The submodules from the sources above, at the commits Mascot pins (the KDE plugin is not built)
    git submodule init src/third_party/json.h src/third_party/qoi src/mascotctl/qoi
    git config submodule.src/third_party/json.h.url "$srcdir/json.h"
    git config submodule.src/third_party/qoi.url "$srcdir/qoi"
    git config submodule.src/shimejictl/qoi.url "$srcdir/py-qoi"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 prototypes/Shimeji.Robo/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/Robo-CC0.txt"
    install -Dm644 prototypes/Shimeji.Shimeji/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/Shimeji.txt"
}
