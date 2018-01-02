# Maintainer: Trent Palmer trenttdually at gmail
_name='deoplete-jedi'
pkgname="${_name}-git"
pkgver=r224.715acf2
pkgrel=1
pkgdesc="jedi add-on for deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/zchee/deoplete-jedi"
license=('MIT')
groups=()
# python-jedia pulls in python-parso
# perhaps the arch packages can be used instead of
# the git submodules?
depends=('deoplete-git' 'python-jedi' 'python2-jedi')
makedepends=('git') 
provides=('deoplete-jedi')
conflicts=('deoplete-jedi')
replaces=()
backup=()
options=()
source=("${_name}::${url//https/git}")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# hack server.py so it doesn't source jedi and parso submodules
prepare() {
    cd "${srcdir}/${_name}/rplugin/python3/deoplete/sources/deoplete_jedi/"
    sed -i -e 's/vendored//g' server.py
}

package() {
    mkdir -p "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete"
    cp -r "${srcdir}/${_name}/rplugin/python3/deoplete/sources" \
        "$pkgdir/usr/share/nvim/runtime/rplugin/python3/deoplete/"

    install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
    install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
