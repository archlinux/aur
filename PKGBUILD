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
pkgver=0.13.0.r1829.gf238788601
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
    lua51-lpeg
    luajit
    tree-sitter
    unibilium
)
makedepends=('git' 'zig>=0.16.0' 'tar')
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
    'git+https://github.com/neovim/neovim.git'
    'ziglua.tar.gz::https://github.com/natecraddock/ziglua/archive/9ae39fa50b1ab8427d35f963216116d7bff1e584.tar.gz'
    'translate_c.tar.gz::https://codeberg.org/ziglang/translate-c/archive/46b5609b5ac4c0a896217d1d984f3ae50e4810b5.tar.gz'
    'aro.tar.gz::https://github.com/Vexu/arocc/archive/5f5a050569a95ecc40a426f0c3666ae7ef987ede.tar.gz'
    'https://github.com/neovim/deps/raw/06ef2b58b0876f8de1a3f5a710473dcd7afff251/opt/lua-dev-deps.tar.gz'
    nvimdoc{,.hook}

    'tree-sitter-c.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/b780e47fc780ddc8da13afa35a3f4ed5c157823d.tar.gz'
    'tree-sitter-markdown.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-markdown/archive/f969cd3ae3f9fbd4e43205431d0ae286014c05b5.tar.gz'
    'tree-sitter-lua.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-lua/archive/10fe0054734eec83049514ea2e718b2a56acd0c9.tar.gz'
    'tree-sitter-vim.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-vim/archive/3092fcd99eb87bbd0fc434aa03650ba58bd5b43b.tar.gz'
    'tree-sitter-vimdoc.tar.gz::https://github.com/neovim/tree-sitter-vimdoc/archive/f061895a0eff1d5b90e4fb60d21d87be3267031a.tar.gz'
    'https://github.com/tree-sitter-grammars/tree-sitter-query/releases/download/v0.8.0/tree-sitter-query.tar.gz'
    'uncrustify_zig.tar.gz::https://codeberg.org/allyourcodebase/uncrustify/archive/2cdf880e4ffbe438a7946368cd45fca2df9f0f7a.tar.gz'
    'uncrustify.tar.gz::https://github.com/uncrustify/uncrustify/releases/download/uncrustify-0.83.0/uncrustify-0.83.0.tar.gz'
    'zig-compile-commands.tar.gz::https://github.com/the-argus/zig-compile-commands/archive/9400cd1963ea6bb58fe47ba7d9700075b808cdd2.tar.gz'
    'tree-sitter-diff.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-diff/releases/download/v0.2.0/tree-sitter-diff.tar.gz'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '49f8399e453103064a23c65534f266f3067cda716b6502f016bfafeed5799354'
    '0881cf186965ac3d601c25866c7540f8d82064e7a84f5b644ca6a41b54c2c9a6'
    '69794b783cb004ec9fe2bbe2d7ac347681701bbcb15304b0324d8ec95fbd6e81'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '60e89c03d2f2883ca990089ff8cb641e89723164dc238e849d0350380cdce928'
    'SKIP'
    'SKIP'
    'SKIP'
    '5b785143a58878602ea8110498fe41a8b8e5ec34445bd2bf5468b5d2aab369c0'
)
noextract=(
    'ziglua.tar.gz'
    'lua-dev-deps.tar.gz'

    'tree-sitter-c.tar.gz'
    'tree-sitter-markdown.tar.gz'
    'tree-sitter-lua.tar.gz'
    'tree-sitter-vim.tar.gz'
    'tree-sitter-vimdoc.tar.gz'
    'tree-sitter-query.tar.gz'
    'uncrustify_zig.tar.gz'
    'uncrustify.tar.gz'
    'zig-compile-commands.tar.gz'
    'tree-sitter-diff.tar.gz'
)
_zig_options=(--system zig_deps -Doptimize=ReleaseFast -Dcpu=native -Dinstall-path=/usr)

pkgver() {
    local nvim_version_git
    cd "${srcdir}/neovim"
    _nvim_version="$(awk -F'"' '/\.version = "/ {print $2}' build.zig.zon)"
    nvim_version_git="$(git describe --always --dirty --match 'v*.*.*' | sed -E 's/^v[0-9]+.[0-9]+.[0-9]+-//; s/^([0-9]+)-([a-z0-9]+)/\1\.\2/')"
    printf "%s.r%s\n" "$_nvim_version" "$nvim_version_git"
}

