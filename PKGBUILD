# Maintainer: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Hossein Bakhtiarifar <abakh@tuta.io>
# Discussion: https://www.reddit.com/r/linux/comments/b8y7rp/i_have_made_a_bunch_of_fancy_terminal_games_more/
pkgname=nbsdgames-git
pkgver=2.0.r21.g6e19132_score_patch
pkgrel=1
pkgdesc="A collection of curses-based console games"
arch=('x86_64' 'i686')
url="https://github.com/untakenstupidnick/nbsdgames"
license=('custom')
depends=('ncurses')
makedepends=('git' 'make')
provides=('nbsdgames')
conflicts=('nbsdgames')
install=nbsdgames-git.install
source=("git+https://github.com/untakenstupidnick/nbsdgames.git")
md5sums=('SKIP')


prepare() {
    # Configure games to store scores in ~/.local/games/nbsdgames
    # (more appropriate for single-user systems) and save a message about it
    savedir="$HOME/.local/games/${pkgname%%-git}"

    sed -i "s|/usr/games|${savedir}|" "${pkgname%%-git}/sources/config.h"

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
    cd "${pkgname%%-git}/sources"
    make
}


package() {
    mkdir -p "$pkgdir/usr/share/doc/${pkgname%%-git}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"

    cp score.txt "$pkgdir/usr/share/doc/${pkgname%%-git}"

    cd "${pkgname%%-git}"
    cp README.md "$pkgdir/usr/share/doc/${pkgname%%-git}"
    cp LICENSE "$pkgdir/usr/share/licenses/${pkgname}"

    # Install games as /usr/bin/nbsd_* to avoid conflicts
    mkdir -p "$pkgdir/usr/bin"
    find sources -type f -executable | while read f
    do
        cp "$f" "$pkgdir/usr/bin/nbsd_$(basename "$f")"
    done
}
