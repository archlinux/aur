# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=vim-no-canberra
pkgver=8.1.1618
_versiondir=81
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor without canberra deps'
url='https://www.vim.org'
arch=('x86_64' 'armv7h')
license=('custom:vim')
makedepends=('glibc' 'libgcrypt' 'gpm' 'python2' 'python' 'ruby' 'libxt'        'lua'
             'gawk' 'tcl' 'pcre' 'zlib' 'libffi'              )
source=(vim-${pkgver}.tar.gz::https://github.com/vim/vim/archive/v${pkgver}.tar.gz
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('23d40ce994d5781e5aee775d3036bb66d1d99bd4881d7d888316ef817765256c'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '7095cafac21df7aa42749d6864d1c0549fe65771d8edda3102c931c60782b6b9')

prepare() {
  (cd vim-${pkgver}/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' feature.h
    sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' feature.h
    autoconf
  )
}

build() {
  msg2 "Building vim..."
  (cd vim-${pkgver}
    ./configure \
      --prefix=/usr \
      --disable-canberra \
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
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic
    make
  )
}

check() {
  cd vim-${pkgver}
  TERM=xterm make -j1 test
}

package() {
  depends=('gpm' 'acl' 'glibc' 'libgcrypt' 'pcre'
           'zlib' 'libffi')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'gawk: mve tools upport'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support'
              'sh: support for some tools and macros')
  conflicts=('gvim' 'vim-minimal' 'vim-python3' 'vim' 'vim-runtime')
  provides=('xxd' 'vim-minimal' 'vim-python3' 'vim-runtime' 'vim')
  replaces=('vim-python3' 'vim-minimal')
  backup=('etc/vimrc')

  ### vim-runtime

  cd vim-${pkgver}

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # Don't forget logtalk.dict
  install -Dm 644 runtime/ftplugin/logtalk.dict \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/ftplugin/logtalk.dict

  # rc files
  install -Dm 644 "${srcdir}"/vimrc "${pkgdir}"/etc/vimrc
  install -Dm 644 "${srcdir}"/archlinux.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/archlinux.vim

  # rgb.txt file
  install -Dm 644 runtime/rgb.txt \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/rgb.txt

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook

  ### vim

  # delete some manpages
  rm -f "${pkgdir}/usr/share/man/man1/ex.1"
  rm -f "${pkgdir}/usr/share/man/man1/view.1"
  rm -f "${pkgdir}/usr/share/man/man1/evim.1"

  # license
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

# vim: ts=2 sw=2 et:
