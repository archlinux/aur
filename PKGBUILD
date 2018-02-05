# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='aeon'
pkgver='0.9.14.0'
pkgrel='1'
pkgdesc='A lightweight CryptoNote digital currency.'
arch=('x86_64')
url="https://github.com/${pkgname}ix/${pkgname}"
makedepends=('boost-libs')
license=('custom:Cryptonote')
arch=('x86_64' 'armv7h' 'aarch64')
source=("${pkgname}d.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6c3cbbe52f86e9c4c423a89938835a8dcec92ce5d9243744bda1ec18faa21924'
            'a0cdf75b86073829f4033e367f36e9418dc20556e7adfa6ffac8653c67cd6337'
            '6e9858948c25510f0a30cd179db494d18b32d428183f6679cb7be8ff479aae21'
            '50379f3dfb85fdcf62a92f63fef2a4afc51efdba6a62cf4693a02621b596b8ba')
prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_C_FLAGS="-fassociative-math" \
    -DCMAKE_CXX_FLAGS="-fassociative-math" \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${pkgname}-${pkgver}/build/src"
  install -Dm775 "${pkgname}d" "${pkgdir}/usr/bin/${pkgname}d"
  install -Dm775 "simplewallet" "${pkgdir}/usr/bin/${pkgname}-wallet-cli"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}d.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
}
