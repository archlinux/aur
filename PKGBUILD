# Maintainer: Baldvin Kovacs <baldvin@baldvin.net>
pkgname=tas2781-force-fwload
pkgver=0.2.2
pkgrel=1
pkgdesc="Restore woofer output on laptops with TI TAS2781 smart amps (e.g. Lenovo Yoga Pro 9) by forcing DSP re-staging on every stream"
arch=('any')
url="https://github.com/baldvin-kovacs/tas2781-force-fwload"
license=('MIT')
depends=('alsa-utils' 'systemd' 'zstd')
install=tas2781-force-fwload.install
# Signature is verified against the maintainer key; import it once with:
#   gpg --keyserver keys.openpgp.org --recv-keys 1C711551878F8E1EC2F47E37F57A7B17F6FFB8C8
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('01c2260cf87c04a4a0c771c3d84dac5ba6bfccd1a73b1791476e90b86399de64'
            'SKIP')
validpgpkeys=('1C711551878F8E1EC2F47E37F57A7B17F6FFB8C8') # Baldvin Kovacs <baldvin@baldvin.net>

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr \
       UNITDIR=/usr/lib/systemd/system \
       UDEVRULEDIR=/usr/lib/udev/rules.d \
       MODPROBEDIR=/usr/lib/modprobe.d
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/TECHNICAL.md "$pkgdir/usr/share/doc/$pkgname/TECHNICAL.md"
  install -Dm644 extras/modprobe.d/tas2781-hda-model-quirk.conf.example \
    "$pkgdir/usr/share/doc/$pkgname/extras/modprobe.d/tas2781-hda-model-quirk.conf.example"
  install -Dm644 extras/wireplumber/51-tas2781-keep-sink-open.conf \
    "$pkgdir/usr/share/doc/$pkgname/extras/wireplumber/51-tas2781-keep-sink-open.conf"
}
