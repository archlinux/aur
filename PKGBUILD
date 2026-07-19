# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
pkgname=dnspyex-wine-bin
pkgver=6.6.0
pkgrel=2
pkgdesc="Unofficial continuation of dnSpy: debugger and .NET assembly editor."
arch=('x86_64')
url="https://github.com/dnSpyEx/dnSpy"
license=('GPL-3.0-or-later')
depends=('wine' 'wine-mono' 'ttf-ms-fonts')
makedepends=('unzip' 'icoutils')
source=("$pkgname-$pkgver.zip::https://github.com/dnSpyEx/dnSpy/releases/download/v6.6.0/dnSpy-net-win64.zip")
sha256sums=('8ed48f165dc355e869f3a0037ad4f9216147f995a5ae0258b296eeef1f73aab0')

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
