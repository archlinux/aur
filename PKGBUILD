# Maintainer: SUDO <justmultiplythinks@gmail.com>
pkgname=rootvim
pkgver=1.1
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
sha256sums=('SKIP' 'SKIP')  # Replace with actual sha256sum if desired

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
}

