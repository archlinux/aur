# Maintainer: Allen Li <darkfeline@felesatra.moe>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbase=vim
pkgname=vim-x11
# list of tags can be found at https://code.google.com/p/vim/source/list
_topver=7.4
_patchlevel=712
_tag=v${_topver/./-}-${_patchlevel}
_versiondir="vim${_topver//./}"
pkgver=${_topver}.${_patchlevel}
pkgrel=1
_upstream_pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
makedepends=('gpm' 'python2' 'ruby' 'libxt' 'desktop-file-utils' 'lua' 'mercurial')
# It would be great to use downloadable archives https://vim.googlecode.com/archive/$tag.tar.gz
# unfortunately its content changes each time you download one (files modification date is different)
source=("${_pkgbase}-repo::hg+https://vim.googlecode.com/hg#tag=${_tag}"
        'vimrc'
        'archlinux.vim')
sha1sums=('SKIP'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (X11 support, no GUI)'
depends=("vim-runtime=${pkgver}-${_upstream_pkgrel}" 'gpm' 'ruby' 'lua' 'python2' 'acl')
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim' 'gvim-python3')
provides=('vim')

prepare() {
  cd ${_pkgbase}-repo

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
  for pkg in ${pkgname[@]}
  do
    cp -a ${_pkgbase}-repo ${pkg}-build
  done
}

build() {

  cd "${srcdir}"/vim-x11-build

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
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make
}

package() {
  cd "${srcdir}"/vim-x11-build
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
