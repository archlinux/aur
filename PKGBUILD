# Maintainer: doclic <doclic@tutanota.com>
# Based on the vim package in extra, which is made by the following people:
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgbase=vim-classic
pkgname=('vim-classic' 'gvim-classic' 'vim-classic-runtime')
pkgver=8.3.0
_versiondir=83
pkgrel=1
pkgdesc='a fork of Vim 8.x for long-term maintenance'
url='https://vim-classic.org'
arch=('x86_64')
license=('custom:vim')
makedepends=(
  gawk
  glibc
  gpm
  gtk3
  libcanberra
  libgcrypt
  libxt
  lua
  perl
  python
  ruby
  tcl
  zlib
)
source=(vim-classic-v${pkgver}.tar.gz::https://git.sr.ht/~sircmpwn/vim-classic/archive/v${pkgver}.tar.gz
        https://git.sr.ht/~sircmpwn/vim-classic/refs/download/v${pkgver}/vim-classic-v${pkgver}.tar.gz.sig
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('6e1c97c8269e9354bbc474f0efa7e1e0b23fcdb6075067474d731a9bfac6e8ef'
            'SKIP'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')
validpgpkeys=('9FB5E737DC25B29D8EEC469142F3F1862E3CC4B8') # Drew DeVault <drew@ddevault.org>

prepare() {
  (cd vim-classic-v${pkgver}/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
  cp -a vim-classic-v${pkgver} gvim-classic-v${pkgver}
}

build() {
  msg2 "Building vim-classic..."
  (cd vim-classic-v${pkgver}
    ./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/vim \
      --with-features=huge \
      --with-compiledby='Arch Linux' \
      --with-wayland=no \
      --enable-gpm \
      --enable-acl \
      --with-x=no \
      --disable-gui \
      --enable-multibyte \
      --enable-cscope \
      --enable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --disable-canberra
    make
  )

  msg2 "Building gvim-classic..."
  (cd gvim-classic-v${pkgver}
    ./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/vim \
      --with-features=huge \
      --with-compiledby='Arch Linux' \
      --enable-gpm \
      --enable-acl \
      --with-x=yes \
      --enable-gui=gtk3 \
      --enable-multibyte \
      --enable-cscope \
      --enable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --enable-canberra
    make
  )
}

package_vim-classic-runtime() {
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools support')
  conflicts=('vim-runtime')
  provides=("vim-runtime=${pkgver}-${pkgrel}")
  backup=('etc/vimrc')

  cd vim-classic-v${pkgver}

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
  # man and bin files belong to 'vim'
  rm -r "${pkgdir}"/usr/share/man/ "${pkgdir}"/usr/bin/

  # Don't forget logtalk.dict
  install -Dm 644 runtime/ftplugin/logtalk.dict \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/ftplugin/logtalk.dict

  # rc files
  install -Dm 644 "${srcdir}"/vimrc "${pkgdir}"/etc/vimrc
  install -Dm 644 "${srcdir}"/archlinux.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/archlinux.vim

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-classic-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-classic-runtime/license.txt
}

package_vim-classic() {
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('vim' 'gvim' 'vim-minimal')
  provides=("vim=${pkgver}-${pkgrel}" 'xxd' 'vim-minimal' 'vim-plugin-runtime')

  cd vim-classic-v${pkgver}
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd "${_mandir}"
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # remove gvim.desktop as not included
  rm "${pkgdir}"/usr/share/applications/gvim.desktop

  # license
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}

package_gvim-classic() {
  pkgdesc+=' (with advanced features, such as a GUI)'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'libxt' 'gtk3' 'glibc' 'libgcrypt'
           'zlib' 'libcanberra')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  provides=("vim=${pkgver}-${pkgrel}" "gvim=${pkgver}-${pkgrel}" "xxd" 'vim-plugin-runtime')
  conflicts=('vim-minimal' 'vim' 'gvim')

  cd gvim-classic-v${pkgver}
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

  # license
   install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}

# vim: ts=2 sw=2 et:
