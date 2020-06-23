# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
# seems to work for both vim or neovim if you install for vim,
# but doesn't work for vim if you only install for neovim
_vim="y"
_use_system_jedi="y"
_neovim="n"
###########################################################################################################

_name='deoplete-jedi'
pkgname="${_name}-git"
pkgver=r385.9ad4cba
pkgrel=1
pkgdesc="jedi add-on for deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/deoplete-plugins/deoplete-jedi"
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
'git+https://github.com/deoplete-plugins/deoplete-jedi'              # deopletejedi
)
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

if [[ "$_use_system_jedi" == "y" ]]; then
  depends+=('python-jedi' 'python-parso' 'python-numpydoc')
fi

if [[ "$_use_system_jedi" == "n" ]]; then
  source+=('git+https://github.com/davidhalter/jedi.git')             # jedi
  source+=('git+https://github.com/davidhalter/typeshed.git')             # jedi
  source+=('git+https://github.com/davidhalter/parso.git')            # parso
  md5sums+=('SKIP' 'SKIP' 'SKIP')
fi

prepare() {
    msg2 'Setting up Git submodules...'

    deopletejedi=("jedi" "parso")
    deopletejeditypeshed=("typeshed")

    if [[ "$_use_system_jedi" == "n" ]]; then
      gitprepare "deoplete-jedi" "rplugin/python3/deoplete/vendored/" "${deopletejedi[@]}"
      gitprepare "deoplete-jedi/rplugin/python3/deoplete/vendored/jedi" "jedi/third_party/" "${deopletejeditypeshed[@]}"
    fi
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
    if [[ "$_use_system_jedi" == "n" ]]; then
      mkdir -p "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/vendored/jedi"
      mkdir -p "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/vendored/parso"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/parso/parso" \
        "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/vendored/parso/"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/jedi/jedi" \
        "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/vendored/jedi/"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/jedi/jedi/third_party/typeshed"{stdlib,third_party} \
        "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/vendored/jedi/jedi/third_party/typeshed/"
    fi
    if [[ "$_use_system_jedi" == "y" ]]; then
      mkdir -p "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete"
    fi
    cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/sources" \
      "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/"
  fi

  if [ "$_vim" = "y" ]; then
    if [[ "$_use_system_jedi" == "n" ]]; then
      mkdir -p "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/vendored/jedi"
      mkdir -p "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/vendored/parso"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/parso/parso" \
        "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/vendored/parso/"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/jedi/jedi" \
        "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/vendored/jedi/"
      cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/vendored/jedi/jedi/third_party/typeshed/"{stdlib,third_party} \
        "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/vendored/jedi/jedi/third_party/typeshed/"
    fi
    if [[ "$_use_system_jedi" == "y" ]]; then
      mkdir -p "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete"
    fi
    cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/sources" \
      "$pkgdir/usr/share/vim/vimfiles/rplugin/python3/deoplete/"
  fi

    install -D -m644 "${srcdir}/${_name}/README.md" "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -D -m644 "${srcdir}/${_name}/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
