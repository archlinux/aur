# Maintainer: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
_pkgver=6.0.0-alpha.18
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=('x86_64')
url="https://github.com/Powershell/Powershell"
license=('MIT')
provides=('powershell' 'powershell-bin' 'powershell-git')
options=(staticlibs !strip)
depends=('libunwind' 'icu55' 'libopenssl-1.0-compat' 'libcurl-openssl-1.0')
makedepends=('rsync')
conflicts=('powershell' 'powershell-git')

md5sums=('7b9b04b002f66c14c4ae70b5d1b1a9a6')

source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell_${_pkgver}-1ubuntu1.16.04.1_amd64.deb")

package() {
    bsdtar xf data.tar.gz

    mv usr "${pkgdir}"
    mv opt "${pkgdir}"

    # Fix man path
    cd "${pkgdir}"
    rsync --recursive usr/local/share usr
    rm -rf usr/local

    # Force powershell to load appropriate libs
    cd usr/bin
    mv powershell lnbin.powershell
    cat > powershell <<EOF
#!/bin/sh
LD_PRELOAD='/usr/lib/libcurl-openssl-1.0.so /usr/lib/openssl-1.0-compat/libssl.so /usr/lib/openssl-1.0-compat/libcrypto.so' exec lnbin.powershell "\$@" 2>/dev/null
EOF
    # Fix script permissions
    chmod 755 powershell

}
