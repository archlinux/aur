# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=r89.cd4f38a
pkgrel=3
pkgdesc="Watch anime in cli with Anilist Tracking, Discord RPC, Intro Outro Skipping, etc."
arch=("x86_64")
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('python' 'mpv' 'socat')
makedepends=('git' 'python-pip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Use the number of commits and the short hash as the version number
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  #test
    # No compilation needed for a Python script
    return 0
}

package() {
    # Create the directory for the virtual environment
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # Create a virtual environment in the /usr/share directory
    python -m venv "$pkgdir/usr/share/$pkgname/venv"

    # Install pypresence and requests in the virtual environment
    "$pkgdir/usr/share/$pkgname/venv/bin/pip" install pypresence requests

    # Install the Python script
    install -Dm755 "$srcdir/$pkgname/curd.py" "$pkgdir/usr/share/$pkgname/curd.py"

    install -Dm755 /dev/null "$pkgdir/usr/bin/curd"
    # Create the run script
    cat << 'EOF' > "$pkgdir/usr/bin/curd"
#!/bin/bash

# Path to the virtual environment
VENV_DIR="/usr/share/curd/venv"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Run the Python script
python /usr/share/curd/curd.py "$@"

# Deactivate the virtual environment after running
deactivate
EOF

    # Make the run script executable
    chmod +x "$pkgdir/usr/bin/curd"
}

