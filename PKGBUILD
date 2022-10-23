# Maintainer: Lance Roy <ldr709@gmail.com>

# Mostly copied from vim-git and gvim packages

pkgbase='gvim-wayland-lilydjwg-git'
pkgname=('gvim-wayland-lilydjwg-git' 'vim-wayland-lilydjwg-git-runtime')
pkgver=15311.1ff2399c3
pkgrel=1
pkgdesc="VIM: Vi IMproved. Fork by lilydjwg to add Wayland support for the GUI mode."
arch=('i686' 'x86_64')
url="http://github.com/lilydjwg/vim"
license=('custom:vim')
optdepends=()
backup=()
options=()
makedepends=('glibc' 'libgcrypt' 'gpm' 'python' 'ruby' 'libxt' 'gtk3' 'lua'
             'gawk' 'tcl' 'zlib' 'libcanberra')
source=("git+https://github.com/lilydjwg/vim.git#branch=wayland"
        vimrc
        archlinux.vim
        vimdoc.hook
        gvim-wayland.sh
        gvim-wayland.csh)
sha512sums=('SKIP'
            '4b5bed0813f22af9e158ea9aa56a4a9862dd786ba2d201f20159ccf652da6190164aaed0b6b7217d578f7b25c33a8adcc307bfcf3caa8d173a7ff29e2a00fee7'
            'fe091d289d876f45319c898f6021ef86d6a238b540c225a279c46efc5c36fa7d868cd0cee73a111811c4be90df160f85340bb251be3a437727dbe5c699950363'
            'a02ad0d66f300160911aeb81d8886c6c558436ac4ee3fcd161dd65c6b1e5d1f41b9005a7f5bb5ba68d57027fc1c8e43daabf055bd6207fb5a216a67f758df8d1'
            'aeb67262a228f546fc8ce28fbeb7f94f04cdb9bd23adc658c03b8805781e2858b31b8414e5d4ec175d3ba0c68c6f3a79149100994d41021a36303bf2d55611da'
            '807b56fe85f4a2c7338698624a18513a94a0dc0b7d3785cf92f86647fe2b62b2e6e0351a0eea642a0dba173f53cd25f2aa85c6e5dd6e1583beb5f416c8025204')

pkgver() {
    cd "vim"
    echo $(git rev-list --count origin/wayland).$(git rev-parse --short origin/wayland)
}

prepare() {
  (cd vim/src
    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
    sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
    autoconf
  )
}

build() {
    cd vim
    ./configure \
        --prefix=/usr \
        --localstatedir=/var/lib/vim \
        --with-features=huge \
        --with-compiledby='Arch Linux' \
        --enable-gpm \
        --enable-acl \
        --with-x=yes \
        --disable-clientserver \
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
}

package_vim-wayland-lilydjwg-git-runtime() {
    provides=('vim-runtime')
    conflicts=('vim-runtime')
    pkgdesc+=' (shared runtime)'
    optdepends=('sh: support for some tools and macros'
                'python: demoserver example tool'
                'gawk: mve tools upport')
    backup=('etc/vimrc')

    cd "$srcdir/vim"

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

package_gvim-wayland-lilydjwg-git() {
    # TODO: move perl back into optdeps after --enable-perlinterp=dynamic
    #       starts working again (https://github.com/vim/vim/issues/10512)
    depends=("vim-wayland-lilydjwg-git-runtime=${pkgver}-${pkgrel}"
             'gpm' 'acl' 'libxt' 'gtk3' 'glibc' 'libgcrypt'
             'zlib' 'libcanberra' 'perl')
    optdepends=('python: Python language support'
                'ruby: Ruby language support'
                'lua: Lua language support'
                'tcl: Tcl language support')
    install=gvim-wayland.install
    provides=('vim' 'gvim' "xxd" 'vim-plugin-runtime')
    conflicts=('vim-minimal' 'vim' 'gvim')

    cd "$srcdir/vim"
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

    # set environment variable to enable wayland support
    install -Dm 644 "${srcdir}"/gvim-wayland.sh "${pkgdir}"/etc/profile.d/gvim-wayland.sh
    install -Dm 644 "${srcdir}"/gvim-wayland.csh "${pkgdir}"/etc/profile.d/gvim-wayland.csh
}
