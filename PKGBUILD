# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-noruby
# list of tags can be found at https://code.google.com/p/vim/source/list
_topver=7.4
_patchlevel=778
_tag=v${_topver/./-}-${_patchlevel}
_versiondir="vim${_topver//./}"
pkgver=${_topver}.${_patchlevel}
pkgrel=2
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
pkgdesc="Like 'vim' package, but -ruby"
depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'lua' 'python2' 'acl')
conflicts=('vim-minimal' 'vim-python3' 'gvim' 'gvim-python3' 'vim')
provides=("vim" "xxd")
makedepends=('gpm' 'python2' 'python' 'libxt' 'desktop-file-utils' 'gtk2' 'lua' 'mercurial')
# It would be great to use downloadable archives https://vim.googlecode.com/archive/$tag.tar.gz
# unfortunately its content changes each time you download one (files modification date is different)
source=("${pkgname}-repo::hg+https://vim.googlecode.com/hg#tag=${_tag}"
        'vimrc'
        'archlinux.vim')
sha1sums=('SKIP'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

prepare() {
  cd ${pkgname}-repo

  _latesttag=$(hg parents --template '{latesttag}' -r default)
  if (( $_tag != $_latesttag )); then
    printf 'You are not building the latest revision!\n'
    printf "Consider updating to tag $_latesttag.\n"
  fi

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h

  (cd src && autoconf)

  cd ..
  cp -a ${pkgname}-repo ${pkgname}-build
}

build() {
  cd "${srcdir}/${pkgname}-build"

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
    --disable-rubyinterp \
    --enable-luainterp

  make
}

check() {
  # disable tests because they seem to freeze

  cd "${srcdir}/${pkgname}-build"

  #make test
}

package() {
  cd "${srcdir}/${pkgname}-build"

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

# vim:set sw=2 sts=2 et:
