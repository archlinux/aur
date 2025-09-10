# Maintainer: Syed Ali Rizvi <rizvihuihuihui@icloud.com>
pkgname=vimasm
pkgver=1.0.1
pkgrel=1
pkgdesc="Neovim setup with a default welcome.asm demo"
arch=('any')
url="https://github.com/sanecodeguy/vimasm"
license=('MIT')
depends=('neovim')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm644 welcome.asm "$pkgdir/usr/share/$pkgname/welcome.asm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 init.lua "$pkgdir/usr/share/nvim/site/lua/vimasm/init.lua"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/vimasm" <<'EOF'
#!/bin/bash
# vimasm launcher

# Directories
VIMASM_DIR="$HOME/.config/vimasm"
VIMASM_DEMO="$HOME/vimasm_demo"
DOSBOX_CFG="$HOME/.dosbox/dosbox-vimasm.conf"
NEOVIM_PLUGIN="$HOME/.config/nvim/lua/vimasm"

# First run setup
if [ ! -d "$VIMASM_DIR" ]; then
    echo "Setting up vimasm for the first time..."
    mkdir -p "$VIMASM_DIR"
    cp -r /usr/share/vimasm/* "$VIMASM_DIR/"
fi

# Demo asm file
if [ ! -d "$VIMASM_DEMO" ]; then
    mkdir -p "$VIMASM_DEMO"
    cp /usr/share/vimasm/welcome.asm "$VIMASM_DEMO/" 2>/dev/null || true
fi

# DOSBox config
if [ ! -f "$DOSBOX_CFG" ]; then
    mkdir -p "$(dirname "$DOSBOX_CFG")"
    cp /usr/share/vimasm/dosbox-vimasm.conf "$DOSBOX_CFG" 2>/dev/null || true
fi

# Neovim plugin
if [ ! -d "$NEOVIM_PLUGIN" ]; then
    mkdir -p "$(dirname "$NEOVIM_PLUGIN")"
    cp -r /usr/share/vimasm/init.lua "$NEOVIM_PLUGIN/" 2>/dev/null || true
fi

# Always open welcome.asm if no args
if [ $# -eq 0 ]; then
    exec nvim "$VIMASM_DEMO/welcome.asm"
else
    exec nvim "$@"
fi
EOF
}

