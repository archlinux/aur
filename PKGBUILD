# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ufw-git
pkgver=r1765.g1e5cc76
pkgrel=1
pkgdesc="Uncomplicated firewall"
arch=('any')
url="https://launchpad.net/ufw"
license=('GPL3')
depends=('python' 'iptables')
makedepends=('git')
provides=('ufw')
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
        "ufw.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/service?h=packages/ufw")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "ufw"

  # FS#28769 - move from /lib to /usr/lib
  sed -i -e 's|/lib|/usr/lib|' \
         -e 's|sbin|bin|g' setup.py

  # FS#35458, FS#54110 - correct iptables location
  sed -i -e 's|sbin|bin|g' setup.py
  sed -i -e 's|sbin|bin|g' src/util.py
}

pkgver() {
  cd "ufw"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

package() {
  cd "ufw"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"

  install -Dm644 "$srcdir/ufw.service" "$pkgdir/usr/lib/systemd/system/ufw.service"
}
