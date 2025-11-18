# Maintainer: Steve Jibson <steve@jibson.com>


pkgname=kumacub
pkgver=0.4.0
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
sha256sums=('044732d4821448504112450976a8b3232f87307cd897e447833f32540d7a5a1c')
backup=(
    "etc/kumacub/config.toml"
)
package() {
    python -m installer --destdir="${pkgdir}" *.whl
    install -Dm755 "${srcdir}/${pkgname}/data/config.toml" "${pkgdir}/etc/kumacub/config.toml"
    install -Dm644 "${srcdir}/${pkgname}/data/kumacub.service" "${pkgdir}/usr/lib/systemd/system/kumacub.service"
}

post_install() {
  echo "Running systemctl daemon-reload to refresh systemd configuration..."
  systemctl daemon-reload
}
