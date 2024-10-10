# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=r92.d2c2c15
pkgrel=5
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
    # No compilation needed for a Python script
    return 0
}

package() {
    # Create the directory for the virtual environment and script
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # Check if the virtual environment already exists, if not, create it
    if [ ! -d "$pkgdir/usr/share/$pkgname/venv" ]; then
        python -m venv "$pkgdir/usr/share/$pkgname/venv"
    fi

    # Install or update packages in the virtual environment
    "$pkgdir/usr/share/$pkgname/venv/bin/pip" install --upgrade pypresence requests

    # Install the Python script
    install -Dm755 "$srcdir/$pkgname/curd.py" "$pkgdir/usr/share/$pkgname/curd.py"

    install -Dm755 /dev/null "$pkgdir/usr/bin/curd"
    # Create the run script
    cat << 'EOF' > "$pkgdir/usr/bin/curd"
#!/bin/bash

# Path to the virtual environment
VENV_DIR="/usr/share/curd/venv"

# Check if the virtual environment exists, create if not
if [ ! -d "$VENV_DIR" ]; then
    python -m venv "$VENV_DIR"
    "$VENV_DIR/bin/pip" install pypresence requests
fi

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

