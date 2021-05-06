# Maintainer: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Hossein Bakhtiarifar <abakh@tuta.io>
# Discussion: https://www.reddit.com/r/linux/comments/b8y7rp/i_have_made_a_bunch_of_fancy_terminal_games_more/
pkgname=nbsdgames-git
pkgver=4.1.r0.g0129cb4_score_patch
pkgrel=1
pkgdesc="A collection of curses-based console games"
arch=('x86_64' 'i686')
url="https://github.com/abakh/nbsdgames"
license=('custom')
depends=('ncurses')
makedepends=('git' 'make')
provides=('nbsdgames')
conflicts=('nbsdgames')
install=nbsdgames-git.install
source=("git+https://github.com/abakh/nbsdgames.git")
md5sums=('SKIP')


prepare() {
    # Configure games to store scores in ~/.local/games/nbsdgames
    # (more appropriate for single-user systems) and save a message about it
    savedir="$HOME/.local/games/${pkgname%%-git}"

    sed -i "s|/usr/games|${savedir}|" "${pkgname%%-git}/config.h"

    cat > score.txt <<EOF
${pkgname%%-git} was compiled to store scores in $savedir.
EOF
}


pkgver() {
    cd "${pkgname%%-git}"
    printf "%s_score_patch" \
    "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}


build() {
    cd "${pkgname%%-git}"
    make
}


package() {
    mkdir -p "$pkgdir/usr/share/doc/${pkgname%%-git}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"

    cp score.txt "$pkgdir/usr/share/doc/${pkgname%%-git}"

    cd "${pkgname%%-git}"
    cp README.md "$pkgdir/usr/share/doc/${pkgname%%-git}"
    cp LICENSE "$pkgdir/usr/share/licenses/${pkgname}"

    # Install games as /usr/bin/nb* to avoid conflicts
    mkdir -p "$pkgdir/usr/bin"
    find . -maxdepth 1 -type f -executable | while read f
    do
        cp "$f" "$pkgdir/usr/bin/nb$(basename "$f")"
    done

    # Install manpages /usr/share/man/man6/nb*
    mkdir -p "$pkgdir/usr/share/man/man6"
    cd man
    find . -type f | while read f
    do
        cp "$f" "$pkgdir/usr/share/man/man6/nb$(basename "$f")"
    done
}
