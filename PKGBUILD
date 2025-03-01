# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=nethermind-ethereum-bin
_pkgname=nethermind
pkgver=1.31.2
_pkgver=1.31.2
_commit=25e26aaf
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
md5sums_x86_64=('1446bba8a937b3c0a8caa852b9f58def'
                'SKIP')
md5sums_aarch64=('b04bc96314f99bcf6dd346269487fb8d'
                 'SKIP')
sha256sums_x86_64=('af98f8a4fd9bf8c4364ab721d39d347bed94b769dd5c297f30889bba6aa91b00'
                   'SKIP')
sha256sums_aarch64=('d8e5c35e7407adcacb236b2e2d16199eb0be0811f47ecd3aaae769821ee35483'
                    'SKIP')
b2sums_x86_64=('2b2e0685fa60965d4cad861fcefb183cf5e42469a8884b28bfa0fcd32dff7b86dd66b6b221b6beda0671510d9c12a901986b1490b6395361ed21e237335da5d5'
               'SKIP')
b2sums_aarch64=('d9445edb581fdccd7db57ad8b3039052759a8875fefcebe8d40d781271888a78425244b313b33527a6c77fc0ff8b4e18b4043d8f089a6857bd03ca704d86111a'
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
