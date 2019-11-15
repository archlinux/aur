# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=0.20.1
pkgrel=1
pkgdesc="A self-hosted, modern free and open-source music server, heavily inspired by Grooveshark."
arch=(any)
url="https://funkwhale.audio/"
license=(GPL3)
optdepends=('apache: to use the Apache web server'
            'certbot-apache: for the server to be accessible from outside'
            'nginx: to use nginx web server')
depends=('ffmpeg' 'libjpeg' 'postgresql' 'python'
        'ipython'
        'mod_xsendfile'
        'python-django>=2'
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
        'python-django-rest-framework>=3.10'
        'python-django-rest-framework-jwt'
        'python-pendulum'
        'python-persisting-theory'
        'python-django-versatile-imagefield'
        'python-django-filter'
        'python-django-rest-auth'
        'python-mutagen'
        'python-pymemoize'
        'python-django-dynamic-preferences'
        'python-raven'
        'python-magic-git'
        'python-django-channels'
        'python-django-channels-redis'
        'python-daphne'
        'uvicorn'
        'gunicorn'
        'python-cryptography'
        'python-requests-http-signature'
        'python-django-cleanup'
        'python-requests'
        'python-pyopenssl'
        'python-ldap'
        'python-django-auth-ldap'
        'python-service-identity'
        'python-pydub'
        'python-pyld>=1.0.4'
        'python-aiohttp'
        'python-autobahn'
        'python-django-oauth-toolkit'
        'python-django-storages'
        'python-boto3'
        'python-unicode-slugify-git'
        'python-django-cacheops'
)
makedepends=(git)
_source_api="https://dev.funkwhale.audio/funkwhale/funkwhale/-/jobs/artifacts/${pkgver}/download?job="
_source_env="https://dev.funkwhale.audio/funkwhale/funkwhale/raw/${pkgver}/deploy/"
source=("${pkgname}-${pkgver}-api.zip::${_source_api}build_api"
        "${pkgname}-${pkgver}-front.zip::${_source_api}build_front"
        "${_source_env}funkwhale_proxy.conf"
        "${_source_env}nginx.template"
        "funkwhale-beat.service"
        "funkwhale-worker.service"
        "funkwhale-server.service"
        "apache-funkwhale.conf"
        "env-template"
        "funkwhale.service"
)
sha256sums=('5ef55f5e8a9bddaf93744027791efa23d49fe59af681e39942be1227a0de4126'
            '22d774590b943fa6d64f634a7175b1d100089fe33734ce9889d050063ff50ce7'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            '212f346b599146954b433a66f5857d8ba5bc5689d3268fa41dca1dec0b3ee683'
            'a964a7802252d20a3319e2131c27ec307ad4f454921c2db31971c080150d7c9b'
            '0e6d7c96b7c1ec63794214decb1f2e7dd112a22b02e55555cf98c2a573014af6'
            '9d5a6f2cae6f18e22c5423247570519e8c772a9447ec2d92bd2fe5d69e519470'
            'f37b1b6257c5b92272f36773041c83fc72276ff4040100fba92db8136cc9177d'
            'cea307055e9f8001a1507c507e1be91352d896cab17260a221f4ab8c298506d8'
            '01104122e3df765735b1062aa15e7a73c7949f2d9b7332c0e02e02db66345349')
install=${pkgname}.install


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
