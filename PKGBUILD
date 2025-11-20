# Maintainer: SUDO <justmultiplythinks@gmail.com>
pkgname=rootvim
pkgver=2.0.0
pkgrel=1
pkgdesc="Custom Neovim configuration by realSUDO with isolated profile"
arch=('any')
url="https://github.com/realSUDO/rootVim"
license=('MIT')

# Required dependencies
depends=('neovim' 'python-pip' 'nodejs' 'npm' 'clang' 'xclip' 'wl-clipboard') #can remove nodejs , npm , clang and python-pip as per comfort
makedepends=('git')
optdepends=('stylua: Lua code formatting')

# Source: your main repo zip + non-interactive install script
source=("https://github.com/realSUDO/rootVim/archive/refs/heads/main.zip"
        "install-noninteractive.sh")
sha256sums=('4ae668099d8a2247e33ce2328a237e0d2c338a26c58fd5d12f4542a75557bea7'
            'c97fc0a5efcfad513d72131067e5ddbf2799d6ad8e9f684abd6e4b1ea65bbc45')

package() {
    # Install configuration files using the non-interactive script
    bash "$srcdir/install-noninteractive.sh" "$pkgdir"

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
	echo "rootvim version: 1.1.2" > "$pkgdir/usr/share/rootvim/VERSION"
	echo "Build date: $(date)" >> "$pkgdir/usr/share/rootvim/VERSION"
}

