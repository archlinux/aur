# Maintainer: Matthew Kavanagh (https://github.com/mkavanagh-23)
# Original Author: Aditya Singh (https://github.com/s-adi-dev)

pkgname=nmgui-git
pkgver=r7.5e12fd0 # Will be overwritten by pkgver()
pkgrel=3
pkgdesc="A simple and lightweight GTK4-based GUI for managing Wi-Fi and network connections using NetworkManager (nmcli) under the hood."
arch=('x86_64')
url="https://github.com/s-adi-dev/nmgui"
license=('GPL3')
depends=('gtk4' 'networkmanager' 'python-gobject')
makedepends=('git' 'nuitka' 'python-pip' 'python-virtualenv')
optdepends=('python-nmcli: for enhanced NetworkManager integration')
options=('!strip' '!debug') # Keep all symbols
provides=('nmgui')
conflicts=('nmgui' 'nmgui-bin')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

# Dynamic version based on git commit
pkgver() {
    cd "$srcdir/nmgui"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/nmgui/build"

    # Set up the python build environment (include system packages)
    python -m venv --system-site-packages build_env
    source build_env/bin/activate

    # Check for system-installed python-nmcli
    if ! python -c "import nmcli" 2>/dev/null; then
      echo "Package python-nmcli not found. Installing via pip"
      pip install nmcli
    else
      echo "Package python-nmcli found. Using system package"
    fi
    export PYTHONPATH="$(python -c 'import site; print(site.getsitepackages()[0])'):$PYTHONPATH"

    # Build the executable
    chmod +x build.bin
    ./build.bin

    # Deactivate the venv
    deactivate
}

package() {
    cd "$srcdir/nmgui"
    
    # Install the compiled binary
    install -Dm755 dist/main.bin "$pkgdir/usr/bin/nmgui"
    
    # Install desktop file
    if [ -f "nmgui.desktop" ]; then
        install -Dm644 nmgui.desktop "$pkgdir/usr/share/applications/nmgui.desktop"
    fi
    
    # Install documentation
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
