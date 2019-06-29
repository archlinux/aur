# Maintainer: serkho <sergey.khorev@gmail.com>

pkgname=gvim-hg
pkgver=20190629
pkgrel=1
pkgdesc="Vi Improved, a highly configurable, improved version of the vi text editor with GTK2 GUI, no interpreters embedded"
arch=('i686' 'x86_64')
url="http://www.vim.org/"
license=('custom:vim')
groups=('editors')
provides=('vim' 'gvim')
makedepends=('mercurial')
depends=('gtk2')
source=('gvim.desktop')
md5sums=('6e11c556ba3f2ce7dc05d9908188d604')
conflicts=('vim' 'gvim' 'vim-runtime' 'vim-minimal')

_hgroot="https://bitbucket.org/vim-mirror/vim"
_hgrepo="vim"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build/src"

  ./configure --prefix=/usr \
              --with-features=big \
              --enable-gui=gtk2 \
              --enable-multibyte \
              --with-ex-name=ex-vim \
              --with-view-name=view-vim
  make
}

package(){
  mkdir -p $pkgdir/usr/share/applications
  cp gvim.desktop $pkgdir/usr/share/applications

  cd "$srcdir/$_hgrepo-build/src"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
