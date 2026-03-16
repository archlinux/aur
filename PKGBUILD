# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
pkgname=dnspyex-wine-bin
pkgver=v6.5.1
pkgrel=3
pkgdesc="Unofficial continuation of dnSpy: debugger and .NET assembly editor."
arch=('x86_64')
url="https://github.com/dnSpyEx/dnSpy"
license=('GPL-3.0-or-later')
depends=('wine' 'wine-mono' 'ttf-ms-fonts')
makedepends=('unzip' 'icoutils')
source=("https://github.com/dnSpyEx/dnSpy/releases/download/v6.5.1/dnSpy-net-win64.zip")
sha256sums=('7b4e16ffdeded7e27785377f110388e4afb52250d4606246d52154e935be0ee8')

# Extract icon from dll with icoutils
prepare() {
    wrestool -x --output="$srcdir/$pkgname.ico" -t14 "$srcdir/bin/dnSpy.dll"
    icotool -x "$srcdir/$pkgname.ico" -o "$srcdir/$pkgname.png"
}

package() {
    install -dm755 "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps" "$pkgdir/usr/bin"
	install -m644 "$srcdir/dnSpy.exe" "$pkgdir/usr/share/$pkgname"
    install -m644 "$srcdir/dnSpy.Console.exe" "$pkgdir/usr/share/$pkgname"
    cp -r "$srcdir/bin" "$pkgdir/usr/share/$pkgname"
    install -m644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    install -m644 "$srcdir"/bin/LicenseInfo/* "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/bin/dnspy" << EOF
#!/bin/bash
wine /usr/share/$pkgname/dnSpy.exe & disown
EOF

    chmod 755 "$pkgdir/usr/bin/dnspy"
    
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=dnSpy
Comment=Debugger and .NET assembly editor.
Exec=/usr/bin/dnspy
Icon=/usr/share/pixmaps/$pkgname.png
Type=Application
Terminal=false
Categories=Development;.NET;Reverse Engineering;
EOF

    chmod 644 "$pkgdir/usr/share/applications/$pkgname.desktop"
}
