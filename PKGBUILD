# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=0.21
pkgrel=2
pkgdesc="A self-hosted, modern free and open-source music server, heavily inspired by Grooveshark."
arch=(any)
url="https://funkwhale.audio/"
license=(GPL3)
optdepends=('apache: to use the Apache web server'
            'certbot-apache: for the server to be accessible from outside'
            'nginx: to use nginx web server'
            'python-daphne: an alternative web server')
depends=('ffmpeg' 'libjpeg' 'postgresql' 'python'
        'ipython'
        'mod_xsendfile'
        'python-django>=3.0.5'
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
        'python-mutagen'
        'python-pymemoize'
        'python-django-dynamic-preferences'
        'python-raven'
        'python-magic-git'
        'python-django-channels'
        'python-django-channels-redis'
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
        'python-autobahn'
        'python-django-oauth-toolkit'
        'python-django-storages'
        'python-boto3'
        'python-unicode-slugify-git'
        'python-django-cacheops'
        'python-click'
        'python-service-identity'
        'python-markdown'
        'python-bleach'
        'python-feedparser'
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
sha256sums=('0ffb4c97a2f5bc0adbda070f5300e5af76dfda81489dfa03be3e9a78cd4139b3'
            'd412b9bf0bb57d48332c6a6ab2f14c6d8e4dc792421ed4077f65550c58ecd754'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            'f56a2e8947809db4325a6c65141f6eb87e7428cc0e5a57032fc7ce050bf396fa'
            'a964a7802252d20a3319e2131c27ec307ad4f454921c2db31971c080150d7c9b'
            '0e6d7c96b7c1ec63794214decb1f2e7dd112a22b02e55555cf98c2a573014af6'
            '9d5a6f2cae6f18e22c5423247570519e8c772a9447ec2d92bd2fe5d69e519470'
            'f37b1b6257c5b92272f36773041c83fc72276ff4040100fba92db8136cc9177d'
            'cea307055e9f8001a1507c507e1be91352d896cab17260a221f4ab8c298506d8'
            '01104122e3df765735b1062aa15e7a73c7949f2d9b7332c0e02e02db66345349')
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
