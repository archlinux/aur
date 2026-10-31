# Maintainer: Uri Ramirez <urirocky@no.email>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
pkgname=smfc
pkgver=6.5.0
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
sha256sums=('8fbad75eb0c15c54217724c4763e69f44132141ed4d35e9b0ad6d4ee14f9f102')
sha512sums=('4c683138733e0471752128b7ceecbb771d042bed0b18ecfb4743976657851ba0562227b168456126b6f7f7454fa089ce3e42bdfd3026cad1e73f85b91018ffa6')
b2sums=('e137db11eb094d464ef9c3a594399705ab9daf6873847cb3883b61434c2e8d27be82bc8350a89130ce59012598b548ad1bcc6194b448ebc2a5b16b8bf2ff76f8')
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
