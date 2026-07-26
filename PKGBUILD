# Maintainer: Uri Ramirez <urirocky@no.email>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=6.0.0
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
sha256sums=('4d1aea5b0f66479026352c29bd93568a50f54261af89d093232a109cfeb43e54')

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
