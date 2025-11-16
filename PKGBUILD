# Maintainer: Steve Jibson <steve@jibson.com>


pkgname=kumacub
pkgver=0.1.4
pkgrel=1
pkgdesc="Run local Nagios-compatible checks; push results to Uptime Kuma."
arch=('any')
url="https://github.com/toadstule/kumacub"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-apscheduler'
    'python-httpx'
    'python-pydantic'
    'python-pydantic-settings'
    'python-structlog'
)
optdepends=(
    'monitoring-plugins: useful check scripts'
)
makedepends=(
    'python-installer'
)
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('671e9dd676f40a107feca1b69d551499ceb66a9efd37a13ec9a1ae04fc107d6d')
backup=(
    "etc/kumacub/config.toml"
)
package() {
    python -m installer --destdir="${pkgdir}" *.whl
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.data/data/config.toml" "${pkgdir}/etc/kumacub/config.toml"
    rm -f "${pkgdir}/usr/config.toml"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.data/data/kumacubd.service" "${pkgdir}/usr/lib/systemd/system/kumacubd.service"
    rm -f "${pkgdir}/usr/kumacubd.service"
}

post_install() {
  echo "Running systemctl daemon-reload to refresh systemd configuration..."
  systemctl daemon-reload
}
