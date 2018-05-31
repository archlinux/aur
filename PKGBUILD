# Maintainer: kaptoxic <kaptoxic [at] yahoo [dot] com>
# Contributor: kaptoxic <kaptoxic [at] yahoo [dot] com>

pkgname=vim-gnome
pkgver=8.1.0022
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with Gnome GUI)'
arch=(i686 x86_64)
license=('custom:vim')
url="http://www.vim.org"
depends=("vim-runtime" 'gpm' 'libxt' 'desktop-file-utils' 'acl')
makedepends=('gpm' 'libxt' 'desktop-file-utils')
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        'gvim.desktop')
sha1sums=('ee363efbe08bb5931a68b8cc446c0c9e1946e4ee'
          '4a579cf66590d711f49c5dfb4a25e5df116ff7ba')
provides=("vim=${pkgver}-${pkgrel}")
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim-python3' 'gvim')
install=gvim.install

# additional dependencies depending on enabled packages
#'mzscheme' 'ruby' 'desktop-file-utils' 'lua' 'python2' 'python'

build() {
  cd vim-$pkgver
  
  # some possible options (others should be taken care of in vim-runtime)
  #--with-features=big
  #--mandir=/usr/share/man
  #--with-global-runtime=/usr/share/vim
  
  # for other packages you can flip disable/enable (if you modify this, modify dependencies as well)
  
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=gnome2 \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --disable-perlinterp \
    --disable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp \
    --disable-mzschemeinterp
   
  # these flags are in the Ubuntu package
  #LDFLAGS="-Wl,-Bsymbolic-functions -Wl,-z,relro" CPPFLAGS="" CFLAGS="-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security"
  make
}

package() {
  cd vim-$pkgver

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
  
  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
  while read _mandir; do
    cd "${_mandir}"
    rm -f ex.1 view.1 # provided by (n)vi
  done
  
  # need to remove since this is provided by vim-runtime
  rm -r "${pkgdir}"/usr/share/vim
  
  # freedesktop links
  install -Dm644 "${srcdir}"/gvim.desktop \
    "${pkgdir}"/usr/share/applications/gvim.desktop
  install -Dm644 runtime/vim48x48.png "${pkgdir}"/usr/share/pixmaps/gvim.png

  # license
  install -Dm644 runtime/doc/uganda.txt \
  "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
