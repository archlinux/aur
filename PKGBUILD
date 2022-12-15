# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Carl Reinke <mindless2112 gmail com>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=lix
pkgver=0.10.2
pkgrel=1
changelog=.CHANGELOG
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/SimonN/LixD/archive/v$pkgver.tar.gz"
        "$pkgname-music-1.zip::http://www.lixgame.com/dow/lix-music.zip")
sha512sums=('f1a36b17861a5f1fac36026e8898892a59ec4043e04b0991770dfbb79cf5bfbf84b0f874c8a4eb1710fe6bd1ee473b30119dc4cd2502b647efeaaa51bf3680d3'
            '37349c98b739ea43c25137dd03865f1c9c41eec91e5edc109afd9d50ce3871bd0c7f63c3f3599a47bb4ef52f5bfd14e034010de0ac2aec5a9c0c83eaf0b89425')

_gitname=LixD
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
depends=('allegro' 'enet' 'hicolor-icon-theme' 'liblphobos')
makedepends=('git' 'ldc' 'dub')
_dubv=( "4.0.4+5.2.0"   # allegro
        "1.3.1"         # bolts
        "4.2.0"         # derelict-enet
        "3.0.0-beta.2"  # derelict-util
        "0.4.2"         # enumap
        "1.2.2"         # libinputvisitor
        "1.3.0"         # optional
        "0.10.6"        # sdlang-d
        "1.0.2"         # silly
        "0.11.22"       # taggedalgebraic
        "0.7.55"        # unit-threaded
        )

# let makepkg handle dub packages
# These have to be git clones, otherwise dub isn't able to pick them up with the correct version later on
# no git, no version field, assumed ~master
# https://dub.pm/commandline.html#add-path
source+=(   "$pkgname-allegro::git+https://github.com/SiegeLord/DAllegro5.git#tag=v${_dubv[0]}"
            "$pkgname-bolts::git+https://github.com/aliak00/bolts.git#tag=v${_dubv[1]}"
            "$pkgname-derelict-enet::git+https://github.com/DerelictOrg/DerelictENet.git#tag=v${_dubv[2]}"
            "$pkgname-derelict-util::git+https://github.com/DerelictOrg/DerelictUtil.git#tag=v${_dubv[3]}"
            "$pkgname-enumap::git+https://github.com/rcorre/enumap.git#tag=v${_dubv[4]}"
            "$pkgname-libinputvisitor::git+https://github.com/Abscissa/libInputVisitor.git#tag=v${_dubv[5]}"
            "$pkgname-optional::git+https://github.com/aliak00/optional.git#tag=v${_dubv[6]}"
            "$pkgname-sdlang-d::git+https://github.com/Abscissa/SDLang-D.git#tag=v${_dubv[7]}"
            "$pkgname-silly::git+https://gitlab.com/AntonMeep/silly.git#tag=v${_dubv[8]}"
            "$pkgname-taggedalgebraic::git+https://github.com/s-ludwig/taggedalgebraic.git#tag=v${_dubv[9]}"
            "$pkgname-unit-threaded::git+https://github.com/atilaneves/unit-threaded.git#tag=v${_dubv[10]}"
            )
sha512sums+=(   'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                'SKIP'
                )

_build() {
    _r=0

    # 2022.02.26
    # 15:22 <@SimonN> It's possible that it's already enough to raise the stack size in the current shell: ulimit -s 16384
    # 15:22 <@SimonN> See also: https://github.com/ldc-developers/ldc/issues/3913
    # 15:26 <@SimonN> Yes, very high chance that the following will fix/workaround: Execute "ulimit -s 16384" in the same shell that will then run dub. I.e., we double the stack size, assuming "ulimit -s" printed 8192 before; it does that for me in new shells.
    ulimit -s 16384

    # add local dependencies to search path
    dub add-path "$srcdir"

    dub "$@" \
        `# ensure dub stays outside the users home directory:` \
            --cache=local \
        `# Runs multiple compiler instances in parallel, if possible:` \
            --parallel \
        `# Forces a recompilation even if the target is up to date:` \
            --force \
        `# Specifies the compiler binary to use:` \
            --compiler=ldc \
        `# force FHS compatibility:` \
            --build=releaseXDG \
        `# Save result code for later when failed:` \
            || _r="$?"

    # remove local dependencies from search path so dub won't find them
    # later again
    dub remove-path "$srcdir"

    # removes any cached metadata like the list of available packages
    # and their latest version
    dub clean-caches

    if [[ "$_r" != 0 ]]; then
        # dub failed so we also fail after we removed the local dependencies
        return "$_r"
    fi
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
