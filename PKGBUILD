# Maintainer: Hubbe King <hubbe128@gmail.com>

pkgname=targetd
pkgver=0.8.12
pkgrel=2
pkgdesc="Remote configuration of a LIO-based storage appliance"
arch=('any')
url="https://github.com/open-iscsi/targetd"
license=('GPL3')
provides=('targetd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-iscsi/targetd/archive/v${pkgver}.tar.gz"
        "zfs-backends.patch")
sha256sums=('c6945f70fbe7c61a7584a572a689ee1446b090fae54de28ff13032b0d1b35bce'
            'faba6d11565f46d0ca139176b50b6fe5145327941fb3c57a47171a7ff69e100f')
makedepends=('python-setuptools')
depends=('targetcli-fb' 'python-rtslib-fb' 'python-configshell-fb' 'libblockdev' 'python-setproctitle' 'python-yaml')
optdepends=('zfs-utils: ZFS block device support'
            'zfs-linux: ZFS block device support'
            'zfs-linux-lts: ZFS block device support'
            'zfs-dkms: ZFS block device support')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch setup.py ../zfs-backends.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -D -m755 scripts/targetd "$pkgdir"/usr/bin/targetd
  install -D -m644 ../../targetd.service "$pkgdir"/usr/lib/systemd/system/targetd.service
  install -D -m644 ../../targetd.yaml "$pkgdir"/usr/share/targetd/targetd.yaml
  install -D -m644 targetd.8 "$pkgdir"/usr/share/man/man8/targetd.8
  install -D -m644 targetd.yaml.5 "$pkgdir"/usr/share/man/man5/targetd.yaml.5
}
