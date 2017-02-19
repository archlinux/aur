# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Interpreters are handled by value "dynamic" of configure options
# '--enable-<language>interp' and can thus be chosen at runtime by installing appropriate
# packages. Counterpart of Vim packages '-python3' no longer needed, IMHO.

_pkgname=vim
pkgname=$_pkgname-runtime-git
pkgver=8.0.0342
pkgrel=1
pkgdesc="Vim the editor. Components used by vim-minimal-git and gvim-git."
arch=("i686" "x86_64")
url="http://www.vim.org"
license=("custom:vim")
makedepends=("git" "gtk2" "lua" "python" "python2" "ruby")
depends=("gpm" "gawk")
provides=("vim-runtime")
conflicts=("vim-runtime")
source=("git+https://github.com/vim/vim.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {

    # set global configuration files to /etc/[g]vimrc
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' $_pkgname/src/feature.h

}

build() {

    cd $_pkgname
    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=no \
      --with-features=huge \
      --enable-cscope \
      --enable-multibyte \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic
    make
}

package() {

    # actual installation
    cd $_pkgname
    make DESTDIR=$pkgdir install

    # remove components provided by vim-minimal-git and gvim-git
    cd $pkgdir
    rm -R usr/bin usr/share/{applications,man}

    # add license
    install -D -m644 $srcdir/$_pkgname/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
