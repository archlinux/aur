# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
# Contributor: A Farzat <a@farzat.xyz>
# Contributor: éclairevoyant
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Gregory Anders <aur@gpanders.com>

declare srcdir pkgdir
pkgname=neovim-zig-git
_nvim_version=0.13.0
pkgver=0.13.0.r2887.gd9a842e291
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - built using zig'
arch=(i686 x86_64 armv7h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=(
    libluv
    libutf8proc
    libuv
    luajit
    tree-sitter
    unibilium
)
makedepends=('git' 'zig>=0.17.0')
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
    # PKGBUILD direct dependencies
    'git+https://github.com/neovim/neovim.git'
    nvimdoc{,.hook}

    # zig build dependencies
    'ziglua.tar.gz::https://github.com/natecraddock/ziglua/archive/89b445c92113170c4ca2ff16b256cd24f300c743.tar.gz'
    'translate_c.tar.gz::https://codeberg.org/ziglang/translate-c/archive/38d8339d9050eafe5dcf85b4fc9368576ca967e1.tar.gz'
    'aro.tar.gz::https://codeberg.org/ziglang/arocc/archive/d0c8c4d9c55daa7ef6e40cf0f630a5b5e900989b.tar.gz'
    'https://github.com/neovim/deps/raw/06ef2b58b0876f8de1a3f5a710473dcd7afff251/opt/lua-dev-deps.tar.gz'
    'uncrustify_zig.tar.gz::https://codeberg.org/allyourcodebase/uncrustify/archive/ac65f4ab0786196f89ff03a3fc6328315edae29b.tar.gz'
    'uncrustify.tar.gz::https://github.com/uncrustify/uncrustify/releases/download/uncrustify-0.83.0/uncrustify-0.83.0.tar.gz'

    # parsers
    'tree-sitter-c.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/f3202ac4f1041e0b0a2b908147d5dd0e951da7b1.tar.gz'
    'tree-sitter-markdown.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-markdown/archive/41ff24a6c775492c543b09228aeb98d1cd2b3a0f.tar.gz'
    'tree-sitter-lua.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-lua/archive/10fe0054734eec83049514ea2e718b2a56acd0c9.tar.gz'
    'tree-sitter-vim.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-vim/archive/3092fcd99eb87bbd0fc434aa03650ba58bd5b43b.tar.gz'
    'tree-sitter-vimdoc.tar.gz::https://github.com/neovim/tree-sitter-vimdoc/archive/f061895a0eff1d5b90e4fb60d21d87be3267031a.tar.gz'
    'https://github.com/tree-sitter-grammars/tree-sitter-query/releases/download/v0.8.0/tree-sitter-query.tar.gz'
    'tree-sitter-diff.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-diff/releases/download/v0.2.0/tree-sitter-diff.tar.gz'
)
sha256sums=(
    # PKGBUILD direct dependencies
    'SKIP'
    '0881cf186965ac3d601c25866c7540f8d82064e7a84f5b644ca6a41b54c2c9a6'
    '69794b783cb004ec9fe2bbe2d7ac347681701bbcb15304b0324d8ec95fbd6e81'

    # zig build dependencies
    'SKIP'
    'SKIP'
    'SKIP'
    '49f8399e453103064a23c65534f266f3067cda716b6502f016bfafeed5799354'
    'SKIP'
    '0aed2c5df101d5108b9cc8d6da0dddfad1286a66b49c794e38b2a6d0d868393e'

    # parsers
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '60e89c03d2f2883ca990089ff8cb641e89723164dc238e849d0350380cdce928'
    '5b785143a58878602ea8110498fe41a8b8e5ec34445bd2bf5468b5d2aab369c0'
)
noextract=(
    # zig buld dependencies
    'ziglua.tar.gz'
    'lua-dev-deps.tar.gz'
    'uncrustify_zig.tar.gz'
    'uncrustify.tar.gz'
    'zig-compile-commands.tar.gz'

    # parsers
    'tree-sitter-c.tar.gz'
    'tree-sitter-markdown.tar.gz'
    'tree-sitter-lua.tar.gz'
    'tree-sitter-vim.tar.gz'
    'tree-sitter-vimdoc.tar.gz'
    'tree-sitter-query.tar.gz'
    'tree-sitter-diff.tar.gz'
)
_zig_options=(--system zig_deps -Doptimize=fast -Dcpu=native -Dinstall-path=/usr)

