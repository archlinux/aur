# Maintainer: SUDO <justmultiplythinks@gmail.com>
pkgname=rootvim
pkgver=2.6.0
pkgrel=1
pkgdesc="Custom Neovim configuration by realSUDO with isolated profile"
arch=('any')
url="https://github.com/realSUDO/rootVim"
license=('MIT')

# Required dependencies
depends=('neovim' 'python-pip' 'nodejs' 'npm' 'clang' 'xclip' 'wl-clipboard' 'tree-sitter' 'gcc' 'make' 'unzip' 'wget' 'curl' 'tar' 'gzip')
makedepends=('git')
optdepends=('stylua: Lua code formatting'
            'live-server: HTML development server (npm package)'
            'typescript: TypeScript compiler (npm package)')

# Source: your main repo zip + non-interactive install script
source=("https://github.com/realSUDO/rootVim/archive/refs/heads/main.zip"
        "install-noninteractive.sh")
sha256sums=('SKIP'
            'SKIP')

package() {
    # Install configuration files using the non-interactive script
    bash "$srcdir/install-noninteractive.sh" "$pkgdir"

    # Install npm packages globally
    npm install -g typescript live-server 2>/dev/null || true

    # Create wrapper script for isolated Neovim profile
    install -dm755 "$pkgdir/usr/bin"
    cat <<'EOF' > "$pkgdir/usr/bin/rootvim"
#!/bin/bash
NVIM_ROOTVIM_HOME="$HOME/.config/rootvim"
mkdir -p "$NVIM_ROOTVIM_HOME"
cp -r /usr/share/rootvim/* "$NVIM_ROOTVIM_HOME" 2>/dev/null

# Activate bundled Python environment
GLOBAL_PY="/usr/share/rootvim/.globalPython"
export PATH="$GLOBAL_PY/bin:$PATH"

exec nvim -u "$NVIM_ROOTVIM_HOME/init.lua" "$@"
EOF
    chmod +x "$pkgdir/usr/bin/rootvim"
	install -dm755 "$pkgdir/usr/share/rootvim"
	echo "rootvim version: 2.6.0" > "$pkgdir/usr/share/rootvim/VERSION"
	echo "Build date: $(date)" >> "$pkgdir/usr/share/rootvim/VERSION"
}

