# Maintainer: Hubbe King <hubbe128@gmail.com>

pkgname=targetd
pkgver=0.10.4
pkgrel=2
pkgdesc="Remote configuration of a LIO-based storage appliance"
arch=('any')
url="https://github.com/open-iscsi/targetd"
license=('GPL3')
provides=('targetd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-iscsi/targetd/archive/v${pkgver}.tar.gz"
        "targetd.service"
        "targetd.yaml")
sha256sums=('1590ea211ee187e07ba019d2a359c83ca07ec10c05696eff951aaaf719b844bb'
            '221c660d89f94c5543991ce62127d1b30da78f133b6683b9f6be79293266aa73'
            'fd9362d5dc32c976107114ef40a983f2440687c89e444c63f22c911df8010b06')

makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('targetcli-fb' 'python-rtslib-fb' 'python-configshell-fb' 'libblockdev' 'python-setproctitle' 'python-yaml')
optdepends=('zfs-utils: ZFS block device support'
            'zfs-linux: ZFS block device support'
            'zfs-linux-lts: ZFS block device support'
            'zfs-dkms: ZFS block device support')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m755 scripts/targetd "$pkgdir"/usr/bin/targetd
  install -D -m644 "$srcdir"/targetd.service "$pkgdir"/usr/lib/systemd/system/targetd.service
  install -D -m644 "$srcdir"/targetd.yaml "$pkgdir"/usr/share/targetd/targetd.yaml
  install -D -m644 targetd.8 "$pkgdir"/usr/share/man/man8/targetd.8
  install -D -m644 targetd.yaml.5 "$pkgdir"/usr/share/man/man5/targetd.yaml.5
}
