# Maintainer: karboncore

pkgname=mealie
pkgver=3.8.0
pkgrel=1
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
        mealie.sysusers
        mealie.tmpfiles
        mealie.conf)
sha256sums=('272fba24d8ab45737d7aeaff4c7a90aaa3229e0a265026e43ddf001f627bcd66'
            '7d8f6ff8e146e20c545aa390662cdc167ec0311a83ab88a27283df2330e29b5b'
            '582e023c8a68117fb9c28a5bbb182173ba857819bd4118e7a07d25012bc02b6a'
            '1a6b434a125f6940e53f8ba6613426f50c8ca8d5e7a447a80efd57016b917208'
            '7a7a98f782a52614eea07ce2f1d1020fc51d5484bbe4ebc51a0b55ab7c6c49fb'
            '3aa572f9b105f9563eb1c49d5c0e1d7a0350dd53b5cbf512c5a0ff1cd71e3349')
backup=(etc/mealie.conf)

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
  cp -r venv -t "${pkgdir}/opt/mealie/"
  cp -rL frontend/dist -t "${pkgdir}/opt/mealie/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd ..

  # Basic startup script
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install systemd files
  install -Dm 644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm 644 ${pkgname}.conf "${pkgdir}/etc/${pkgname}.conf"
}
