# Maintainer: karboncore

pkgname=mealie
pkgver=3.28.0
pkgrel=1
pkgdesc='A self hosted recipe manager'
arch=(any)
url=https://github.com/mealie-recipes/mealie
license=(AGPL)
depends=('python>=3.14' 'python<3.15' sqlite)
makedepends=(pnpm nodejs postgresql-libs uv)
optdepends=('postgresql: for postgresql support')
source=(https://github.com/mealie-recipes/mealie/archive/refs/tags/v${pkgver}.tar.gz
        mealie.sh
        mealie.service
        mealie.sysusers
        mealie.tmpfiles
        mealie.conf)
sha256sums=('2d902403f4b11a7d0f6e3b4f7f10cced63278284722b73e931ce6603366f8be5'
            '8e77846ef67dcc7306ce63232df859624ced3a788550f68794f260ded22c8d11'
            '53b9ceb69243a2d1b6954b1fd052e210622b9a60e6abbd4714c90ed34c3e64fa'
            '1a6b434a125f6940e53f8ba6613426f50c8ca8d5e7a447a80efd57016b917208'
            '7a7a98f782a52614eea07ce2f1d1020fc51d5484bbe4ebc51a0b55ab7c6c49fb'
            '3aa572f9b105f9563eb1c49d5c0e1d7a0350dd53b5cbf512c5a0ff1cd71e3349')
backup=(etc/mealie.conf)

build() {
  export NUXT_TELEMETRY_DISABLED=1

  cd "${srcdir}/${pkgname}-${pkgver}"

  uv sync --frozen --all-extras --no-dev --no-editable --no-progress --python 3.14 --no-managed-python
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
