# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lua-love-release
_rockname=love-release
pkgver=2.0.14
pkgrel=1
pkgdesc="Lua script that makes LÖVE game release easier"
arch=('x86_64')
url='https://github.com/MisterDA/love-release'
license=('MIT')
provides=('love-release')
depends=('lua'
         'lua-zip'
         'lua-argparse'
         'lua-loadconf'
         'lua-filesystem'
         'lua-middleclass')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MisterDA/love-release/archive/v${pkgver}.tar.gz")
sha256sums=('1ee4aff34cb7d1bce45c1f6c025be0fdef013265a8b49ef4bd2d6d8c42fa555f')

prepare() {
  mv "${srcdir}/${_rockname}-${pkgver}/rockspecs/${_rockname}-${pkgver}-1.rockspec" "${srcdir}/${_rockname}-${pkgver}"
}

build() {
  mkdir -p 5.3

  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-${pkgver}-1.rockspec")
}

package() {

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-${pkgver}-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sed -i "s|$pkgdir||" "${pkgdir}/usr/bin/${_rockname}"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}