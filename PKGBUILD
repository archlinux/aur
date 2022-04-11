# Maintainer: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Hossein Bakhtiarifar <abakh@tuta.io>
# Discussion: https://www.reddit.com/r/linux/comments/b8y7rp/i_have_made_a_bunch_of_fancy_terminal_games_more/
pkgname=nbsdgames-git
pkgver=5.r16.g0fee553_score_patch
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


scores_dir() {
    # Configure games to store scores in ~/.local/games/nbsdgames
    # (more appropriate for single-user systems)
    echo "$HOME/.local/games/${pkgname%%-git}"
}

make_opts() {
    echo GAMES_DIR="$pkgdir/usr/bin" MAN_DIR="$pkgdir/usr/share/man/man6" \
        SCORES_DIR="$(scores_dir)"
}

prepare() {
    # Fix bug in makefile
    sed -i 's|\$(ls man)|$$(ls man)|' "${pkgname%%-git}/Makefile"

    # Save a message about the changes score directory.
    cat > score.txt <<EOF
${pkgname%%-git} was compiled to store scores in $(scores_dir).
You may create the following empty files in this directory:
$(cd ${pkgname%%-git}; make -E 'print: ; @echo $(SCORE_FILES)' print)
EOF
}


pkgver() {
    cd "${pkgname%%-git}"
    printf "%s_score_patch" \
    "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}


package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man6"
    mkdir -p "$pkgdir/usr/share/doc/${pkgname%%-git}"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"

    cp score.txt "$pkgdir/usr/share/doc/${pkgname%%-git}"

    cd "${pkgname%%-git}"
    cp README.md "$pkgdir/usr/share/doc/${pkgname%%-git}"
    cp LICENSE "$pkgdir/usr/share/licenses/${pkgname}"

    make $(make_opts) nbinstall nbmanpages
	install -Dt "$pkgdir/usr/share/applications" nbsdgames.desktop
	install -Dt "$pkgdir/usr/share/pixmaps" nbsdgames.svg
}
