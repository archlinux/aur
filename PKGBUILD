# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

_neovim="n"
###########################################################################################################

_name='deoplete-jedi'
pkgname="${_name}-git"
pkgver=r328.73c1187
pkgrel=1
pkgdesc="jedi add-on for deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/zchee/deoplete-jedi"
license=('MIT')
groups=()
depends=('deoplete')
makedepends=('git') 
provides=('deoplete-jedi')
conflicts=('deoplete-jedi')
replaces=()
backup=()
options=()
source=(
'git+https://github.com/zchee/deoplete-jedi'              # deopletejedi
'git+https://github.com/davidhalter/jedi.git'             # jedi
'git+https://github.com/davidhalter/parso.git'            # parso
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    msg2 'Setting up Git submodules...'

    deopletejedi=("jedi" "parso")
    gitprepare "deoplete-jedi" "rplugin/python3/deoplete/vendored/" "${deopletejedi[@]}"
}

gitprepare() {
    local CD_DIR=$1
    local GIT_PREFIX=$2
    c=0
    for val in "$@" ; do
        if [ $c -gt 1 ]; then
                FEED[$c]=$val
        fi
        c=$(( c + 1 ))
    done

    cd "$srcdir/$CD_DIR" || exit

    git submodule init
    for GITSUBVAR in "${FEED[@]}" ; do
        git config submodule."$GIT_PREFIX$GITSUBVAR".url "$srcdir/$GITSUBVAR"
    done
    git submodule update
    unset -v FEED
}


package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete"
    cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/"{sources,vendored} \
      "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/"
  fi

  if [ "$_vim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete"
    cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/"{sources,vendored} \
      "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/"
  fi

    install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
    install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
