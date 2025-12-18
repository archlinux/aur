# Maintainer: msa81 <marko.samiric@gmail.com>
pkgname=ttf-aptos-fontconfig-fix
pkgver=1.0
pkgrel=1
pkgdesc="Fontconfig configuration to fix Aptos font family naming"
arch=('any')
url="https://learn.microsoft.com"
license=('MIT')
depends=('ttf-aptos' 'fontconfig')
install=${pkgname}.install

prepare() {
    cat > "30-aptos-family-fix.conf" <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <!-- Fix for Aptos family naming: assign fullname to family during scan -->
  <match target="scan">
    <test name="fullname" compare="contains">
      <string>Aptos</string>
    </test>
    <edit name="family" mode="assign">
      <name>fullname</name>
    </edit>
  </match>
</fontconfig>
EOF

    # Generate the full MIT License text
    cat > "LICENSE" <<EOF
MIT License

Copyright (c) 2025 Marko Samiric

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}

package() {
    # Install configuration to conf.avail
    install -Dm644 "30-aptos-family-fix.conf" "${pkgdir}/usr/share/fontconfig/conf.avail/30-aptos-family-fix.conf"

    # Create symlink in conf.d for automatic activation
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/30-aptos-family-fix.conf" "${pkgdir}/etc/fonts/conf.d/30-aptos-family-fix.conf"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

