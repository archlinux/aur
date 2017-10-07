# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgver=6.0.0-beta.8
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=('x86_64')
url="https://github.com/Powershell/Powershell"
license=('MIT')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install
md5sums=('dd698384f5a0f9cd3ce7dd8dd85cbb92')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell_${_pkgver}-1.ubuntu.17.04_amd64.deb")

package() {
    bsdtar xf data.tar.gz

    mv usr "${pkgdir}"
    mv opt "${pkgdir}"

    # Fix man path
    cd "${pkgdir}"
    cp -r usr/local/share usr
    rm -rf usr/local

    # Force powershell to load appropriate libs
    cd usr/bin
    mv powershell lnbin.powershell
    cat > powershell <<EOF
#!/bin/sh
LD_PRELOAD='/usr/lib/libcurl-openssl-1.0.so /usr/lib/openssl-1.0-compat/libssl.so /usr/lib/openssl-1.0-compat/libcrypto.so' exec lnbin.powershell "\$@" 2>/dev/null
EOF
    chmod 755 powershell
}
