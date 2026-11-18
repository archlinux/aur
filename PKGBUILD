# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=paccor-bin
_pkgname=paccor
pkgver=2.0r18
pkgrel=1
pkgdesc='Platform Attribute Certificate Creator: gather components, create, sign and validate TCG Platform Certificates'
arch=('x86_64')
url='https://github.com/nsacyber/paccor'
license=('Apache-2.0')
depends=('java-runtime-headless>=25' 'bash' 'gcc-libs')
optdepends=('dmidecode: component collection scripts'
            'ethtool: network component collection'
            'jq: component collection scripts'
            'lshw: component collection scripts'
            'nvme-cli: NVMe component collection'
            'tpm2-tools: read the endorsement key (get_ek.sh)')
provides=("$_pkgname")
conflicts=("$_pkgname")
# scripts/{Pcie,Smbios,Storage}Cli are .NET single-file executables: stripping corrupts them.
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname.$pkgver.linux-x64.zip")
sha256sums=('ebf13dfdc027e8bbe6953b845633a34697176e1ced386b4713333537dd76ba2a')

package() {
    cd "$_pkgname-$pkgver"
    # Same layout as upstream's deb: the scripts locate their helpers next to themselves,
    # and the docs refer to /opt/paccor/scripts.
    install -d "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
    cp -r --no-preserve=ownership bin lib scripts docs "$pkgdir/opt/$_pkgname/"
    rm -r "$pkgdir/opt/$_pkgname/scripts/windows"
    ln -s "/opt/$_pkgname/bin/paccor" "$pkgdir/usr/bin/paccor"
    install -Dm644 LICENSE.md NOTICE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md DISCLAIMER.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
