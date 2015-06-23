# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname='gvim-gc-responsiveness-patch'
# list of tags can be found at https://code.google.com/p/vim/source/list
_topver=7.4
_patchlevel=580
_tag=v${_topver/./-}-${_patchlevel}
_versiondir="vim${_topver//./}"
pkgver=${_topver}.${_patchlevel}
pkgdesc='gvim patched with https://gist.github.com/mattn/0c58a7398c63ab4c3066 to fix unresponsiveness in gc'
pkgrel=1
arch=('x86_64')
license=('custom:vim')
url="http://www.vim.org"
depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'libxt' 'desktop-file-utils' 'gtk2' 'lua' 'python2' 'perl')
makedepends=('gpm' 'python2' 'python' 'ruby' 'libxt' 'desktop-file-utils' 'gtk2' 'lua' 'mercurial')
provides=("vim=${pkgver}-${pkgrel}" "gvim=${pkgver}-${pkgrel}")
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim-python3' 'gvim')
install=gvim.install
# It would be great to use downloadable archives https://vim.googlecode.com/archive/$tag.tar.gz
# unfortunately its content changes each time you download one (files modification date is different)
source=("vim-repo::hg+https://vim.googlecode.com/hg#tag=${_tag}"
        'vimrc'
        'archlinux.vim'
        'gvim.desktop'
        'gc_responsiveness.patch')

sha1sums=('SKIP'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2'
          '4a579cf66590d711f49c5dfb4a25e5df116ff7ba'
          'eef8fbf1674f045a3c15a46cfbaef0a7d6431300')


prepare() {
  cd vim-repo

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
  cp -a vim-repo gvim-build
}

build() {
  cd "${srcdir}"/gvim-build

  patch -p1 -i "${srcdir}"/gc_responsiveness.patch

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
}

package() {
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
    "${pkgdir}"/usr/share/licenses/gvim/license.txt
}
# vim:set sw=2 sts=2 et:
