pkgname=filey-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast, local md files management tool built with Flutter/C++"
arch=('x86_64')
url="https://github.com/Surya-Raghuram/GraphFS.git"
license=('MIT')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc') # Standard dependencies for Flutter/C++ Linux apps
provides=('filey')
conflicts=('filey')

# This tells Arch where to download your files
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Surya-Raghuram/GraphFS/releases/download/v${pkgver}/filey-linux-v1.0.2.tar.gz"
        "filey.desktop"
        "icon.png")
# We will generate the real security hashes with 'updpkgsums'
sha256sums=('96ba8cf556942853a23e7179a1092f5de41d84d44a48e092c2d4afa75c15a9e5'
            '9172ab52667ae49009425f74afc92d245387a93b2941f23434f71f39803283d5'
            '260a076e962bc0bb2c275d7671ca2e4b3391437fadf8538ee1198c37793193f5')

package() {
    # 1. Create the system directories we need
    install -d "$pkgdir/opt/filey"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"

    # 2. Copy the Flutter bundle files directly from srcdir
    # Flutter usually outputs 'lib', 'data', and the executable.
    cp -r "$srcdir/lib" "$srcdir/filey" "$pkgdir/opt/filey/"
    
    if [ -d "$srcdir/data" ]; then
        cp -r "$srcdir/data" "$pkgdir/opt/filey/"
    fi

    # 3. Make the main binary executable
    chmod +x "$pkgdir/opt/filey/filey"

    # 4. Create a symlink in /usr/bin so the user can just type 'filey'
    ln -s "/opt/filey/filey" "$pkgdir/usr/bin/filey"

    # 5. Install the desktop shortcut
    install -Dm644 "$srcdir/filey.desktop" "$pkgdir/usr/share/applications/filey.desktop"

    # 6. Install the application icon
    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/filey.png"
}
