# $Id: PKGBUILD 246538 2015-09-17 21:02:30Z foutrelis $
# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=vim-git2
pkgname=(vim-minimal-git2 vim-git2 vim-python3-git2 gvim-git2 gvim-python3-git2 vim-runtime-git2)
pkgver=7.4.884
_versiondir=74
pkgrel=1
arch=(i686 x86_64)
license=('custom:vim')
url='http://www.vim.org'
makedepends=(gpm python2 python ruby libxt desktop-file-utils gtk2 lua)
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim
        gvim.desktop)
sha1sums=('SKIP'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2'
          '4a579cf66590d711f49c5dfb4a25e5df116ff7ba')

prepare() {
  cd vim-$pkgver

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h

  (cd src && autoconf)

  cd "$srcdir"
  for pkg in ${pkgname[@]}
  do
    cp -a vim-$pkgver ${pkg}-build
  done
}

build() {
  cd "${srcdir}"/vim-runtime-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --enable-perlinterp \
    --disable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp

  make

  cd "${srcdir}"/vim-minimal-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --enable-perlinterp \
    --disable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp

  make

  cd "${srcdir}"/vim-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make

  cd "${srcdir}"/vim-python3-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --disable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make

  cd "${srcdir}"/gvim-build

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
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make

  cd "${srcdir}"/gvim-python3-build

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
    --enable-perlinterp \
    --disable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make
}

check() {
  # disable tests because they seem to freeze
  cd "${srcdir}"/vim-build
  #make test

  cd "${srcdir}"/gvim-build
  #make test
}

package_vim-minimal-git2() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with a minimal set of dependencies)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl')
  conflicts=('vim' 'vim-python3' 'gvim' 'gvim-python3')
  provides=("vim=${pkgver}-${pkgrel}" "xxd")

  cd "${srcdir}"/vim-minimal-build
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

package_vim-git2() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with support for additional scripting languages)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'lua' 'python2' 'acl')
  conflicts=('vim-minimal' 'vim-python3' 'gvim' 'gvim-python3')
  provides=("xxd")

  cd "${srcdir}"/vim-build
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

package_vim-python3-git2() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with support for additional scripting languages)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'lua' 'python' 'acl')
  conflicts=('vim-minimal' 'vim' 'gvim' 'gvim-python3')
  provides=("vim=${pkgver}-${pkgrel}" "xxd")

  cd "${srcdir}"/vim-python3-build
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

package_gvim-git2() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'libxt'
           'desktop-file-utils' 'gtk2' 'lua' 'python2')
  provides=("vim=${pkgver}-${pkgrel}" "xxd")
  conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim-python3')
  install=gvim.install

  cd "${srcdir}"/gvim-build
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
  install -Dm644 "${srcdir}"/gvim.desktop \
    "${pkgdir}"/usr/share/applications/gvim.desktop
  install -Dm644 runtime/vim48x48.png "${pkgdir}"/usr/share/pixmaps/gvim.png

  # license
   install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

package_gvim-python3-git2() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI) with python 3 support'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'libxt'
           'desktop-file-utils' 'gtk2' 'lua' 'python')
  provides=("vim=${pkgver}-${pkgrel}" "gvim=${pkgver}-${pkgrel}" "xxd")
  conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim')
  install=gvim.install

  cd "${srcdir}"/gvim-python3-build
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
  install -Dm644 "${srcdir}"/gvim.desktop \
    "${pkgdir}"/usr/share/applications/gvim.desktop
  install -Dm644 runtime/vim48x48.png "${pkgdir}"/usr/share/pixmaps/gvim.png

  # license
   install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

package_vim-runtime-git2() {
  pkgdesc='Runtime for vim and gvim'
  depends=('perl' 'gawk')
  backup=('etc/vimrc')

  cd "${srcdir}"/vim-runtime-build

  (cd src && make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" installruntime install-languages installtools)
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
