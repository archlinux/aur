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
pkgver=0.12.0.r2774.g1c258787d7
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
makedepends=('git' 'zig>=0.15.2' 'tar')
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
    'git+https://github.com/p00f/neovim#branch=push-nwlkmnvmmlrt'
    'ziglua.tar.gz::https://github.com/natecraddock/ziglua/archive/fcf8ccc0e7f59cdb04364df41431ae5ea1f1f9a2.tar.gz'
    'https://github.com/neovim/deps/raw/06ef2b58b0876f8de1a3f5a710473dcd7afff251/opt/lua-dev-deps.tar.gz'
    nvimdoc{,.hook}

    'tree-sitter-c.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/7fa1be1b694b6e763686793d97da01f36a0e5c12.tar.gz'
    'tree-sitter-markdown.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-markdown/archive/2dfd57f547f06ca5631a80f601e129d73fc8e9f0.tar.gz'
    'tree-sitter-lua.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-lua/archive/816840c592ab973500ae9750763c707b447e7fef.tar.gz'
    'tree-sitter-vim.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-vim/archive/3dd4747082d1b717b8978211c06ef7b6cd16125b.tar.gz'
    'tree-sitter-vimdoc.tar.gz::https://github.com/neovim/tree-sitter-vimdoc/archive/f061895a0eff1d5b90e4fb60d21d87be3267031a.tar.gz'
    'https://github.com/tree-sitter-grammars/tree-sitter-query/releases/download/v0.8.0/tree-sitter-query.tar.gz'
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
)
b2sums=(
    'SKIP'
    'SKIP'
    'b27aa3bb208cbb68bac8b7722fb48fc76c4b862d19d1bc7564596316a25623d727c4d8d2e520c0abe416dc78b33c6aacd4b28968206b356e4fe80691886ca48b'
    'd31cf81659e238fada8092755eb9be16f77c00a466107eb5770c6c9c32e043c91e6efada7ddb51663716a0e38ffa6e3d0093b3e6833aa961d845c7451a95491e'
    '26588b9da6459393076723bdfb8d2b16fed882070f2326bf7c35cd272dee9c18df603afb1ae2254cd0a59eff68189caf04828ef165d5de42c7a4222267604101'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '65e10c2d4ca2c661b666629a4ff793b41454eaee5b6f2789526294b3a9903b682dd7fffe4f5de21a8a96069324e6e5ffacba97cf1c74a2b72fb0349abee13fb1'
)
_zig_options=(--system zig_deps -Doptimize=ReleaseFast -Dcpu=native -Dinstall-path=/usr)

pkgver() {
    local nvim_version_git
    cd "${srcdir}/neovim" || exit 1
    _nvim_version="$(awk -F'"' '/\.version = "/ {print $2}' build.zig.zon)"
    nvim_version_git="$(git describe --always --dirty --match 'v*.*.*' | sed -E 's/^v[0-9]+.[0-9]+.[0-9]+-//; s/^([0-9]+)-([a-z0-9]+)/\1\.\2/')"
    printf "%s.r%s\n" "$_nvim_version" "$nvim_version_git"
}

prepare() {
    local zlua_hash lua_dev_deps_hash ts_c_hash ts_markdown_hash ts_lua_hash ts_vim_hash ts_vimdoc_hash ts_query_hash
    zlua_hash='zlua-0.1.0-hGRpC1dCBQDf-IqqUifYvyr8B9-4FlYXqY8cl7HIetrC'
    lua_dev_deps_hash='N-V-__8AAGevEQCHAkCozca5AIdN9DFc3Luf3g3r2AcbyOrm'
    ts_c_hash='N-V-__8AANxPSABzw3WBTSH_YkwaGAfrK6PBqAMqQedkDDim'
    ts_markdown_hash='N-V-__8AABcZUwBZelO8MiLRwuLD1Wk34qHHbXtS4UW3Khys'
    ts_lua_hash='N-V-__8AAHCmCAAf-5sa_C1N5Ts8B7V-vTKqUEMJZVnNkq_y'
    ts_vim_hash='N-V-__8AAMArVAB4uo2wg2XRs8HBviQ4Pq366cC_iRolX4Vc'
    ts_vimdoc_hash='N-V-__8AAI7VCgBqRcQ-vIxB8DJJFhmLG42p6rfwCWIdypSJ'
    ts_query_hash='N-V-__8AAMR5AwAzZ5_8S2p2COTEf5usBeeT4ORzh-lBGkWy'

    cd "${srcdir}/neovim" || exit 1
    mkdir -p zig_deps && cd zig_deps || exit 1

    mkdir -p $zlua_hash \
        $lua_dev_deps_hash \
        $ts_c_hash \
        $ts_markdown_hash \
        $ts_lua_hash \
        $ts_vim_hash \
        $ts_vimdoc_hash \
        $ts_query_hash
    tar xf "${srcdir}/ziglua.tar.gz" -C $zlua_hash --strip-components=1
    tar xf "${srcdir}/lua-dev-deps.tar.gz" -C $lua_dev_deps_hash --warning=no-unknown-keyword
    tar xf "${srcdir}/tree-sitter-c.tar.gz" -C $ts_c_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-markdown.tar.gz" -C $ts_markdown_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-lua.tar.gz" -C $ts_lua_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-vim.tar.gz" -C $ts_vim_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-vimdoc.tar.gz" -C $ts_vimdoc_hash --strip-components=1
    tar xf "${srcdir}/tree-sitter-query.tar.gz" -C $ts_query_hash

    mkdir -p "${srcdir}/zig-global-cache"
}

build() {
    cd "${srcdir}/neovim" || exit 1
    zig build "${_zig_options[@]}" --global-cache-dir "${srcdir}/zig-global-cache"
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
    zig build install "${_zig_options[@]}" --prefix "${pkgdir}/usr" --global-cache-dir "${srcdir}/zig-global-cache"
    rm "${pkgdir}/usr/bin/nlua0"
    rm -r "${pkgdir}/usr/runtime"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 runtime/nvim.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 runtime/nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
    install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"

    # shellcheck disable=SC2164
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
