# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=pake-cli
pkgver=3.11.10
pkgrel=1
pkgdesc="Turn any webpage into a desktop app with one command (Tauri/Rust-based CLI)"
arch=('any')
url="https://github.com/tw93/Pake"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'node-gyp' 'python' 'gcc' 'make')
optdepends=(
    'rust: for building apps with pake-cli'
    'rustup: for building apps with pake-cli (alternative to rust)'
)
options=('!debug')

_pkgname=pake-cli

source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
b2sums=('3585a0ea3f4409122be8478951fce352fcce7c98d0bc3c1d909a329479a12f5da58ff3bc29c3361ced2f4ba0d509e47cf087d6e03323927a5993c43684f9f8ba')

prepare() {
    bsdtar -xf "${_pkgname}-${pkgver}.tgz"

    CXXFLAGS="${CXXFLAGS} -std=c++17" \
    npm install \
        --cache "${srcdir}/npm-cache" \
        --no-fund \
        --no-audit \
        --prefix "${srcdir}/package" \
        node-addon-api@6 node-gyp

    export npm_config_node_gyp="$(which node-gyp)"

    npm install \
        --cache "${srcdir}/npm-cache" \
        --no-fund \
        --no-audit \
        --prefix "${srcdir}" \
        "${srcdir}/package"
}

check() {
    if ! command -v rustc &>/dev/null && ! command -v rustup &>/dev/null; then
        warning "Neither 'rust' nor 'rustup' is installed."
        warning "pake-cli requires one of them to build desktop apps."
        warning "Install with: sudo pacman -S rust  OR  sudo pacman -S rustup"
    fi
}

_installdir="/usr/share/${pkgname}"

package() {
    # Install module files into /usr/share/pake-cli
    install -dm755 "${pkgdir}${_installdir}"
    cp -r "${srcdir}/package/dist"      "${pkgdir}${_installdir}/dist"
    cp -r "${srcdir}/package/src-tauri" "${pkgdir}${_installdir}/src-tauri"
    cp -r "${srcdir}/node_modules"      "${pkgdir}${_installdir}/node_modules"
    install -Dm644 "${srcdir}/package/package.json" \
        "${pkgdir}${_installdir}/package.json"

    # Install license
    install -Dm644 "${srcdir}/package/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Wrapper script: copies pake-cli to user's XDG dir on first run or after update,
    # then executes from there (pake-cli writes to its own directory at runtime)
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/pake" << 'EOF'
#!/bin/bash
PAKE_USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pake-cli"
PAKE_SYS_DIR="/usr/share/pake-cli"

_sys_ver=$(node -p "require('$PAKE_SYS_DIR/package.json').version" 2>/dev/null)
_usr_ver=$(node -p "require('$PAKE_USER_DIR/package.json').version" 2>/dev/null)

if [[ "$_sys_ver" != "$_usr_ver" ]]; then
    echo "pake-cli: updating working directory to version $_sys_ver ..."
    rm -rf "$PAKE_USER_DIR"
    cp -r "$PAKE_SYS_DIR" "$PAKE_USER_DIR"

    # Fix: D-Bus identifier segments must not start with a digit.
    # pake generates identifiers like com.pake.9fd638 which causes a panic.
    node -e "
const fs = require('fs');
const f = process.argv[1];
const s = fs.readFileSync(f, 'utf8');
const patched = s.replace(
    'return \`com.pake.\${postFixHash}\`;',
    'const safeHash = /^[0-9]/.test(postFixHash) ? \"a\" + postFixHash : postFixHash; return \`com.pake.\${safeHash}\`;'
);
fs.writeFileSync(f, patched);
" "$PAKE_USER_DIR/dist/cli.js"
fi

# Auto-detect distro: choose appropriate target unless user specified --targets
if [[ "$*" != *"--targets"* ]]; then
    if grep -qi "debian\|ubuntu\|mint" /etc/os-release 2>/dev/null; then
        if [[ "$(uname -m)" == "aarch64" ]]; then
            set -- "$@" --targets deb-arm64
        else
            set -- "$@" --targets deb
        fi
    elif grep -qi "fedora\|rhel\|centos\|opensuse\|sles" /etc/os-release 2>/dev/null; then
        if [[ "$(uname -m)" == "aarch64" ]]; then
            set -- "$@" --targets rpm-arm64
        else
            set -- "$@" --targets rpm
        fi
    else
        if [[ "$(uname -m)" == "aarch64" ]]; then
            set -- "$@" --targets appimage-arm64
        else
            set -- "$@" --targets appimage
        fi
    fi
fi

exec node "$PAKE_USER_DIR/dist/cli.js" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/pake"
}
