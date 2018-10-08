# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='aeon'
pkgver='0.12.6.0'
pkgrel='1'
pkgdesc='A lightweight CryptoNote digital currency.'
url="https://github.com/${pkgname}ix/${pkgname}"
depends=('boost-libs' 'openssl' 'zeromq' 'pcsclite' 'icu')
makedepends=('git' 'cmake' 'boost' 'doxygen' 'rapidjson')
license=('custom:Cryptonote')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
source=("${pkgname}d.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}d.conf"
	"${url}/archive/v${pkgver}-${pkgname}.tar.gz")
sha256sums=('5212dff199bb3880191292976cd8278dcdbae64f9c0ab39a9c2a91a4733186c3'
            'a0cdf75b86073829f4033e367f36e9418dc20556e7adfa6ffac8653c67cd6337'
            '1da20b66d52db4f1c5b3106cf27ee54033650a0e36c5c775b25c9e86e6027be0'
            '3ef15e3c9e2d146c415f2e483dd10e4ec36f653e4684c254d9f69a5fb699036b'
            '184eaa3b84f099d438c363e3a5b09e00e68a884dd429836d80f63185cea814f5')
backup=("etc/${pkgname}d.conf")

prepare() {
  cd "${pkgname}-${pkgver}-${pkgname}"
  git clone git://github.com/monero-project/miniupnp.git external/miniupnp
  git clone git://github.com/monero-project/unbound.git external/unbound
  git -C external/miniupnp checkout monero
  git -C external/unbound checkout monero
}

build() {
  cd "${pkgname}-${pkgver}-${pkgname}"
  make release
}

package() {
  cd "${pkgname}-${pkgver}-${pkgname}"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}d.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
  install -Dm0644 "${srcdir}/${pkgname}d.conf" "${pkgdir}/etc/${pkgname}d.conf"
  cp -r "build/release/bin" "${pkgdir}/usr"
}
