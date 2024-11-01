# Maintainer: karboncore

pkgname=mealie
pkgver=2.1.0
pkgrel=1
pkgdesc='A self hosted recipe manager'
arch=(any)
url=https://github.com/mealie-recipes/mealie
license=(AGPL)
depends=(python-fastapi python-sqlalchemy python-pyjwt python-text-unidecode python-slugify
         python-dateutil python-isodate apprise python-bs4 python-bcrypt python-ldap python-authlib
         python-alembic python-python-multipart python-jinja python-html2text python-orjson
         python-httpx python-pillow python-pillow_heif python-openai python-humps
         python-recipe-scrapers-git python-extruct-git python-requests python-lxml uvicorn
         python-aiofiles python-aniso8601 python-appdirs python-paho-mqtt python-pydantic
         python-pydantic-settings python-dotenv python-yaml python-rapidfuzz python-tzdata
         python-poetry python-itsdangerous sqlite)
makedepends=(git python-build python-wheel python-installer yarn nodejs-lts-hydrogen)
optdepends=('postgresql: for postgresql support'
            'python-psycopg2: for postgresql support')
source=(https://github.com/mealie-recipes/mealie/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('f144aa9fe8ef9e5579701d0ce90fa676c725e6b9c746cfe41956932309b3fab9')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
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
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  rm -f "$pkgdir/usr/bin/start"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  mkdir -pm755 "$pkgdir/usr/lib/mealie"
  cp -r {frontend/dist,alembic,alembic.ini} "$pkgdir/usr/lib/mealie/"
  sed -i 's@^script_location.*@script_location = /usr/lib/mealie/alembic@g' "$pkgdir/usr/lib/mealie/alembic.ini"

  # Generate startup script
  pythondir=( "$pkgdir/usr/lib/python"* )
  cat << EOF > "$pkgdir/usr/bin/mealie"
#!/bin/sh

STATIC_FILES="\${STATIC_FILES:-/usr/lib/mealie/dist}"                      \\
ALEMBIC_CONFIG_FILE="\${ALEMBIC_CONFIG_FILE:-/usr/lib/mealie/alembic.ini}" \\
PRODUCTION="\${PRODUCTION:-true}"                                          \\
DATA_DIR="\${DATA_DIR:-\$HOME/.mealie}"                                     \\
                                                                          \\
python /usr/lib/${pythondir##*/}/site-packages/mealie/main.py
EOF
  chmod 755 "$pkgdir/usr/bin/mealie"
}
