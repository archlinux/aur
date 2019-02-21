# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=0.18
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
        'python-redis'
        'python-django-redis'
        'python-celery'
        'python-django-cors-headers'
        'python-musicbrainzngs'
        'python-django-rest-framework>=3.9'
        'python-django-rest-framework-jwt'
        'python-pendulum'
        'python-persisting-theory'
        'python-django-versatile-imagefield'
        'python-django-filter1.1'
        'python-django-rest-auth'
        'python-beautifulsoup4'
        'python-markdown'
        'python-mutagen'
        'python-django-taggit'
        'python-pymemoize'
        'python-django-dynamic-preferences'
        'python-raven'
        'python-magic-git'
        'python-ffmpeg'
        'python-django-channels'
        'python-django-channels-redis'
        'python-daphne'
        'python-cryptography'
        'python-requests-http-signature'
        'python-django-cleanup'
        'python-ldap'
        'python-django-auth-ldap'
        'python-service-identity'
        'python-pydub'
)
makedepends=(git)
_source_api="https://code.eliotberriot.com/funkwhale/funkwhale/builds/artifacts/${pkgver}/download?job="
_source_env="https://code.eliotberriot.com/funkwhale/funkwhale/raw/${pkgver}/deploy/"
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
sha256sums=('bd39230b27e22d1a41cd058979f67cc1727b5ea845ce32b29e8de99bf6d364f3'
            '20faddbf6a74722826eb889df4ebd4fc18810ff80d3741608b1d86d17e4f408a'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            'ee571b8a30b968849fcf5c7b2588f298a3046609fe9792dd0b59024899dfea3a'
            'a964a7802252d20a3319e2131c27ec307ad4f454921c2db31971c080150d7c9b'
            '0e6d7c96b7c1ec63794214decb1f2e7dd112a22b02e55555cf98c2a573014af6'
            '4a28ddf6a6ba8ec28c10a164f82e3d5e5904d6dfe68ae8852428a589cee210c5'
            'dcc7a76ff136db29a830f9228a88b2ab64639d44ef2d8db363315fe5828efec9'
            'c2ee8160e2f4f87a2d4fe46136ffb8ea14422dc599db3eca4341e48db26d72ad'
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
