pkgname=filey-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, local md files management tool built with Flutter/C++"
arch=('x86_64')
url="https://github.com/Surya-Raghuram/GraphFS.git"
license=('MIT')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc') # Standard dependencies for Flutter/C++ Linux apps
provides=('filey')
conflicts=('filey')

# This tells Arch where to download your files
source=("https://github.com/Surya-Raghuram/GraphFS/releases/download/v${pkgver}/filey-linux-x64.tar.gz"
        "filey.desktop")

# We will generate the real security hashes with 'updpkgsums'
sha256sums=('44575ab9edef58080c54230c632e3ef8457fece44dbd2a6acf4ecabd7f9706d9'
            '5a0c3e5e67205d21178dc5d448976d1e800edcbd9d73612ee2a402db7a7deecc')

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
}