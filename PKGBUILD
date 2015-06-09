# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=('vim-light')
pkgver=7.4.335
_basever=7.4
_patchlevel=335
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (minimal install)'
conflicts=('gvim' 'vi' 'vim' 'vim-runtime')
provides=('vim' 'vim-runtime')
options=(strip !docs)
url="http://www.vim.org"
makedepends=('python2' 'desktop-file-utils')
source=("ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2")
md5sums=('607e135c559be642f210094ad023dc65')

pkgver() {
  echo $_basever.$_patchlevel
}

build() {
  cd "${srcdir}"
  mv vim74 vim-build  
  cd "${srcdir}"/vim-build
  mkdir vim-patches

  # define the place for the global vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' src/feature.h

  for n in $(seq -w 001 $_patchlevel)
  do
    wget -nv ftp.vim.org/pub/vim/patches/7.4/7.4.$n -O vim-patches/$n.patch
    patch -p0 -ti vim-patches/$n.patch || patch -p1 -ti vim-patches/$n.patch || (echo "$n.patch FAILED" && exit 1)
  done

  (cd src && autoconf)

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=normal \
    --disable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --disable-perlinterp \
    --disable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp \
    --disable-nls 

  make
}

package() {
  cd "${srcdir}"/vim-build
  make VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # delete some manpages
  rm -f "${pkgdir}"/usr/share/man/man1/evim.1    
  rm -f "${pkgdir}"/usr/share/man/man1/vimtutor.1

  # fix FS#17216
  sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
    "${pkgdir}"/usr/share/vim/vim74/filetype.vim

  # patch filetype.vim for better handling of pacman related files
  sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
    "${pkgdir}"/usr/share/vim/vim74/filetype.vim
  sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
    "${pkgdir}"/usr/share/vim/vim74/ftplugin/changelog.vim

  # rgb.txt file
  install -Dm644 "${srcdir}"/vim-build/runtime/rgb.txt "${pkgdir}"/usr/share/vim/vim74/rgb.txt

  rm -rf "${pkgdir}"/usr/share/vim/vim74/{spell,doc,tutor,print,macros}
  rm -rf "${pkgdir}"/usr/share/vim/vim74/tools/vimspell*
  rm "${pkgdir}"/usr/bin/vimtutor
}
