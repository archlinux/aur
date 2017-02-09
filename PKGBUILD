# $Id: PKGBUILD 263841 2016-04-03 20:40:11Z anatolik $
# Maintainer: mesmer <mesmer@fisica.if.uff.br>

pkgname=(vim-clipboard)
pkgver=8.0.0314
_versiondir=74
pkgrel=1
arch=(i686 x86_64)
license=('custom:vim')
url='http://www.vim.org'
makedepends=(gpm python2 python ruby libxt desktop-file-utils gtk2 gtk3 lua gawk tcl)
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim)
sha1sums=('de13aabcc434fd49acc25149f5943555635f3c3c'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

prepare() {
  cd vim-$pkgver/src

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' feature.h

  autoconf

  cd "$srcdir"
  cp -a vim-$pkgver gvim-$pkgver
}

build() {
  cd "${srcdir}"/vim-$pkgver
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-luainterp=dynamic \
    --enable-tclinterp=dynamic
  make

  cd "${srcdir}"/gvim-$pkgver
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=gtk2 \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-luainterp=dynamic \
    --enable-tclinterp=dynamic
  make
}

check() {
  # disable tests because they seem to freeze
  cd "${srcdir}"/vim-$pkgver
  #make test

  cd "${srcdir}"/gvim-$pkgver
  #make test
}

package_vim-runtime() {
  pkgdesc='Runtime for vim and gvim'
  backup=('etc/vimrc')

  cd "${srcdir}"/vim-$pkgver

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
  # man and bin files belong to 'vim'
  rm -r "${pkgdir}"/usr/share/man/ "${pkgdir}"/usr/bin/

  # Don't forget logtalk.dict
  install -Dm644 runtime/ftplugin/logtalk.dict \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/ftplugin/logtalk.dict

  # fix FS#17216
  sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/filetype.vim

  # patch filetype.vim for better handling of pacman related files
  sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/filetype.vim
  sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/ftplugin/changelog.vim

  # rc files
  install -Dm644 "${srcdir}"/vimrc "${pkgdir}"/etc/vimrc
  install -Dm644 "${srcdir}"/archlinux.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/archlinux.vim

  # rgb.txt file
  install -Dm644 runtime/rgb.txt \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/rgb.txt

  # license
  install -dm755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt
}

package_vim-clipboard() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor with +clipboard enabled'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('gvim' 'vim-minimal' 'vim-python3')
  provides=('xxd' 'vim-minimal' 'vim-python3')
  replaces=('vim-python3' 'vim-minimal')

  cd "${srcdir}"/vim-$pkgver
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # license
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

package_gvim() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'libxt' 'desktop-file-utils' 'gtk2')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  provides=("vim=${pkgver}-${pkgrel}" "xxd")
  conflicts=('vim-minimal' 'vim')
  replaces=('gvim-python3')
  install=gvim.install

  cd "${srcdir}"/gvim-$pkgver
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
  done

  # need to remove since this is provided by vim-runtime
  rm -r "${pkgdir}"/usr/share/vim

  # freedesktop links
  install -Dm644 runtime/gvim.desktop "${pkgdir}"/usr/share/applications/gvim.desktop
  install -Dm644 runtime/vim48x48.png "${pkgdir}"/usr/share/pixmaps/gvim.png

  # license
   install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
