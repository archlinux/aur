# Maintainer: 64bitman <60551350+64-bitman@users.noreply.github.com>
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

pkgbase=vim-cli-git
pkgname=('vim-cli-git' 'vim-cli-git-runtime')
pkgver=9.1.0610
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (cli version with X11 support)'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
makedepends=(
  gawk
  git
  glibc
  gpm
  libcanberra
  libgcrypt
  libxt
  lua
  perl
  python
  zlib
)
source=(git+https://github.com/vim/vim.git
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('SKIP'
'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
'8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')

prepare() {
  (cd vim/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
}

pkgver() {
  (cd vim
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
  )
}

build() {
  msg2 "Building vim..."
  (cd vim
    ./configure \
      --prefix=/usr \
      --localstatedir=/var/lib/vim \
      --with-features=huge \
      --with-compiledby='Arch Linux User Repository' \
      --enable-gpm \
      --enable-acl \
      --with-x=yes \
      --disable-gui \
      --enable-multibyte \
      --enable-cscope \
      --disable-netbeans \
      --enable-perlinterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-luainterp=dynamic \
      --enable-autoservername  \
      --enable-canberra \
      --disable-darwin \
      --enable-fail-if-missing
    make
  )
}

package_vim-cli-git-runtime() {
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools upport')
  backup=('etc/vimrc')
  provides=('vim-runtime')
  conflicts=('vim-runtime')

  cd vim

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
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt
}

package_vim-cli-git() {
  depends=("vim-cli-git-runtime" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib')
  optdepends=('python: Python language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'cscope: cscope interface')
  conflicts=('gvim' 'vim-minimal' 'vim')
  provides=('vim' 'xxd' 'vim-minimal' 'vim-plugin-runtime')
  replaces=('vim-minimal')

  cd vim
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

# vim: ts=2 sw=2 et ft=sh:
