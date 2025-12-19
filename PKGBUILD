# shellcheck shell=bash
# shellcheck disable=SC2034
# Maintainer: Chinmay Dalal <dalal DOT chinmay DOT 0101 AT gmail DOT com>
# Contributor: A Farzat <a@farzat.xyz>
# Contributor: éclairevoyant
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Gregory Anders <aur@gpanders.com>

declare srcdir pkgdir
pkgname=neovim-zig-git
_nvim_version=0.12.0
pkgver=0.12.0.r2529.g5f22cf5af3
pkgrel=3
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - built using zig'
arch=(i686 x86_64 armv7h armv6h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
makedepends=('git' 'zig>=0.15.2')
optdepends=(
    'python-pynvim: for Python plugin support (see :help python)'
    'tree-sitter-bash: tree-sitter parser for bash'
    'tree-sitter-python: tree-sitter parser for python'
    'xclip: for clipboard support on X11 (or xsel) (see :help clipboard)'
    'xsel: for clipboard support on X11 (or xclip) (see :help clipboard)'
    'wl-clipboard: for clipboard support on wayland (see :help clipboard)'
)
provides=("neovim=${_nvim_version}" 'vim-plugin-runtime')
conflicts=('neovim' 'neovim-git')
source=(
    "git+https://github.com/neovim/neovim"
    nvimdoc{,.hook}
)
sha512sums=('SKIP'
            '22662462c823de243599cdd3483e46ade4ab59b219e907468d34c18e584fe7477548e357ee2ce56bb098cf54b770b108a3511703dd486f0774a65c84af78f6aa'
            '3c6ee1e4646d09c164a2212f9e4d2f53158ff32911b0972e060a395a8d4685334574a7ede995a81680dcc0750cd3327a78beb7904a4bb326b2399d79a8b12d5e')
b2sums=('SKIP'
        'd31cf81659e238fada8092755eb9be16f77c00a466107eb5770c6c9c32e043c91e6efada7ddb51663716a0e38ffa6e3d0093b3e6833aa961d845c7451a95491e'
        '26588b9da6459393076723bdfb8d2b16fed882070f2326bf7c35cd272dee9c18df603afb1ae2254cd0a59eff68189caf04828ef165d5de42c7a4222267604101')
options=(!strip)

pkgver() {
    cd "${srcdir}/neovim" || exit 1
    local nvim_version_git
    _nvim_version="$(awk -F'"' '/\.version = "/ {print $2}' build.zig.zon)"
    nvim_version_git="$(git describe --always --dirty --match 'v*.*.*' | sed -E 's/^v[0-9]+.[0-9]+.[0-9]+-//; s/^([0-9]+)-([a-z0-9]+)/\1\.\2/')"
    printf "%s.r%s\n" "$_nvim_version" "$nvim_version_git"
}

build() {
    cd "${srcdir}/neovim" || exit 1
    zig build -Doptimize=ReleaseFast -Dcpu=native
}

check() {
    cd "${srcdir}/neovim" || exit 1
    zig-out/bin/nvim --version
    zig-out/bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" nvimdoc.hook
    install -Dt "$pkgdir/usr/share/libalpm/scripts/" nvimdoc

    pushd . >/dev/null
    cd "${srcdir}/neovim" || exit 1
    zig build install --prefix "${pkgdir}/usr" -Doptimize=ReleaseFast -Dcpu=native
    rm "${pkgdir}/usr/bin/nlua0"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 runtime/nvim.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 runtime/nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
    install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"
    # shellcheck disable=SC2164
    popd >/dev/null

    # Make Arch Vim packages work
    mkdir -p "${pkgdir}"/etc/xdg/nvim
    echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
    echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

    mkdir -p "${pkgdir}"/usr/share/vim
    echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=4 sts=4 et:
