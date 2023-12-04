# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Brett Cornwall <ainola at archlinux dot org>
# Contributor: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon at insmo dot com>
# Contributor: Jon Yamokoski <code at jonyamo dot us>

pkgname=pass-git
pkgver=1.7.4.r12.28cec11
pkgrel=2
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
arch=(any)
url=https://passwordstore.org
license=(GPL2)

provides=(pass passmenu)
conflicts=(pass)
depends=(bash gnupg tree)
makedepends=(git)
checkdepends=(git)
optdepends=(
    'dmenu: for passmenu'
    'dmenu-wayland: for passmenu in Wayland'
    'git: for git support'
    'qrencode: for QR code support'
    'wl-clipboard: for wlroots-based Wayland clipboard support'
    'xclip: for X11 clipboard support'
    'xdotool: to type passwords with passmenu'
    'ydotool: to type passwords with passmenu in Wayland'
)
source=(git+https://git.zx2c4.com/password-store.git)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir"/password-store
    git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

check() {
    unset POSIXLY_CORRECT # remove once patched upstream
    cd "$srcdir"/password-store
    make test
}

package() {
    cd "$srcdir"/password-store
    make DESTDIR="$pkgdir" WITH_ALLCOMP=yes install

    install -Dm755 -t "$pkgdir"/usr/bin contrib/dmenu/passmenu
    install -Dm644 -t "$pkgdir"/usr/share/vim/vimfiles/plugin \
        contrib/vim/redact_pass.vim
    install -Dm644 -t "$pkgdir"/usr/share/licenses/pass COPYING
    install -Dm644 -t "$pkgdir"/usr/share/doc/pass README
}
