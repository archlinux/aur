# Maintainer: Ryan Greenup <ryan.greenup@protonmail.com>

pkgname=cadmus-notes
pkgver=0.2
pkgrel=1
pkgdesc="A simple command line notebook for everybody"
arch=('x86_64')
url="ryangreenup.github.io/cadmus"
license=('GPL3')
provides=('cadmus')
depends=(
    recoll
    tmsu
    ripgrep
    fd
    nodejs
    bat
    coreutils
    sed
    grep
    jq
    pandoc
    ranger
    recode
    sd
    skim
    xclip
    iproute2
)
## These aren't in the official repos and could have
## been installed with cargo
optdepends=('nodejs-markserv: Preview Support'
            'tectonic: Additional option for PDF Export'
            'mdcat: Pretty Print'
            ## These are just optional
            'texlive-core: PDF Export'
            'wl-clipboard: Clipboard for Wayland')

source=("git+https://github.com/RyanGreenup/cadmus.git")
# source=("git+https://github.com/RyanGreenup/cadmus.git#branch=makepkg")
 sha256sums=('SKIP')

package() {
################################################################################
# If I wanted to actually install it by splitting up the binaries and resources
################################################################################

#  install -Dm755 "$srcdir/cadmus/bin/*" -t "${pkgdir}/usr/bin/"
#  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
# install -d "${srcdir}/cadmus/" -Dt "${pkgdir}/$HOME/.cadmus"

################################################################################
# Using the portable philosphy that I've previously settled on
################################################################################

 mkdir -p "${pkgdir}/$HOME/.cadmus";
 mkdir -p "${pkgdir}/$HOME/.local/bin"
 rsync -av ${srcdir}/cadmus/* "${pkgdir}/$HOME/.cadmus/"
 ln -rsf "${pkgdir}/$HOME/.cadmus/bin/cadmus" "${pkgdir}/$HOME/.local/bin"

chmod 700 "${pkgdir}/$HOME"
chmod 755 "${pkgdir}/$HOME/.cadmus"
chmod 700 "${pkgdir}/$HOME/.local"

################################################################################
# Not all dependencies are fatal, maybe just a warning would be kinder?
# Also this is kind of a failsafe because I can also test the binary
# Name rather than look for the package which could be installed
# npm/cargo/pip/conda etc...
################################################################################

check_for_dependencies () {

    depLog="$(mktemp)"

    for i in ${depArray[@]}; do
        command -v "$i" >/dev/null 2>&1 || { echo $i >> "${depLog}"; }
    done

    if [[ $(cat "${depLog}") == "" ]]; then
        echo -e "\nAll Dependencies Satisfied\n"
    else
        echo -e "\e[1;31m \nThe Following Dependencies are Recommended \e[0m \n"
        echo -e "    \e[1;31m --------------------------------------\e[0m "
        echo -e "\e[1;32m \n"
        addBullets "$(cat "${depLog}")"
        echo -e "\e[0m \n"
        echo -e "They are listed in \e[1;34m "${depLog}" \e[0m \n"
    fi

    echo "Press any key to continue"
    read -d '' -s -n1


}

declare -a depArray=(
                        "highlight"
                        "node"
                        "nvim"
                        "fzf"
                        "code"
                        "sk"
                        "rg"
                        "perl"
                        "tectonic"
                        "stow"
                        "python"
                        "tmsu"
                        "ranger"
                        "mdcat"
                        "jq"
                        "shift"
                        "xclip"
                        "sd"
                        "fd"
                        "sed"
                        "cut"
                        "grep"
                        "find"
                        "realpath"
                        "tectonic"
                        "texlive-core"
                        "jq"
                        "recoll"
                       )

addBullets() {
    command -v sed    >/dev/null 2>&1 || { echo >&2 "I require sed but it's not installed.  Aborting."; exit 1; }
    echo "$1" | sed 's/^/\t‣\ /g'
}

# check_for_dependencies



# TODO hmm, the config file would probably have to go in ~/.config/cadmus/config.json for this to work well.
# TODO Need to fix file system permissions error
# TODO I need to have a centralised list of dependencies, currently they are listed in:
#
#    1. README
#    1. Install.sh
#    1. This MakePkg
#        1. up in the depends Array
#        1. here in the depArray warning
# TODO Should I be installing everything to ~/.cadmus or should I throw all the scripts into /usr/bin?
#
#
# PROS; the portability is convenient and motivates users to look at the scripts
#         and investigate them
# PROS; the portability means I don't have to package for other distros
#
# CONS; maybe having the individual scripts in /usr/bin would be simpler to install
# CONS; maybe having the individual scripts in PATH would be better for users
#
}




# Could I make building TMSU a part of the pkg build or should I leave that seperate???

# If I wanted to search for packages that contain a binary (say ip) i could do:

#sudo pacman -Fy
#sudo pacman -F ip