prepare() {
    local zlua_hash lua_dev_deps_hash ts_c_hash ts_markdown_hash ts_lua_hash ts_vim_hash ts_vimdoc_hash ts_query_hash
    zlua_hash='zlua-0.1.0-hGRpC1mUBQCNQf4CnmRTM4I7gxE3YpCvZ-p2EarlcyER'
    lua_dev_deps_hash='N-V-__8AAGevEQCHAkCozca5AIdN9DFc3Luf3g3r2AcbyOrm'
    translate_c_hash='translate_c-0.0.0-Q_BUWpf0BgAwrh5AM-acJcslN_YPEhcoCVKbbNjwuUTJ'
    aro_hash='aro-0.0.0-JSD1Qi7QNgDnfcrdEJf82v3o6MhZySjYVrtdfEf3E4Se'
    ts_c_hash='tree_sitter_c-0.24.2-y5boS-ptQADHoCoVfjGT_nFtFQ5LbomIkW0fxG3_cmdB'
    ts_markdown_hash='N-V-__8AAOphUwCl_jXY5BvJ_I-kB6cZuE48ZpMar9Gq2SiD'
    ts_lua_hash='N-V-__8AAE5ZCQA-BW5BOioWVkGcPTjhC5x1Qv07BH3Xt3dR'
    ts_vim_hash='N-V-__8AAPWmVADyg5WrfQyap9wVnE7y5EYV7I3MNEocN96-'
    ts_vimdoc_hash='N-V-__8AAI7VCgBqRcQ-vIxB8DJJFhmLG42p6rfwCWIdypSJ'
    ts_query_hash='N-V-__8AAMR5AwAzZ5_8S2p2COTEf5usBeeT4ORzh-lBGkWy'
    ts_diff_hash='N-V-__8AAPUcFACL4N4XTVUilDAwPIkX8066VSaipW5tYXDT'
    uncrustify_zig_hash='uncrustify-0.83.0-qkVd7cVCAADAg1kS3ctVBhY2gkxEIs-W8wgurLadbgC-'
    uncrustify_hash='N-V-__8AAHtpjADYwuwWGmuD_g-_sfCssv0hLN0zgXCSHeux'
    zig_cc_hash='zig_compile_commands-0.0.1-OZg5-e_JAAAGg1WHAePtq4l4Uvjs34BexnFFCZk63EaG'

    cd "${srcdir}/neovim"
    mkdir -p zig_deps && cd zig_deps

    mkdir -p $zlua_hash \
        $translate_c_hash \
        $aro_hash \
        $lua_dev_deps_hash \
        $ts_c_hash \
        $ts_markdown_hash \
        $ts_lua_hash \
        $ts_vim_hash \
        $ts_vimdoc_hash \
        $ts_query_hash \
        $ts_diff_hash \
        $uncrustify_zig_hash \
        $uncrustify_hash \
        $zig_cc_hash
    tar xf "${srcdir}/ziglua.tar.gz" -C $zlua_hash --strip-components=1
    tar xf "${srcdir}/translate_c.tar.gz" -C $translate_c_hash --strip-components=1
    tar xf "${srcdir}/aro.tar.gz" -C $aro_hash --strip-components=1
    tar xf "${srcdir}/lua-dev-deps.tar.gz" -C $lua_dev_deps_hash --warning=no-unknown-keyword
    tar xf "${srcdir}/tree-sitter-c.tar.gz" -C $ts_c_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-markdown.tar.gz" -C $ts_markdown_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-lua.tar.gz" -C $ts_lua_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-vim.tar.gz" -C $ts_vim_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-vimdoc.tar.gz" -C $ts_vimdoc_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-query.tar.gz" -C $ts_query_hash
    tar xf "${srcdir}/tree-sitter-diff.tar.gz" -C $ts_diff_hash
    tar xf "${srcdir}/uncrustify_zig.tar.gz" -C $uncrustify_zig_hash --strip-components=1
    tar xf "${srcdir}/uncrustify.tar.gz" -C $uncrustify_hash --strip-components=1
    tar xf "${srcdir}/zig-compile-commands.tar.gz" -C $zig_cc_hash --strip-components=1

    mkdir -p "${srcdir}/zig-global-cache"
    mkdir -p "${srcdir}/zig-local-cache"
}

build() {
    cd "${srcdir}/neovim"
    zig build "${_zig_options[@]}" \
        --global-cache-dir "${srcdir}/zig-global-cache" \
        --cache-dir "${srcdir}/zig-local-cache"
}

check() {
    cd "${srcdir}/neovim"
    zig-out/bin/nvim --version
    zig-out/bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" nvimdoc.hook
    install -Dt "$pkgdir/usr/share/libalpm/scripts/" nvimdoc

    pushd . >/dev/null
    cd "${srcdir}/neovim"
    zig build install "${_zig_options[@]}" \
        --prefix "${pkgdir}/usr" \
        --global-cache-dir "${srcdir}/zig-global-cache" \
        --cache-dir "${srcdir}/zig-local-cache"
    rm -r "${pkgdir}/usr/runtime"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 runtime/org.neovim.nvim.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 runtime/org.neovim.nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
    install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"

    popd >/dev/null

    # Include system-wide Vim directory in runtimepath
    mkdir -p "${pkgdir}"/etc/xdg/nvim
    echo 'source /usr/share/nvim/archlinux.lua' >"${pkgdir}"/etc/xdg/nvim/sysinit.vim

    mkdir -p "${pkgdir}"/usr/share/vim
    cat >"${pkgdir}"/usr/share/nvim/archlinux.lua <<EOF
-- Modify runtimepath to also search the system-wide Vim directory
-- (eg. for Vim runtime files from Arch Linux packages)
vim.opt.runtimepath:append({ '/usr/share/vim/vimfiles', '/usr/share/vim/vimfiles/after' })
EOF
}

# vim:set sw=4 sts=4 et:
