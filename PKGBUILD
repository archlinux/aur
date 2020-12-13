# Maintainer: Hao Long <aur@esd.cc>

pkgname=vigil-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="an open-source Status Page you can host on your infrastructure, used to monitor all your servers and apps, and visible to your users"
arch=("x86_64")
url="https://github.com/valeriansaliou/vigil"
license=("MPL2")
provides=('vigil')
conflicts=('vigil')
backup=('etc/vigil.cfg')
source=('vigil.service'
        'sysusers.d'
        "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/v${pkgver}-x86_64.tar.gz")
sha256sums=('5365129dece19789d6129b4de23f1f9985d9ab19a9b52d95950bff7d4b339e56'
            '320635cb5ed1bae4379c8e70f07898bb70c19755c54fd697ee0cdf1db3fc8eb3'
            '390ac53989b31bb2f425df50dce9ada32691a4b056b0e1b91776b19c2d1f776d')
install=vigil-bin.install

prepare() {
  cd vigil
  sed -i 's|path = "./res/assets/"|path = "/usr/share/vigil-bin/"|g' config.cfg
}

package() {
  install -Dm644 vigil.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 sysusers.d "${pkgdir}/usr/lib/sysusers.d/vigil.conf"
  cd vigil
  install -Dm755 vigil -t "${pkgdir}/usr/bin"
  install -Dm644 config.cfg "${pkgdir}/etc/vigil.cfg"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r res/assets/ "${pkgdir}/usr/share/vigil-bin/"
}
