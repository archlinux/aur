# Maintainer: Torben <git@letorbi.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgbase=vim-wayland
pkgname=('vim-wayland' 'gvim-wayland' 'vim-wayland-runtime')
pkgver=9.0.1046
_versiondir=90
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (patched for Wayland)'
url='https://www.vim.org'
arch=('x86_64' 'x86_64_v3')
license=('custom:vim')
options=(debug)
makedepends=('glibc' 'libgcrypt' 'gpm' 'python' 'ruby' 'libxt' 'gtk3' 'lua'
             'gawk' 'tcl' 'zlib' 'libcanberra')
source=(https://github.com/vim/vim/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz
        vimrc
        archlinux.vim
        vimdoc.hook
        wayland.patch)
sha256sums=('47f8e1bf08994c089093b5ee413b41b6899878b34412c213ea2eb7894065cefb'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae'
            '848a7d51b449b37c8e69ce74096e9e34f4c12ffb89a0d5a66aa93e34719a8c1f')
sha512sums=('7ab8f81669c994e65cc8f842b4fe5dc1a4fbfd7c5b89ed36dfe1ebd783c6a695e352a2fc82d659c48189999315ebfbcc533c68c5ffe53422b143b364ff0ffc50'
            '4b5bed0813f22af9e158ea9aa56a4a9862dd786ba2d201f20159ccf652da6190164aaed0b6b7217d578f7b25c33a8adcc307bfcf3caa8d173a7ff29e2a00fee7'
            'fe091d289d876f45319c898f6021ef86d6a238b540c225a279c46efc5c36fa7d868cd0cee73a111811c4be90df160f85340bb251be3a437727dbe5c699950363'
            'a02ad0d66f300160911aeb81d8886c6c558436ac4ee3fcd161dd65c6b1e5d1f41b9005a7f5bb5ba68d57027fc1c8e43daabf055bd6207fb5a216a67f758df8d1'
            'a509ebc989df5494e4682c48d723fa5abd15acd445455383c3a402be0ab9276eb94f4a72ea1f82a6d8054968f32c18690d4e4943364ce730a5b6da01a72d47a9')

prepare() {
  (cd vim-${pkgver}
    pwd
    patch -p1 < ../wayland.patch
  )
  (cd vim-${pkgver}/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
  cp -a vim-${pkgver} gvim-${pkgver}
}

build() {
  echo "Building vim..."
  (cd vim-${pkgver}
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
      --enable-perlinterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic \
      --enable-tclinterp=dynamic \
      --disable-canberra
    make
  )

  echo "Building gvim..."
  (cd gvim-${pkgver}
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

check() {
  cd vim-${pkgver}
  TERM=xterm make -j1 test
}

package_vim-wayland-runtime() {
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools upport')
  conflicts=('vim-runtime')
  provides=('vim-runtime')
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

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt

  # pacman hook for documentation helptags
  install -Dm 644 "${srcdir}"/vimdoc.hook "${pkgdir}"/usr/share/libalpm/hooks/vimdoc.hook
}

package_vim-wayland() {
  # TODO: move perl back into optdeps after --enable-perlinterp=dynamic
  #       starts working again (https://github.com/vim/vim/issues/10512)
  depends=("vim-wayland-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'zlib' 'perl')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              #'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('vim' 'gvim-wayland' 'gvim' 'vim-minimal')
  provides=('vim' 'xxd' 'vim-minimal' 'vim-plugin-runtime')
  replaces=('vim-minimal')

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

package_gvim-wayland() {
  pkgdesc+=' (with advanced features, such as a GUI)'
  # TODO: move perl back into optdeps after --enable-perlinterp=dynamic
  #       starts working again (https://github.com/vim/vim/issues/10512)
  depends=("vim-wayland-runtime=${pkgver}-${pkgrel}" 'gpm' 'libxt' 'gtk3' 'glibc' 'libgcrypt'
           'zlib' 'libcanberra' 'perl')
  optdepends=('python: Python language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              #'perl: Perl language support'
              'tcl: Tcl language support')
  provides=('gvim' "vim=${pkgver}-${pkgrel}" "xxd" 'vim-plugin-runtime')
  conflicts=('gvim' 'vim-wayland' 'vim-minimal' 'vim')

  cd gvim-${pkgver}
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
}

# vim: ts=2 sw=2 et:
