# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=clocker
pkgver=1.23.1
pkgrel=2
pkgdesc="Tracks project hours"
arch=('x86_64' 'i686' 'arm' 'armv6' 'armv7h' 'aarch64')
url="https://github.com/substack/${pkgname}"
license=(MIT)
depends=(gcc-libs glibc nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('b9b9a16495efe6e271ed945b003b9b79e420fe7041087a33a8ad741ef5be9ebfb084f5b548fdd78242b37c19d50201f3454e4770b25f34ef040c9a9522c39d4b')

package() {
  export NODE_ENV=production

  npm install -g --build-from-source --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/" "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"

  ### cleanup ###
  cd "${pkgdir}/usr/lib/node_modules/${pkgname}/"
  find node_modules -type f \( -name '*.o' -or -name '*.o.d' -or -name '*.md' \) -delete
  cd node_modules/classic-level
  rm -rf prebuilds/ deps/ build/Release/{obj.target,.deps}
  chown -R root:root "${pkgdir}/"
}
