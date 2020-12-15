# Maintainer: Luka Žaja (luka.zaja at protonmail dot com)

pkgname=refind-btrfs
pkgver=0.1.5
pkgrel=1
pkgdesc="Generate rEFInd manual boot stanzas from btrfs snapshots"
url="https://github.com/Venom1991/refind-btrfs"
arch=(any)
license=('GPL3')
makedepends=('python-setuptools')
depends=('btrfs-progs'
         'python-antlr4'
         'python-injector'
         'python-more-itertools'
         'python-pid'
         'python-systemd'
         'python-tomlkit'
         'python-transitions'
         'python-watchdog'
         'refind')
source=("https://github.com/Venom1991/refind-btrfs/archive/v${pkgver}.tar.gz")
sha256sums=('2305da382f6efe7f99e7e6c2a3704e6051ee4466115c5ded799c15057fdcd32a')

build() {
    cd "${srcdir}/refind-btrfs-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/refind-btrfs-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    mkdir -p -m755 "${pkgdir}/var/lib/${pkgname}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    pushd build/lib/refind_btrfs/data

    install -D -m755 refind-btrfs "${pkgdir}/usr/bin/refind-btrfs"
    install -D -m644 refind-btrfs.conf-sample "${pkgdir}/etc/refind-btrfs.conf"
    install -D -m644 refind-btrfs.service "${pkgdir}/usr/lib/systemd/system/refind-btrfs.service"

    popd
}
