# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Carl Reinke <mindless2112 gmail com>

pkgname=lix
pkgver=0.9.23
pkgrel=1
changelog=.CHANGELOG
source=("${pkgname}::git+https://github.com/SimonN/LixD.git#tag=v${pkgver}")
sha512sums=('SKIP')

_pkgname=${pkgname}
# template start; name=lix; version=1.3;
pkgdesc="An action-puzzle game inspired by Lemmings"
arch=('i686' 'x86_64')
url="http://www.lixgame.com/"
license=('custom:CC0')
depends=('allegro' 'enet' 'hicolor-icon-theme')
makedepends=('git' 'dmd' 'dub')
_dubv=(	"4.0.4+5.2.0"   # allegro
        "0.7.1"         # bolts
        "4.1.0"         # derelict-enet
        "3.0.0-beta.2"  # derelict-util
        "0.4.2"         # enumap
        "1.2.2"         # libinputvisitor
        "0.6.3"         # optional
        "0.10.4"        # sdlang-d
        "0.8.0"         # silly
        "0.10.12"       # taggedalgebraic
        "0.7.52"        # unit-threaded
        )


# let makepkg handle dub packages
# https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules
source+=(   "${_pkgname}-music-1.zip::http://www.lixgame.com/dow/lix-music.zip"
            "${_pkgname}.desktop"
            )
sha512sums+=(   '37349c98b739ea43c25137dd03865f1c9c41eec91e5edc109afd9d50ce3871bd0c7f63c3f3599a47bb4ef52f5bfd14e034010de0ac2aec5a9c0c83eaf0b89425'
                '375b1439d9398371a3f58a92bfc0901b86bd89140aae431c7d9405bd2fb36ebcdb22b2686fea72d88b23a4ab94b138b4d742d8fd2965d8ec0542d2f8f64ed0c2'
                )
source+=(   "allegro::git+https://github.com/SiegeLord/DAllegro5.git#tag=v${_dubv[0]}"
            "bolts::git+https://github.com/aliak00/bolts.git#tag=v${_dubv[1]}"
            "derelict-enet::git+https://github.com/DerelictOrg/DerelictENet.git#tag=v${_dubv[2]}"
            "derelict-util::git+https://github.com/DerelictOrg/DerelictUtil.git#tag=v${_dubv[3]}"
            "enumap::git+https://github.com/rcorre/enumap.git#tag=v${_dubv[4]}"
            "libinputvisitor::git+https://github.com/Abscissa/libInputVisitor.git#tag=v${_dubv[5]}"
            "optional::git+https://github.com/aliak00/optional.git#tag=v${_dubv[6]}"
            "sdlang-d::git+https://github.com/Abscissa/SDLang-D.git#tag=v${_dubv[7]}"
            "silly::git+https://github.com/ohdatboi/silly.git#tag=v${_dubv[8]}"
            "taggedalgebraic::git+https://github.com/s-ludwig/taggedalgebraic.git#tag=v${_dubv[9]}"
            "unit-threaded::git+https://github.com/atilaneves/unit-threaded.git#tag=v${_dubv[10]}"
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

build()
{
    cd "${srcdir}/${_pkgname}" || exit
    _r=0

    # add local dependencies to search path
    dub add-path "${srcdir}"

    # force FHS compatibility with '-b releaseXDG'
    # ensure with --cache=local dub stays outside the users home directory
    dub build -f -b releaseXDG --cache=local || _r="${?}"

    # remove local dependencies from search path so dub won't find them
    # later again
    dub remove-path "${srcdir}"

    # removes any cached metadata like the list of available packages
    # and their latest version
    dub clean-caches

    if [[ "${_r}" != 0 ]]
    then
        # dub failed so we also fail after we removed the local dependencies
        return "${_r}"
    fi
}

check()
{
    cd "${srcdir}/${_pkgname}" || exit
    _r=0

    # add local dependencies to search path
    dub add-path "${srcdir}"

    # run test suite
    # ensure with --cache=local dub stays outside the users home directory
    dub test --cache=local || _r="${?}"

    # remove local dependencies from search path so dub won't find them
    # later again
    dub remove-path "${srcdir}"

    # removes any cached metadata like the list of available packages
    # and their latest version
    dub clean-caches

    if [[ "${_r}" != 0 ]]
    then
        # dub failed so we also fail after we removed the local dependencies
        return "${_r}"
    fi
}

package()
{
    cd "${srcdir}" || exit

    # install application entry
    install -Dm644 \
        `# SRCFILE:` \
            "${_pkgname}.desktop" \
        `# DSTFILE:` \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}" || exit

    # install application entry icon
    install -Dm644 \
        `# SRCFILE:` \
            "data/images/${_pkgname}_logo.svg" \
        `# DSTFILE:` \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    # install license text
    install -Dm644 \
        `# SRCFILE:` \
            "doc/copying.txt" \
        `# DSTFILE:` \
            "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

    # install man page
    install -Dm644 \
        `# SRCFILE:` \
            "doc/lix.6" \
        `# DSTFILE:` \
            "${pkgdir}/usr/share/man/man6/lix.6.gz"

    # install binary
    install -Dm755 \
        `# SRCFILE:` \
            "bin/${_pkgname}" \
        `# DSTFILE:` \
            "${pkgdir}/usr/bin/${_pkgname}"

    # remove unimportant files
    # https://raw.githubusercontent.com/SimonN/LixD/master/doc/build/package.txt
    rm -r "${srcdir}/${_pkgname}/doc/build"

    # https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
    # make directories
    mkdir -p \
        "${pkgdir}/usr/share/${_pkgname}" \
        "${pkgdir}/usr/share/doc/${_pkgname}"

    # copy documentary
    cp -dpr --no-preserve=ownership \
        `# SRCFILES:` \
            "doc/." \
        `# DSTDIR:` \
            "${pkgdir}/usr/share/doc/${_pkgname}/"

    # copy game files
    cp -dpr --no-preserve=ownership \
        `# SRCDIRS:` \
            "data" \
            "images" \
            "levels" \
            "${srcdir}/music" \
        `# DSTDIR:` \
            "${pkgdir}/usr/share/${_pkgname}"
}
# template end;
