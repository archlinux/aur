# Maintainer: RedVelvetCake11 <membermadde.insiddev25120@hotmail.com>

pkgname=weaver-git
pkgver=1.0
pkgrel=1
pkgdesc="A simple web browser written in Python, GTK4, libadwaita, and WebKitGTK"
arch=('any')
url="https://rvc11.is-a.dev"
license=('GPL')
depends=('python' 'python-gobject' 'python-pillow' 'python-requests' 'sqlite'
         'gtk4' 'webkitgtk-6.0' 'libadwaita' 'python-gobject' 'git')
makedepends=('python-setuptools' 'python-pip')  # If you need to build from source
source=('git+https://github.com/TwilightInc/weaver.git')    # Add your source file or path
sha256sums=('SKIP')  # Replace with actual checksum for source file if necessary

pkgver() {
    grep "VERSION" $srcdir/weaver/main.py | head -1 | sed 's/"/ /g' | awk '{ print $2 }'
}

prepare() {
    # resort to PIP installation
    sudo pip install configparser --break-system-packages
}

package() {
    # Create necessary directories for installation
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
    mkdir -p $pkgdir/usr/share/applications

    # Perform the installation
    make -C "$srcdir/weaver" prefix="/usr" install DESTDIR="$pkgdir"

    # Create a symbolic link (for executables) inside the bin directory
    # We avoid using 'ln -sf' directly on the original location since fakeroot might simulate different paths
    ln -sf /usr/lib/weaver/main.py $pkgdir/usr/bin/weaver

    # Show a message when the installation is complete
    echo "Installation completed successfully."
}

