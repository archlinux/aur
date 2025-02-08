# Maintainer: karboncore

pkgname=mealie
pkgver=2.6.0
pkgrel=1
pkgdesc='A self hosted recipe manager'
arch=(any)
url=https://github.com/mealie-recipes/mealie
license=(AGPL)
depends=(python-fastapi python-sqlalchemy python-pyjwt python-text-unidecode python-slugify
         python-dateutil python-isodate apprise python-bs4 python-bcrypt python-ldap python-authlib
         python-alembic python-python-multipart python-jinja python-html2text python-orjson
         python-httpx python-pillow python-pillow-heif python-openai python-humps
         python-recipe-scrapers-git python-extruct-git python-requests python-lxml uvicorn
         python-aiofiles python-aniso8601 python-appdirs python-paho-mqtt python-pydantic
         python-pydantic-settings python-dotenv python-yaml python-rapidfuzz python-tzdata
         python-poetry python-itsdangerous sqlite)
makedepends=(git python-build python-wheel python-installer yarn nodejs-lts-hydrogen)
optdepends=('postgresql: for postgresql support'
            'python-psycopg2: for postgresql support')
source=(https://github.com/mealie-recipes/mealie/archive/refs/tags/v${pkgver}.tar.gz
        mealie.sh
        mealie.service
        mealie.sysusers)
sha256sums=('c22d9ae9436203f9b570f649d29262f6335bdd87a40d631a7520e9d8e04b2a74'
            'fbc0583e1019073b05b34a09e52be359939647481e38a5213565172f5fcf2fae'
            'bf98963b77085e7a1aaf77afab7f2760d6dfe00f3c4dcbf50250eb376dc56487'
            '1a6b434a125f6940e53f8ba6613426f50c8ca8d5e7a447a80efd57016b917208')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build -wn
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
  python -m installer -d "${pkgdir}" dist/*.whl
  rm -f "${pkgdir}/usr/bin/start"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -pm755 "${pkgdir}/usr/lib/mealie"
  cp -r frontend/dist "${pkgdir}/usr/lib/mealie/"
  cd ..

  # Basic startup script
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install systemd files
  install -Dm 644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # Set python version
  PYTHONDIR=( "${pkgdir}/usr/lib/python"* )
  sed -i "s/_PYTHONDIR/${PYTHONDIR##*/}/g" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  sed -i "s/_PYTHONDIR/${PYTHONDIR##*/}/g" "${pkgdir}/usr/bin/${pkgname}"
}
