# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=1.0.1
pkgrel=3
pkgdesc="A self-hosted, modern free and open-source music server, heavily inspired by Grooveshark."
arch=(any)
url="https://funkwhale.audio/"
license=(GPL3)
optdepends=('apache: to use the Apache web server'
            'certbot-apache: for the server to be accessible from outside'
            'mod_xsendfile: needed if Apache server is used'
            'nginx: to use nginx web server')
depends=('ffmpeg'
        'libjpeg'
        'postgresql'
        'python'
        'python-setuptools'
        'python-django'
        'python-django-environ'
        'python-pillow'
        'python-django-allauth'
        'python-psycopg2'
        'python-pytz'
        'python-django-redis'
        'python-redis'
        'python-kombu'
        'python-celery'
        'python-django-cors-headers'
        'python-musicbrainzngs'
        'python-django-rest-framework'
        'python-django-rest-framework-jwt'
        'python-arrow'
        'python-persisting-theory'
        'python-django-versatile-imagefield'
        'python-django-filter'
        'python-django-rest-auth'
        'ipython'
        'python-mutagen'
        'python-pymemoize'
        'python-django-dynamic-preferences'
        'python-raven'
        'python-magic-git'
        'python-django-channels'
        'python-django-channels-redis>=3'
        'uvicorn'
        'gunicorn'
        'python-cryptography'
        'python-requests-http-signature'
        'python-django-cleanup'
        'python-requests'
        'python-pyopenssl'
        'python-ldap'
        'python-django-auth-ldap'
        'python-pydub'
        'python-pyld'
        'python-aiohttp'
        'python-django-oauth-toolkit'
        'python-django-storages'
        'python-boto3'
        'python-unicode-slugify-git'
        'python-django-cacheops'
        'python-click'
        'python-service-identity'
        'python-markdown'
        'python-bleach'
        'python-feedparser-dev>=6'
        'python-watchdog'
)
makedepends=(git)
_source_api="https://dev.funkwhale.audio/funkwhale/funkwhale/-/jobs/artifacts/${pkgver}/download?job="
_source_env="https://dev.funkwhale.audio/funkwhale/funkwhale/raw/${pkgver}/deploy/"
source=("${pkgname}-${pkgver}-api.zip::${_source_api}build_api"
        "${pkgname}-${pkgver}-front.zip::${_source_api}build_front"
        "${_source_env}funkwhale_proxy.conf"
        "${_source_env}nginx.template"
        "funkwhale.service"
        "funkwhale-beat.service"
        "funkwhale-server.service"
        "funkwhale-worker.service"
        "apache-funkwhale.conf"
        "env-template"
)
sha256sums=('5c0689c0e05d3271d161c13e8063e5053f4ecb582e3a7e3d6973d1c46be23887'
            '0b77367cb4e8d1b57af59282af90ac41e0915de85cf5337b02f16e6aa0bd0129'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            'f56a2e8947809db4325a6c65141f6eb87e7428cc0e5a57032fc7ce050bf396fa'
            '01104122e3df765735b1062aa15e7a73c7949f2d9b7332c0e02e02db66345349'
            '812c9a49436725e18768c5eb772c7207c184cdcf3a057432dc998387c481bd8d'
            '9d5a6f2cae6f18e22c5423247570519e8c772a9447ec2d92bd2fe5d69e519470'
            '57c17dbd033fff76b344c90114d3b1f9eae3aaaa49128b61fcd1b5e808561dc3'
            'f37b1b6257c5b92272f36773041c83fc72276ff4040100fba92db8136cc9177d'
            'cea307055e9f8001a1507c507e1be91352d896cab17260a221f4ab8c298506d8')
install=${pkgname}.install

prepare() {
  cd "$srcdir"
  ## change path of proxy parameters
  sed -id 's#/etc/nginx/funkwhale_proxy.conf#/etc/webapps/funkwhale/funkwhale_proxy.conf#' nginx.template
  ## remove http2, as it is not always working
  sed -id 's#443 ssl http2;#443 ssl;#' nginx.template
}

build() {
  cd "$srcdir"
  ## TODO: build front-end from source
}

package() {
  cd "$srcdir"

  # install project
  install -dm0755 -o root "$pkgdir"/usr/share/webapps/${pkgname}
  cp -R api "$pkgdir"/usr/share/webapps/${pkgname}/.
  cp -R front "$pkgdir"/usr/share/webapps/${pkgname}/.
  chmod 755 -R "$pkgdir"/usr/share/webapps/${pkgname}/api/
  chown root:http -R "$pkgdir"/usr/share/webapps/${pkgname}/api/
  mkdir "$pkgdir"/usr/bin
  ln -s /usr/share/webapps/${pkgname}/api/manage.py "$pkgdir"/usr/bin/funkwhale_manage

  install -d "$pkgdir"/etc/webapps/${pkgname}/config
  install -Dm644 funkwhale_proxy.conf "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 nginx.template "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 apache-funkwhale.conf "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 env-template "$pkgdir"/etc/webapps/${pkgname}/env.template

  install -Dm644 funkwhale.service "$pkgdir/usr/lib/systemd/system/funkwhale.service"
  install -Dm644 funkwhale-beat.service "$pkgdir/usr/lib/systemd/system/funkwhale-beat.service"
  install -Dm644 funkwhale-worker.service "$pkgdir/usr/lib/systemd/system/funkwhale-worker.service"
  install -Dm644 funkwhale-server.service "$pkgdir/usr/lib/systemd/system/funkwhale-server.service"

  echo -e 'u funkwhale - "Funkwhale music server" /srv/funkwhale\nm funkwhale http' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/funkwhale 0775 funkwhale funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
