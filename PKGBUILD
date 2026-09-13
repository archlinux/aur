# Maintainer: Uri Ramirez <urirocky@no.email>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=6.4.2
pkgrel=1
pkgdesc="Supermicro fan control systemd service for Linux (home) servers"
arch=('any')
url="https://github.com/petersulyok/smfc"
license=('GPL-3.0-only')
depends=('python' 'python-pyudev' 'ipmitool')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-mock' 'python-pyudev')
optdepends=('smartmontools: SAS/SCSI disk temperatures and standby guard feature'
            'nvidia-utils: NVIDIA GPU fan controller (gpu_type=nvidia)'
            'rocm-smi-lib: AMD GPU fan controller (gpu_type=amd)')
backup=('etc/smfc/smfc.conf' 'etc/default/smfc')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7ef4c34ac5b1c23ba1b3b598bb8459bf77034d5e85e477025421640a0ee5890')
sha512sums=('804dfa9b759546edf91a25dd68c8692f56512c648371c47668fc9d14ff850252105c727784588730e53de76519a053eeab11f58a4fce2e967e5b8f80826303f9')
b2sums=('f560f6417de71cc6d7bdb6c52ad69bf36eb54d12b7042c4ba1cfc0804355c3cf5dffb4e6e02f94265d81d46a5d8f759e0f2f9d3c1344d994912738abef880e20')
build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # pyproject sets pythonpath=src, so the suite runs from the source tree.
  # -P keeps CWD off sys.path so only the configured pythonpath is used.
  python -P -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Config, service unit and environment file
  install -Dm644 config/smfc.conf    "$pkgdir/etc/smfc/smfc.conf"
  install -Dm644 config/smfc         "$pkgdir/etc/default/smfc"
  install -Dm644 config/smfc.service "$pkgdir/usr/lib/systemd/system/smfc.service"

  # Man pages (auto-compressed by makepkg)
  install -Dm644 doc/smfc.1        "$pkgdir/usr/share/man/man1/smfc.1"
  install -Dm644 doc/smfc-client.1 "$pkgdir/usr/share/man/man1/smfc-client.1"

  # Sample configurations and documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples" config/samples/*.conf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Preload hwmon temperature-sensor drivers that smfc reads via /sys/class/hwmon
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf" <<'EOF'
# hwmon sensor drivers smfc reads for CPU and disk temperatures
coretemp
k10temp
drivetemp
EOF
}
