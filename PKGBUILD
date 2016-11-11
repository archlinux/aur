# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Vadim Kaushan <admin@disasm.info>
# Contributor: Marc Lehmann <schmorpforge@schmorp.de>

set -u
pkgname='gvpe'
pkgver='3.0'
pkgrel='1'
pkgdesc='Simple and robust virtual network solution'
arch=('x86_64' 'i686')
url='http://software.schmorp.de/pkg/gvpe.html'
license=('GPL3')
depends=('bash' 'openssl')
_verwatch=('http://ftp.gnu.org/gnu/gvpe/' 'gvpe-\([0-9\.]\+\)\.tar\.gz' 't')
source=("http://ftp.gnu.org/gnu/gvpe/${pkgname}-${pkgver}.tar.gz"
        'gvpe@.service'
        'if-up'
        'node-up'
        'node-down'
        'gvpe.conf.example')
sha256sums=('0e0a2db4dc7ac591c4368989329773a1b2399bca959d1cc10fa9f95884acc1ec'
            '60a6b5f03524ede9e9fa2538623b7a808cf02e41f91e800b7c1afe039effd28f'
            '89ea3660f780aabc37adcb621dbfd7cffa70b463c0251f03ad05c58fc564a762'
            '8a74c5c3fcea5586fc72d6c8c2c30a23b3dd32e92bf1674b29a126a0c8ac2fa3'
            '1ae1ad31a0d91fac1764111acbc5fef6d5edf6876c24b44f97cf1b1e9be9b89c'
            '1d01d9f384fb1baa4f15fcc43ab8b3f8fb68250b88cd639010ff00a8a0f7b4ac')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"

  CFLAGS="-Wno-unused-result ${CFLAGS}" \
  CXXFLAGS="-Wno-unused-result ${CXXFLAGS}" \
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --sbindir='/usr/bin'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"

  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s DESTDIR="${pkgdir}" install

  install -Dpm644 'doc/complex-example'/{README,gvpe.conf,if-up,node-up} -t "${pkgdir}/usr/share/doc/gvpe/complex-example"

  cd "${srcdir}"
  install -Dpm644 'gvpe@.service' -t "${pkgdir}/usr/lib/systemd/system/"
  install -dm700 "${pkgdir}/etc/gvpe/pubkey"
  install -Dpm700 {if-up,node-up,node-down} -t "${pkgdir}/etc/gvpe/"
  install -Dpm600 'gvpe.conf.example' "${pkgdir}/etc/gvpe/gvpe.conf.example"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
