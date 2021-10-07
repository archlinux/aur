# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=1.1.4
pkgrel=2
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
        'python-setuptools'  # >=49
        'python-django'  # ~= 3.0.8
        'python-django-environ'  # ~= 0.4.0
        'python-pillow'  # ~= 7.0.0
        'python-django-allauth'  # ~= 0.42.0
        'python-psycopg2'  # ~= 2.8.0
        'python-pytz'  # ~= 2020.1
        'python-django-redis'  # ~= 4.12.0
        'python-redis'  # ~= 3.5.0
        'python-kombu'  # ~= 4.6.0
        'python-celery'  # ~= 4.4.0
        'python-django-cors-headers'  # ~= 3.4.0
        'python-musicbrainzngs'  # ~= 0.7.1
        'python-django-rest-framework'  # ~= 3.11.0
        'python-django-rest-framework-jwt'  # ~= 1.11.0
        'python-arrow'  # ~= 0.15.5
        'python-persisting-theory'  # ~= 0.2.0
        'python-django-versatile-imagefield'  # ~= 2.0.0
        'python-django-filter'  # ~= 2.3.0
        'python-django-rest-auth'  # ~= 0.9.0
        'ipython'  # ~= 7.10.0
        'python-mutagen'  # ~= 1.45.0
        'python-pymemoize'  # ~= 1.0.0
        'python-django-dynamic-preferences'  # ~= 1.10
        'python-raven'  # ~= 6.10.0
        'python-magic-git'  # ~= 0.4.0
        'python-django-channels'  # ~= 2.4.0
        'python-django-channels-redis>=3'  # ~= 3.0.0
        'uvicorn'  # ~= 0.12.0
        'gunicorn'  # ~= 20.0.0
        'python-cryptography'  # ~= 2.9.0
        'python-requests-http-signature'  # == 0.0.3
        'python-django-cleanup'  # ~= 5.0.0
        'python-requests'  # ~= 2.25.1
        'python-pyopenssl'  # ~= 19.1.0
        'python-ldap'  # ~= 3.3.0
        'python-django-auth-ldap'  # ~= 2.2.0
        'python-pydub'  # ~= 0.24.0
        'python-pyld'  # ~= 1.0.0
        'python-aiohttp'  # ~= 3.7.4
        'python-django-oauth-toolkit'  # ~= 1.3.0
        'python-django-storages'  # ~= 1.9.0
        'python-boto3'  # ~= 1.14.0
        'python-unicode-slugify-git'  # ~= 0.1.0
        'python-django-cacheops'  # ~= 5.0.0
        'python-click'  # ~= 7.1.0
        'python-service-identity'  # ~= 18.1.0
        'python-markdown'  # ~= 3.2.0
        'python-bleach'  # ~= 3.1.0
        'python-feedparser-dev>=6'  # ~= 6.0.0
        'python-watchdog'  # ~= 1.0.2
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
sha256sums=('82fb761ec4d98c732771011b3053f52237b85d575debf08f7184eede5fb0e37b'
            '4e7461510a7bbfefa78c514f35597ea7b95836cc4407ea0421463d7798c8a7cd'
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

  install -Dm644 funkwhale{,-beat,-worker,-server}.service -t "$pkgdir/usr/lib/systemd/system/"

  echo -e 'u funkwhale - "Funkwhale music server" /srv/funkwhale\nm funkwhale http' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/funkwhale 0775 funkwhale funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
