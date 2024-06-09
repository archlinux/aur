# Maintainer: Daniel Sonck <daniel@sonck.nl>
# Contributor: Hubbe King <hubbe128@gmail.com>

pkgname=targetd-git
pkgver=0.10.4
pkgrel=1
pkgdesc="Remote configuration of a LIO-based storage appliance"
arch=('any')
url="https://github.com/open-iscsi/targetd"
license=('GPL3')
provides=('targetd')
conflicts=('targetd')
source=("$pkgname::git+https://github.com/open-iscsi/targetd")
sha256sums=('SKIP')
makedepends=('python-setuptools' 'git')
depends=('targetcli-fb' 'python-rtslib-fb' 'python-configshell-fb' 'libblockdev' 'python-setproctitle' 'python-yaml')
optdepends=('zfs-utils: ZFS block device support'
            'zfs-linux: ZFS block device support'
            'zfs-linux-lts: ZFS block device support'
            'zfs-dkms: ZFS block device support')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -e 's/v//g' -e 's/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir"
  install -D -m755 scripts/targetd "$pkgdir"/usr/bin/targetd
  install -D -m644 ../../targetd.service "$pkgdir"/usr/lib/systemd/system/targetd.service
  install -D -m644 ../../targetd.yaml "$pkgdir"/usr/share/targetd/targetd.yaml
  install -D -m644 targetd.8 "$pkgdir"/usr/share/man/man8/targetd.8
  install -D -m644 targetd.yaml.5 "$pkgdir"/usr/share/man/man5/targetd.yaml.5
}
