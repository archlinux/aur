# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.25.4
_pkgver=1.25.4
_commit=20b10b35
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://docs.nethermind.io/'
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
conflicts=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
source_x86_64=("https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-x64.zip")
source_aarch64=("https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-arm64.zip")
sha256sums_x86_64=('b843bff5bc7199561aec3e3237caf111a0be6fed6ba386bb879e7a4cee2c6d36')
sha256sums_aarch64=('726c00ef09ef4e890c742d351657d257b9dd70c8cce91e77ec5d47b1bf5b09b2')


package() {
    configs_srcdir="$srcdir/configs"
    plugins_srcdir="$srcdir/plugins"
    data_srcdir="$srcdir/Data"

    # Binaries
    for b in "${provides[@]}"; do
        install -D -m755 --mode=+xr "$srcdir/$b" "$pkgdir/usr/bin/$b"
    done

    # install config recursively
    install -D -m644 "$srcdir/NLog.config" "$pkgdir/etc/nethermind/NLog.config"

    for c in $(find "$configs_srcdir" -type f); do
        install -D -m644 "$c" "$pkgdir/etc/nethermind/configs/${c#$configs_srcdir}"
    done

    # Plugins
    for p in $(find "$plugins_srcdir" -type f); do
        install -D -m644 "$p" "$pkgdir/usr/share/nethermind/plugins/${p#$plugins_srcdir}"
    done

    # Data
    for d in $(find "$data_srcdir" -type f); do
        install -D -m644 "$d" "$pkgdir/usr/share/nethermind/Data/${d#$data_srcdir}"
    done
}
