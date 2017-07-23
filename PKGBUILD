# Maintainer: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

pkgbase=vim
pkgname=(vim-clipboard vim-runtime)
pkgver=8.0.0722
_versiondir=80
pkgrel=1
arch=(i686 x86_64)
license=('custom:vim')
url='http://www.vim.org'
makedepends=(gpm python2 python ruby libxt gtk3 lua gawk tcl)
source=(vim-$pkgver.tar.gz::https://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim
        vimdoc.hook)
sha1sums=('24824406544144938f07f021fd9aa8a9821eccea'
          '539bfaa0517dfff6d61c37f9c2d81a0db756a4c9'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2'
          'adc4c82b6c4097944e5a767270a772721455eb8c')

prepare() {
  cd $srcdir/vim-$pkgver/src

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
}

check() {
  cd "${srcdir}"/vim-$pkgver
  TERM=xterm make -j1 test
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

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt

  # pacman hook for documentation helptags
  install -Dm644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}

package_vim-clipboard() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
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

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

