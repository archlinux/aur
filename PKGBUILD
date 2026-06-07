# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=st-tabbed-aegix-git
_pkgname=tabbed
pkgver=r1.0000000
pkgrel=1
pkgdesc="Aegix Linux's tabbed (suckless) build: tmux-style Ctrl+b keybinds, ARGB transparency, pywal theming via X resources, and sticky tab naming. Ships the stt launcher (st in tabs)."
arch=('x86_64')
url="https://github.com/aegixlinux/tabbed"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2' 'fontconfig' 'st')
makedepends=('git')
optdepends=('st-aegix-git: transparent, pywal-themed terminals (recommended st over stock)'
            'dmenu: tab rename prompt (Ctrl+b ,)'
            'xorg-xprop: backs the tab rename prompt'
            'picom: compositor required for terminal transparency')
provides=('tabbed')
conflicts=('tabbed')
source=("$_pkgname::git+https://github.com/AegixLinux/tabbed.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    # config.h is generated from our customized config.def.h on first build
    make PREFIX=/usr
}

package() {
    cd "$_pkgname"
    # installs tabbed + xembed binaries, README, and man pages
    make PREFIX=/usr DESTDIR="$pkgdir" install
    # the st-in-tabs launcher (not installed by tabbed's Makefile)
    install -Dm755 stt "$pkgdir/usr/bin/stt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
