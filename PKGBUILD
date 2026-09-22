# Maintainer: karboncore

pkgname=mealie
pkgver=3.27.0
pkgrel=1
pkgdesc='A self hosted recipe manager'
arch=(any)
url=https://github.com/mealie-recipes/mealie
license=(AGPL)
depends=(python312 sqlite)
makedepends=(pnpm nodejs postgresql-libs uv)
optdepends=('postgresql: for postgresql support')
source=(https://github.com/mealie-recipes/mealie/archive/refs/tags/v${pkgver}.tar.gz
        mealie.sh
        mealie.service
        mealie.sysusers
        mealie.tmpfiles
        mealie.conf)
sha256sums=('d378c308e144e7ca471b8d37c26813627f99428240ee24de5b3e1c05e45a5811'
            '7d8f6ff8e146e20c545aa390662cdc167ec0311a83ab88a27283df2330e29b5b'
            '582e023c8a68117fb9c28a5bbb182173ba857819bd4118e7a07d25012bc02b6a'
            '1a6b434a125f6940e53f8ba6613426f50c8ca8d5e7a447a80efd57016b917208'
            '7a7a98f782a52614eea07ce2f1d1020fc51d5484bbe4ebc51a0b55ab7c6c49fb'
            '3aa572f9b105f9563eb1c49d5c0e1d7a0350dd53b5cbf512c5a0ff1cd71e3349')
backup=(etc/mealie.conf)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  uv sync --frozen --all-extras --no-dev --no-editable --no-progress --python 3.12 --no-managed-python
  sed -i "1s|^\#\!${srcdir}/${pkgname}-${pkgver}/\.venv|\#\!/opt/mealie/venv|" .venv/bin/*

  cd frontend
  pnpm install \
    --prefer-offline \
    --frozen-lockfile \
    --production=false
  pnpm generate
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -pm755 "${pkgdir}/opt/mealie"
  cp -r .venv "${pkgdir}/opt/mealie/venv"
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
