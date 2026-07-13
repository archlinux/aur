# Maintainer: Will Pimblett <aur@wjdp.uk>
pkgname=moderncsv-bin
pkgver=2.4.3
pkgrel=1
pkgdesc='An Intuitive CSV File Editor/Viewer'
arch=('x86_64')
url='https://www.moderncsv.com/'
license=('custom:Proprietary')
source=("https://www.moderncsv.com/release/ModernCSV-Linux-v$pkgver.tar.gz"
		"ModernCSV-LICENSE.md")
sha256sums=('7303e1284659ddcda9fcadc11d96e932a6522e3b480aa4d12e2479ce2194ff92'
            '016bbbd5ae1785e2220d082bbaf9f54f2ca1b9be912ff3007eb4b860eaac87e1')

package() {
    cd "$srcdir/moderncsv$pkgver"

    # Install to /opt/moderncsv
    install -dm755 "$pkgdir/opt/moderncsv"
    cp -a . "$pkgdir/opt/moderncsv"

    # Install desktop file with QT_QPA_PLATFORM fix
    install -Dm644 moderncsv.desktop "$pkgdir/usr/share/applications/moderncsv.desktop"
	# The application only support XCB, this needs setting to run in wayland
    sed -i 's|Exec=/opt/moderncsv/moderncsv|Exec=env QT_QPA_PLATFORM=xcb /opt/moderncsv/moderncsv|' \
        "$pkgdir/usr/share/applications/moderncsv.desktop"

    # Install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -a icons/hicolor "$pkgdir/usr/share/icons/"

    # Create symlink to executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/moderncsv/moderncsv "$pkgdir/usr/bin/moderncsv"

    # Install licence
    install -Dm644 "$srcdir/ModernCSV-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
