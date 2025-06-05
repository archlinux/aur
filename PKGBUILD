# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.31.11
_pkgver=1.31.11
_commit=2be1890e
pkgrel=1
pkgdesc='A robust execution client for Ethereum node operators. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://downloads.nethermind.io/'
license=('LGPL-3.0-only')
depends=('zlib' 'base-devel')
provides=('nethermind' 'nethermind-cli' 'Nethermind.Runner')
conflicts=('nethermind' 'nethermind-cli' 'Nethermind.Runner')
source_x86_64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-x64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-x64.zip.asc"
)
source_aarch64=(
  "https://github.com/NethermindEth/nethermind/releases/download/${_pkgver}/nethermind-${_pkgver}-${_commit}-linux-arm64.zip"
  "https://nethdev.blob.core.windows.net/builds/nethermind-${_pkgver}-${_commit}-linux-arm64.zip.asc"
)
md5sums_x86_64=('25574b3affd0ef227efaf45ed38633d3'
                'SKIP')
md5sums_aarch64=('062d95ce7ef8c10cafeb1799cf78d510'
                 'SKIP')
sha256sums_x86_64=('f1dc84a798b5c9305577206f4b506c302c6eaac8075daed329ba603093ca6961'
                   'SKIP')
sha256sums_aarch64=('90f201e5c2c49804bbdfe9f8e97b3364caca289a19c3489c62f5b9b92c37bd4e'
                    'SKIP')
b2sums_x86_64=('66379eab08b1918df4ec2338f82ee998df3aab0980114afa74a54cb7dd69d631c01b6e1f55deaf2f0fe73f2414ca0111336255679fa06d4e3198712a39757e86'
               'SKIP')
b2sums_aarch64=('6fdfe704d2f8f15b394ed91ea11e021f17740a14d967085ac9417d622b38db6fd900ddf3e6f8f174d1bd7a741c121a808ca9fc00cd45f0faeda8f3a8644eb157'
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