pkgver() {
    local nvim_version_git
    cd "${srcdir}/neovim"
    _nvim_version="$(awk -F'"' '/\.version = "/ {print $2}' build.zig.zon)"
    nvim_version_git="$(git describe --always --dirty --match 'v*.*.*' | sed -E 's/^v[0-9]+.[0-9]+.[0-9]+-//; s/^([0-9]+)-([a-z0-9]+)/\1\.\2/')"
    printf "%s.r%s\n" "$_nvim_version" "$nvim_version_git"
}

prepare() {
    local -A deps=(
        [ziglua.tar.gz]='zlua-0.1.0-hGRpC1yrBQD9E43yOh9oeuNDrmg2hQwCD_3GmJdI1bCn'
        [translate_c.tar.gz]='translate_c-0.0.0-Q_BUWoROBwAyokT5SJSw4YIrwdLd1w53i-pEYwBDqXZt'
        [aro.tar.gz]='aro-0.0.0-JSD1QtuBNwCASyBtNF3pqTl_W3oAJQGEVyFAtrBSE_Pa'
        [uncrustify_zig.tar.gz]='uncrustify-0.83.0-qkVd7WhCAACgSQizwSXaihK0_y8RYtX8kgEeKR4-aXNi'
        [uncrustify.tar.gz]='N-V-__8AAHtpjADYwuwWGmuD_g-_sfCssv0hLN0zgXCSHeux'

        [tree-sitter-c.tar.gz]='N-V-__8AAKCLSADrSe-FxKXKw7DrCFBZb78ggafFhppAxuQC'
        [tree-sitter-markdown.tar.gz]='N-V-__8AAP9XVABr5KsZTXvcDyJk7qu2PQc0r4e1uFczkpyy'
        [tree-sitter-lua.tar.gz]='N-V-__8AAE5ZCQA-BW5BOioWVkGcPTjhC5x1Qv07BH3Xt3dR'
        [tree-sitter-vim.tar.gz]='N-V-__8AAPWmVADyg5WrfQyap9wVnE7y5EYV7I3MNEocN96-'
        [tree-sitter-vimdoc.tar.gz]='N-V-__8AAI7VCgBqRcQ-vIxB8DJJFhmLG42p6rfwCWIdypSJ'
    )
    local -A flat_deps=(
        [lua-dev-deps.tar.gz]='N-V-__8AAGevEQCHAkCozca5AIdN9DFc3Luf3g3r2AcbyOrm'
        [tree-sitter-query.tar.gz]='N-V-__8AAMR5AwAzZ5_8S2p2COTEf5usBeeT4ORzh-lBGkWy'
        [tree-sitter-diff.tar.gz]='N-V-__8AAPUcFACL4N4XTVUilDAwPIkX8066VSaipW5tYXDT'
    )

    cd "${srcdir}/neovim"
    mkdir -p zig_deps
    for archive in "${!deps[@]}"; do
        mkdir -p "zig_deps/${deps[$archive]}"
        tar xf "${srcdir}/${archive}" -C "zig_deps/${deps[$archive]}" --strip-components=1
    done
    for archive in "${!flat_deps[@]}"; do
        mkdir -p "zig_deps/${flat_deps[$archive]}"
        tar xf "${srcdir}/${archive}" -C "zig_deps/${flat_deps[$archive]}" --warning=no-unknown-keyword
    done

    mkdir -p "${srcdir}"/zig-{global,local}-cache
}

build() {
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache"
    cd "${srcdir}/neovim"
    zig build "${_zig_options[@]}" \
        --cache-dir "${srcdir}/zig-local-cache"
}

check() {
    cd "${srcdir}/neovim"
    zig-out/bin/nvim --version
    zig-out/bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
    export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache"
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" nvimdoc.hook
    install -Dt "$pkgdir/usr/share/libalpm/scripts/" nvimdoc

    cd "${srcdir}/neovim"
    zig build install "${_zig_options[@]}" \
        --prefix "${pkgdir}/usr" \
        --cache-dir "${srcdir}/zig-local-cache"
    rm -r "${pkgdir}/usr/runtime"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 runtime/org.neovim.nvim.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 runtime/org.neovim.nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
    install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"

    # Include system-wide Vim directory in runtimepath
    install -d "${pkgdir}"/etc/xdg/nvim "${pkgdir}"/usr/share/vim
    echo 'source /usr/share/nvim/archlinux.lua' >"${pkgdir}"/etc/xdg/nvim/sysinit.vim
    cat >"${pkgdir}"/usr/share/nvim/archlinux.lua <<EOF
-- Modify runtimepath to also search the system-wide Vim directory
-- (eg. for Vim runtime files from Arch Linux packages)
vim.opt.runtimepath:append({ '/usr/share/vim/vimfiles', '/usr/share/vim/vimfiles/after' })
EOF
}

# vim:set sw=4 sts=4 et:
