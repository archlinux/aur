# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Adam Rutkowski
# Contributor: Fabio Loli
# Contributor: Sergey Kasmy

pkgname=liquidctl-git
pkgver=1.13.0.r92.702bf32
pkgrel=1
pkgdesc='Cross-platform tool and drivers for liquid coolers and other devices'
arch=('any')
url='https://github.com/liquidctl/liquidctl'
license=('GPL3')
depends=(
  i2c-tools
  python
  python-colorlog
  python-crcmod
  python-docopt
  python-hidapi
  python-pillow
  python-pyusb
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
)
optdepends=(
  'python-psutil: use system/hwmon sensors in yoda'
  'python-prometheus_client: export data to Prometheus'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "$pkgname::git+https://github.com/liquidctl/liquidctl.git#branch=main"
)
sha256sums=(
  SKIP
)

pkgver() {
  cd $pkgname

  printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd $pkgname

  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname

  mkdir -p runtime
  XDG_RUNTIME_DIR=runtime python -m pytest

  python -m liquidctl list --verbose
}

package() {
  cd $pkgname

  python -m installer --destdir="$pkgdir" dist/liquidctl-"$(python -m setuptools_scm)"-*.whl

  # documentation
  install -Dm644 -t "$pkgdir"/usr/share/man/man8 liquidctl.8
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/* "$pkgdir"/usr/share/doc/$pkgname

  # device access
  install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d/ extra/linux/71-liquidctl.rules

  # completions
  install -Dm644 extra/completions/liquidctl.bash "$pkgdir"/usr/share/bash-completion/completions/liquidctl

  # extra scripts
  install -Dm755 extra/yoda.py "$pkgdir"/usr/bin/yoda
  install -Dm755 extra/liquiddump.py "$pkgdir"/usr/bin/liquiddump
  install -Dm755 extra/prometheus-liquidctl-exporter.py "$pkgdir"/usr/bin/prometheus-liquidctl-exporter
}
