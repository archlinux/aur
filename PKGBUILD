pkgname=simplelogin-server
pkgver=4.81.7
pkgrel=1
pkgdesc='Self-hosted SimpleLogin email alias server'
arch=('x86_64')
url='https://github.com/simple-login/app'
license=('AGPL-3.0-only')

_slpgpver=0.1.1

depends=(
  'python'
  'gunicorn'
  'gnupg'
  'python-aiosmtpd'
  'python-aiospamc'
  'python-alembic'
  'python-arrow'
  'python-bcrypt'
  'python-blinker'
  'python-boto3'
  'python-click'
  'python-coloredlogs'
  'python-cryptography'
  'python-deprecated'
  'python-dkim'
  'python-dnspython'
  'python-dotenv'
  'python-email-validator'
  'python-flanker'
  'python-flask'
  'python-flask-admin'
  'python-flask-cors'
  'python-flask-limiter'
  'python-flask-login'
  'python-flask-migrate'
  'python-flask-profiler'
  'python-flask-wtf'
  'python-gevent'
  'python-gnupg'
  'python-google-api-python-client'
  'python-google-auth-httplib2'
  'python-google-re2'
  'python-itsdangerous'
  'python-jwcrypto'
  'python-limits'
  'python-markupsafe'
  'python-memory-profiler'
  'python-newrelic'
  'python-pgpy'
  'python-phpserialize'
  'python-psycopg2'
  'python-pycryptodome'
  'python-pyopenssl'
  'python-pyotp'
  'python-pyspf'
  'python-redis'
  'python-requests'
  'python-requests-oauthlib'
  'python-sentry_sdk'
  'python-sqlalchemy'
  'python-sqlalchemy-utils'
  'python-strictyaml'
  'python-tldextract'
  'python-twilio'
  'python-unidecode'
  'python-webauthn'
  'python-werkzeug'
  'python-wtforms'
)

makedepends=(
  'nodejs'
  'npm'
  'python-installer'
)

optdepends=(
  'postgresql: local PostgreSQL database server'
  'postfix: local MTA for inbound and outbound SimpleLogin mail'
  'postfix-pgsql: PostgreSQL-backed Postfix lookup maps'
  'nginx: reverse proxy for the web application'
  'valkey: Redis-compatible session and rate-limit backend when MEM_STORE_URI is configured'
  'spamassassin: optional spamd backend'
  'ipython: interactive SimpleLogin shell helper'
  'python-flask-debugtoolbar: optional Flask debug toolbar'
  'python-facebook-sdk: optional Facebook authentication support'
)

provides=('simplelogin-server')
conflicts=('simplelogin-server')

source=(
  "simplelogin-${pkgver}.tar.gz::https://github.com/simple-login/app/archive/refs/tags/v${pkgver}.tar.gz"
  "sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl::https://github.com/simple-login/sl-pgp-rs/releases/download/${_slpgpver}/sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl"
  'simplelogin.service'
  'simplelogin-email.service'
  'simplelogin-job-runner.service'
  'simplelogin.sysusers'
  'simplelogin.tmpfiles'
)

sha256sums=(
  'SKIP'
  '1cda5d1953388d25641e0383f6dc0630a42f22256aa1da9eafb9979909b71d17'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/app-${pkgver}/static"
  npm install --ignore-scripts --no-audit --no-fund --package-lock=false
}

package() {
  cd "$srcdir/app-${pkgver}"

  install -d "$pkgdir/usr/lib/simplelogin"
  cp -a . "$pkgdir/usr/lib/simplelogin/"

  rm -rf \
    "$pkgdir/usr/lib/simplelogin/.github" \
    "$pkgdir/usr/lib/simplelogin/tests" \
    "$pkgdir/usr/lib/simplelogin/docs"

  rm -f \
    "$pkgdir/usr/lib/simplelogin/Dockerfile" \
    "$pkgdir/usr/lib/simplelogin/.dockerignore" \
    "$pkgdir/usr/lib/simplelogin/requirements.lock" \
    "$pkgdir/usr/lib/simplelogin/requirements-dev.lock" \
    "$pkgdir/usr/lib/simplelogin/poetry.lock" \
    "$pkgdir/usr/lib/simplelogin/uv.lock"

  rm -rf "$pkgdir/usr/lib/simplelogin/static/upload"
  ln -s /var/lib/simplelogin/upload "$pkgdir/usr/lib/simplelogin/static/upload"

  python -m installer \
    --destdir="$pkgdir" \
    "$srcdir/sl_pgp-${_slpgpver}-cp310-abi3-manylinux_2_31_x86_64.whl"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 example.env \
    "$pkgdir/usr/share/doc/$pkgname/example.env"

  install -Dm644 example.env \
    "$pkgdir/etc/simplelogin/simplelogin.env.example"

  install -Dm644 "$srcdir/simplelogin.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin.service"

  install -Dm644 "$srcdir/simplelogin-email.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin-email.service"

  install -Dm644 "$srcdir/simplelogin-job-runner.service" \
    "$pkgdir/usr/lib/systemd/system/simplelogin-job-runner.service"

  install -Dm644 "$srcdir/simplelogin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/simplelogin.conf"

  install -Dm644 "$srcdir/simplelogin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/simplelogin.conf"
}
