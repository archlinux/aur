# Maintainer: Matthew Kavanagh <matt@matthewkavanagh.us>

pkgname=nmgui-git
pkgver=r5.0967f09 # Will be overwritten by pkgver()
pkgrel=1
pkgdesc="A simple and lightweight GTK4-based GUI for managing Wi-Fi and network connections using NetworkManager (nmcli) under the hood."
arch=('x86_64')
url="https://github.com/s-adi-dev/nmgui"
license=('GPL3')
depends=('gtk4' 'networkmanager' 'python-gobject')
makedepends=('git' 'nuitka' 'python-pip' 'python-virtualenv')
options=('!strip' '!debug') # Keep all symbols
provides=('nmgui')
conflicts=('nmgui')
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

    # Set up the python build environment
    python -m venv build_env
    source build_env/bin/activate
    pip install nmcli
    export PYTHONPATH="$(python -c 'import site; print(site.getsitepackages()[0])'):$PYTHONPATH"

    # Build the executable binary
    chmod +x build.bin
    ./build.bin

    # Deactivate the python venv
    deactivate
}

package() {
    cd "$srcdir/nmgui"
    
    # Install the compiled binary
    install -Dm755 dist/main.bin "$pkgdir/usr/bin/nmgui"
    
    # Install desktop file if it exists
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
