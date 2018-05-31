# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='aeon'
pkgver='0.12.0.0'
pkgrel='1'
pkgdesc='A lightweight CryptoNote digital currency.'
arch=('x86_64')
url="https://github.com/${pkgname}ix/${pkgname}"
depends=('boost-libs' 'openssl' 'zeromq' 'pcsclite' 'icu')
makedepends=('git' 'cmake' 'boost' 'doxygen' 'rapidjson')
license=('custom:Cryptonote')
arch=('x86_64' 'armv7h' 'aarch64')
source=("${pkgname}d.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}d.conf"
	"${url}/archive/v${pkgver}.tar.gz"
	"aeon-0.12.0.0_gcc8.patch")
sha256sums=('5212dff199bb3880191292976cd8278dcdbae64f9c0ab39a9c2a91a4733186c3'
            'a0cdf75b86073829f4033e367f36e9418dc20556e7adfa6ffac8653c67cd6337'
            '1da20b66d52db4f1c5b3106cf27ee54033650a0e36c5c775b25c9e86e6027be0'
            '3ef15e3c9e2d146c415f2e483dd10e4ec36f653e4684c254d9f69a5fb699036b'
            '61091d6c76417d6c4901dd3583ecd8b40bc651fd2a78ac78093a3f9c0b36c5b1'
            'cf1733cea4f6a689add1a9300ed81d0a9115f2c1021ac125ee9d083972027770')
backup=("etc/${pkgname}d.conf")

prepare() {
  cd "${pkgname}-${pkgver}"
  git clone git://github.com/monero-project/miniupnp.git external/miniupnp
  git clone git://github.com/monero-project/unbound.git external/unbound
  git -C external/miniupnp checkout monero
  git -C external/unbound checkout monero
  patch -p1 -i "${srcdir}/aeon-0.12.0.0_gcc8.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}d.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
  install -Dm0644 "${srcdir}/${pkgname}d.conf" "${pkgdir}/etc/${pkgname}d.conf"
  cp -r "build/release/bin" "${pkgdir}/usr"
}
