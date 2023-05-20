# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ufw-git
pkgver=0.36.2.r105.g76adc7a
pkgrel=1
pkgdesc="Uncomplicated firewall"
arch=('any')
url="https://launchpad.net/ufw"
license=('GPL3')
depends=('python' 'iptables')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("ufw=$pkgver")
conflicts=('ufw')
backup=('etc/default/ufw'
        'etc/ufw/after.rules'
        'etc/ufw/after6.rules'
        'etc/ufw/before.rules'
        'etc/ufw/before6.rules'
        'etc/ufw/sysctl.conf'
        'etc/ufw/ufw.conf'
        'etc/ufw/user.rules'
        'etc/ufw/user.rules'
        'etc/ufw/user6.rules')
source=("git+https://git.launchpad.net/ufw"
        "ufw.service::https://gitlab.archlinux.org/archlinux/packaging/packages/ufw/-/raw/main/service")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "ufw"

  # FS#28769 - move from /lib to /usr/lib
  sed -i -e 's|/lib|/usr/lib|' \
         -e 's|sbin|bin|g' "setup.py"

  # FS#35458, FS#54110 - correct iptables location
  sed -i -e 's|sbin|bin|g' "setup.py"
  sed -i -e 's|sbin|bin|g' "src/util.py"
}

pkgver() {
  cd "ufw"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ufw"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "ufw"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 "$srcdir/ufw.service" -t "$pkgdir/usr/lib/systemd/system"
}
