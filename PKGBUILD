# Maintainer: willemw <willemw12@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances-git
pkgver=4.3.0.7.r0.g372380b
pkgrel=1
pkgdesc='CLI curses-based monitoring tool'
arch=(any)
url=https://github.com/nicolargo/glances
license=(LGPL-3.0-or-later)
makedepends=(git python-setuptools python-build python-installer python-wheel)
depends=(python-psutil python-defusedxml python-orjson python-packaging python-pydantic)
optdepends=(
  'hddtemp: HDD temperature monitoring support'
  'uvicorn: for WebUI / RestFull API'
  'python-jinja: for WebUI / RestFull API'
  'python-fastapi: for WebUI / RestFull API'
  'python-docker: for the Docker monitoring support'
  'python-matplotlib: for graphical/chart support'
  'python-netifaces2: for the IP plugin'
  'python-zeroconf: for the autodiscover mode'
  'python-pystache: templating engine'
  'python-prometheus_client: for the Prometheus export module')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#source=("$pkgname::git+$url.git"
source=(
  "$pkgname::git+$url.git#branch=master"
  glances.service)
sha512sums=('SKIP'
            '49f0d185a37a5c5837e5beb463770c943ede40b2f1b8405e338129e897e97d9fc58373a8586fabc506266e6343cfea3c91b9787ac6832cc97a1ab63d6ad058d4')

# For default 'develop' branch
#pkgver() {
#  local _tag
#
#  cd $pkgname
#  _tag="$(git tag | sort --version-sort | tail -1)"
#  printf "%s.r%s.%s" "$(echo -n "$_tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count "$_tag"..HEAD)" "$(git rev-parse --short=7 "$_tag")"
#}

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 glances.service -t "$pkgdir/usr/lib/systemd/system"

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
