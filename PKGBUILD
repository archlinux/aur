# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.27.0
_pkgver=1.27.0
_commit=220b5b85
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
conflicts=('nethermind' 'nethermind-cli' 'nethermind-launcher' 'Nethermind.Runner')
source_x86_64=(
	"https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-x64.zip"
	"https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-x64.zip.asc"
)
source_aarch64=(
	"https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-arm64.zip"
	"https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-arm64.zip.asc"
)
md5sums_x86_64=('159ef227c61e39b2448aee95a71a5d2b'
                'SKIP')
md5sums_aarch64=('be1c88493d03405d786b6f7f5db022f8'
                 'SKIP')
sha256sums_x86_64=('6c4a1655295ae22e67437602198c8b1142758958288253f9810dd234b664f028'
                   'SKIP')
sha256sums_aarch64=('7b83d9b36de7eb751a19ea88c4acaf7d28918672867f2b5d4cbf315198626dcc'
                    'SKIP')
b2sums_x86_64=('33d65819f7769df73e8b22915f865d1a92d1031811d396482d141e9a885ecee0a44ddc118c60ab2de890b8deda0b3c2084cec256ca3c6635d6852de6730cb431'
               'SKIP')
b2sums_aarch64=('3b12bf20b4d59d055201858c1c9788fc477db00f4ec0471bf1eab81f62b504e4103f3de8645061c859c3be3ffa8b05612c05bfdd818fed8cba1766b0d97f6f24'
                'SKIP')
# Can be acquired with `gpg --receive-keys CB6DA407 34E353C6` (listed at the bottom of https://downloads.nethermind.io/)
validpgpkeys=('6942FB745ECE67D86CDA45704770A0C134E353C6' 'EECCEA1473108E3222D76722D39BE1DDCB6DA407')

backup=('etc/nethermind/NLog.config')

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
