# Maintainer: karboncore

pkgname=mealie
pkgver=2.8.0
pkgrel=2
pkgdesc='A self hosted recipe manager'
arch=(any)
url=https://github.com/mealie-recipes/mealie
license=(AGPL)
depends=(python312 sqlite)
makedepends=(yarn nodejs postgresql-libs)
optdepends=('postgresql: for postgresql support')
source=(https://github.com/mealie-recipes/mealie/archive/refs/tags/v${pkgver}.tar.gz
        mealie.sh
        mealie.service
        mealie.sysusers)
sha256sums=('9a801874a7012b9282da4e204825b7c0a321ad91fd8bbbd3bbc4a224f16e0555'
            '7d8f6ff8e146e20c545aa390662cdc167ec0311a83ab88a27283df2330e29b5b'
            '582e023c8a68117fb9c28a5bbb182173ba857819bd4118e7a07d25012bc02b6a'
            '1a6b434a125f6940e53f8ba6613426f50c8ca8d5e7a447a80efd57016b917208')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"/frontend
  yarn upgrade
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3.12 -m venv ./venv
  source venv/bin/activate
  pip install ./
  pip install 'psycopg2>=2.0.0,<3.0.0'
  deactivate

  cd frontend
  yarn install \
    --prefer-offline \
    --frozen-lockfile \
    --non-interactive \
    --production=false \
    --network-timeout 1000000
  yarn generate
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -pm755 "${pkgdir}/opt/mealie"
  cp -r {venv,frontend/dist} -t "${pkgdir}/opt/mealie/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd ..

  # Basic startup script
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install systemd files
  install -Dm 644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
