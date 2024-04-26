# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.26.0
_pkgver=1.26.0
_commit=0068729c
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
md5sums_x86_64=('9dd1c64756bb721061c4a513490f076e'
                'SKIP')
md5sums_aarch64=('f1593abfe7f5c5b188bdc39ee777340c'
                 'SKIP')
sha256sums_x86_64=('de8ee183ff25e277387fb45ab80cb0ec3bfd053bc5383ac9a38d8663c8bcd2d1'
                   'SKIP')
sha256sums_aarch64=('fb3c9136a3cd48546a18e76d5457845c4829b7a4d4a8fbb1e7b83a001d503553'
                    'SKIP')
b2sums_x86_64=('b52a45024ab427bb5c6a41c23fab799792ab63768c8e8ecc01bfdfc025077d2d92d44a042b60570d728cfd8ae7ed525939da3aeb368817604ac44fcf4c2883fd'
               'SKIP')
b2sums_aarch64=('665ba292017c7061f52abd3c8d1c8969d653b388c31f8bcc88ba56d645090d5c0c92849a49996b6b5bd76e0788790641fd0923a887baaca79a4c8b3787f51e3b'
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
