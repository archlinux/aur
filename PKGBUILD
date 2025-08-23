# Maintainer: SUDO <justmultiplythinks@gmail.com>
pkgname=rootvim
pkgver=1.0
pkgrel=1
pkgdesc="Custom Neovim configuration by realSUDO with isolated profile"
arch=('any')
url="https://github.com/realSUDO/rootVim"
license=('MIT')
depends=('neovim' 'git')
source=("https://github.com/realSUDO/rootVim/archive/refs/heads/main.zip")
sha256sums=('SKIP')  # Replace with actual sha256sum later

package() {
    # Install config to /usr/share/rootvim
    install -dm755 "$pkgdir/usr/share/rootvim"
    cp -r "$srcdir/rootVim-main/"* "$pkgdir/usr/share/rootvim/"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat << 'EOF' > "$pkgdir/usr/bin/rootvim"
#!/bin/bash
NVIM_ROOTVIM_HOME="$HOME/.config/rootvim"
mkdir -p "$NVIM_ROOTVIM_HOME"

# Copy default config only if folder is empty
if [ -z "$(ls -A "$NVIM_ROOTVIM_HOME")" ]; then
    cp -r /usr/share/rootvim/* "$NVIM_ROOTVIM_HOME"
fi

# Launch Neovim with isolated config
if [[ -n "$1" ]]; then
    NVIM_APPNAME=rootvim nvim -u "$NVIM_ROOTVIM_HOME/init.lua" "$@"
else
    NVIM_APPNAME=rootvim nvim -u "$NVIM_ROOTVIM_HOME/init.lua"
fi
EOF
    chmod +x "$pkgdir/usr/bin/rootvim"
}
