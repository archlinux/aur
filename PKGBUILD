# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Carl Reinke <mindless2112 gmail com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=lix
pkgver=0.10.32
pkgrel=1
pkgdesc="An action-puzzle game inspired by Lemmings"
url="https://www.lixgame.com/"
changelog=.CHANGELOG
license=('custom:CC0')

_gitname=LixD
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/SimonN/LixD/archive/v$pkgver.tar.gz"
        "$pkgname-music-1.1.zip::https://www.lixgame.com/dow/lix-music.zip")
sha512sums=('959dfb27fe0d7c78b4aa4d7da7390d16e5dd4e7ce9ddc67d890efb2f241ffd53e0e957d4be4a6a2d6dd3aefb92fe998c7da547ff83ff92b0f205938c1345ad85'
            '280fd25a479ac8dd24475b014234270a12ab34edca7fb2f7ce4b768259111b1e7626d3ba37ac13d810f0653d23d7c9f212776e94d2c0b31a0de580864771ce9f')

arch=('i686' 'x86_64')
depends=(
    allegro
    d-runtime
    enet
    hicolor-icon-theme
)
makedepends=(
    d-compiler
    dub
    git
    jq
    pkgconf # https://github.com/SimonN/LixD/issues/469#issuecomment-2174416422
)

prepare() {
    cd "$_gitname-$pkgver" || exit 1

    # Iterate through the required packages and versions to fetch them in advance
    # Read from dub.selections.json and print them as "package@version"
    for line in $(jq -r '.versions | keys[] as $k | "\($k)@\(.[$k])"' <dub.selections.json); do
        # Fetch each package at the required version
        # Expected format is: package@version
        dub fetch --cache=local "$line"
    done
}

_build() {
    # 2022.02.26
    # 15:22 <@SimonN> It's possible that it's already enough to raise the stack size in the current shell: ulimit -s 16384
    # 15:22 <@SimonN> See also: https://github.com/ldc-developers/ldc/issues/3913
    # 15:26 <@SimonN> Yes, very high chance that the following will fix/workaround: Execute "ulimit -s 16384" in the same shell that will then run dub. I.e., we double the stack size, assuming "ulimit -s" printed 8192 before; it does that for me in new shells.
    ulimit -s 16384

    dub "$@" \
        `# Do not resolve missing dependencies before building` \
            --nodeps \
        `# Ensure dub stays outside the users home directory` \
            --cache=local \
        `# Runs multiple compiler instances in parallel, if possible` \
            --parallel \
        `# Forces a recompilation even if the target is up to date` \
            --force \
        `# Force FHS compatibility` \
            --build=releaseXDG
}

build() {
    cd "$_gitname-$pkgver" || exit 1
    _build build
}

check() {
    cd "$_gitname-$pkgver" || exit 1
    _build test
}

package() {
    cd "$_gitname-$pkgver" || exit 1

    # install application entry
    install -Dm644 \
        `# SRCFILE:` \
            "data/desktop/com.lixgame.Lix.desktop" \
        `# DSTFILE:` \
            "$pkgdir/usr/share/applications/$pkgname.desktop"

    # install application entry icon
    install -Dm644 \
        `# SRCFILE:` \
            "data/images/${pkgname}_logo.svg" \
        `# DSTFILE:` \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # install license text
    install -Dm644 \
        `# SRCFILE:` \
            "doc/copying.txt" \
        `# DSTFILE:` \
            "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    # install man page
    install -Dm644 \
        `# SRCFILE:` \
            "doc/lix.6" \
        `# DSTFILE:` \
            "$pkgdir/usr/share/man/man6/lix.6"

    # install binary
    install -Dm755 \
        `# SRCFILE:` \
            "bin/$pkgname" \
        `# DSTFILE:` \
            "$pkgdir/usr/bin/$pkgname"

    # remove unimportant files
    # https://raw.githubusercontent.com/SimonN/LixD/master/doc/build/package.txt
    rm -r "doc/build"

    # https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
    # make directories
    mkdir -p \
        "$pkgdir/usr/share/$pkgname" \
        "$pkgdir/usr/share/doc/$pkgname"

    # copy documentary
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "doc/." \
        `# DSTDIR:` \
            "$pkgdir/usr/share/doc/$pkgname/"

    # copy game files
    cp -dpr --no-preserve=ownership \
        `# SRCDIRS:` \
            "data" \
            "images" \
            "levels" \
            "$srcdir/music" \
        `# DSTDIR:` \
            "$pkgdir/usr/share/$pkgname"
}
