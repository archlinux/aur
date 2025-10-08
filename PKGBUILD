# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: nofxx <x@<nick>.com>

pkgname=redict
pkgver=7.3.6
pkgrel=1
pkgdesc='A distributed key/value database'
arch=('x86_64')
url='https://redict.io/'
license=('LGPL-3.0-only')
depends=('jemalloc' 'grep' 'shadow' 'systemd-libs')
# pkg-config fails to detect systemd libraries if systemd is not installed
makedepends=('systemd' 'openssl')
provides=('redis')
backup=('etc/redict/redict.conf'
        'etc/redict/sentinel.conf')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://codeberg.org/redict/redict/archive/${pkgver//+/-}.tar.gz"
        redict.service
        redict-sentinel.service
        redict.sysusers
        redict.tmpfiles
        redict.conf-sane-defaults.patch
        redict-use-system-jemalloc.patch)
sha512sums=('ba795cbe59250dca21d352a657323aa11c87baea1304e0a2c577151966c9dc1d034af5da88d11e2e12555c1825662cce6f602d1895641c5fd7ed20ce4085a13e'
            'bafdd8d5bb16eb651e6dbed2fbd85c8a2264e5063cdc590add10f79879cb0e3dd3ea65635cb0f2502b272b9ad08704461ebec2523eb5263130ae01b1e5fc6983'
            'b72ee96c78e9c2e760f8241f109c7c91ebf0d5ba699af7e05e28e0f4eab8864e43673fca074a11730223e22b93f109c9739ea92f429332f7dc37ae8d6d7ad691'
            '94556abeb7eba84d428130e9a0848865ddfa354e7652ec7a1a1d9ad4100a95fea92ce2be55abcf98b1ae176cc204d475e43294bb901c7aee3fa6cefbd759c8be'
            'ecb0ecc6cb0470227834033eefd8f44e4ee83a0554059c9c01d8ce95182fc74b93a8cf75e148ecf449f9b0831ab0ee846929352afded3b20c6811c2c76ab60ea'
            '4df78caaffcd3db2430c31de37c2afacfa04e6fb4b35a1e2b18626dec35b834091949dc2537cce13643cbd1df44edfa9124c14bfcfb316cdfe8ac6733e36cac2'
            '0b945833a4e62d52892527a3b4cd7f19665f91f3ad295d6f39bac731460e88d43b968867b84eb48a9d24a53a7cdac6870d92edd9db167f8436ae2d95e87e7839')

prepare() {
  cd ${pkgname}
  patch -Np1 < ../redict.conf-sane-defaults.patch
  patch -Np1 < ../redict-use-system-jemalloc.patch
}

build() {
  make BUILD_TLS=yes \
       USE_SYSTEMD=yes \
       -C ${pkgname}
}

package() {
  cd ${pkgname}
  make PREFIX="${pkgdir}"/usr install

  install -Dm644 -t "${pkgdir}"/etc/redict redict.conf sentinel.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ ../redict.service ../redict-sentinel.service
  install -Dm644 "${srcdir}"/redict.sysusers "${pkgdir}"/usr/lib/sysusers.d/redict.conf
  install -Dm644 "${srcdir}"/redict.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/redict.conf
}
