# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=('vim-min' 'vim-runtime-min')
pkgver=8.2.1989
_versiondir=82
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
makedepends=('glibc' 'libgcrypt' 'python' 'libxt'
             'gawk' 'pcre' 'zlib' 'libffi')
source=(https://github.com/vim/vim/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('81d5d6a48cd421c7a8056f9436436de1ed37598341cbec3b1db7ff99c3889276'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')
sha512sums=('5d13be4220111a94d8b6b82b6516d4a51a86d4ff85890df2eb0c559e6adb7ace6aa8217f5893013961eeaedfd494cd1c04bbb4c1db3c9356425961e5890e06d7'
            '4b5bed0813f22af9e158ea9aa56a4a9862dd786ba2d201f20159ccf652da6190164aaed0b6b7217d578f7b25c33a8adcc307bfcf3caa8d173a7ff29e2a00fee7'
            'fe091d289d876f45319c898f6021ef86d6a238b540c225a279c46efc5c36fa7d868cd0cee73a111811c4be90df160f85340bb251be3a437727dbe5c699950363'
            'a02ad0d66f300160911aeb81d8886c6c558436ac4ee3fcd161dd65c6b1e5d1f41b9005a7f5bb5ba68d57027fc1c8e43daabf055bd6207fb5a216a67f758df8d1')

prepare() {
  (cd vim-${pkgver}/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
  cp -a vim-${pkgver} gvim-${pkgver}
}

build() {
  cd vim-${pkgver}
    ./configure \
      --prefix=/usr/share \
      --localstatedir=/var/lib/vim \
      --with-features=small \
      --with-compiledby='Arch Linux' \
      --disable-gpm \
      --enable-acl \
      --with-x=no \
      --disable-gui \
      --enable-multibyte \
      --enable-cscope \
      --disable-netbeans \
      --disable-canberra \
      --disable-darwin \
      --disable-smack \
      --disable-selinux \
      --disable-luainterp \
      --without-luajit \
      --disable-arabic \
      --disable-farsi \
      --disable-gtk2-check \
      --disable-gnome-check \
      --disable-gtk3-check \
      --disable-motif-check \
      --disable-athena-check \
      --disable-gtktest \
      --disable-sysmouse \
    make
}

#   add these options to enable different language features if desired
#
#      --enable-perlinterp=dynamic \
#      --enable-pythoninterp=dynamic \
#      --enable-python3interp=dynamic \
#      --enable-rubyinterp=dynamic \
#      --enable-luainterp=dynamic \
#      --enable-tclinterp=dynamic \

#check() {
#  cd vim-${pkgver}
#  TERM=xterm make -j1 test
#}

package_vim-runtime-min() {
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools upport')
  provides=(vim-runtime)
  conflicts=(vim-runtime)
  backup=('etc/vimrc')

  cd vim-${pkgver}

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

  # rgb.txt file
  install -Dm 644 runtime/rgb.txt \
    "${pkgdir}"/usr/share/vim/vim${_versiondir}/rgb.txt

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}

package_vim-min() {
  depends=("vim-runtime" 'acl' 'glibc' 'libgcrypt' 'pcre'
           'zlib' 'libffi')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('gvim' 'vim' 'vim-minimal' 'vim-python3')
  provides=('xxd' 'vim' 'vim-minimal' 'vim-python3' 'vim-plugin-runtime')
  replaces=('vim-python3')

  cd vim-${pkgver}
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
}

# vim: ts=2 sw=2 et:
