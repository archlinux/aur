# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale
pkgver=0.17
pkgrel=2
pkgdesc="A self-hosted, modern free and open-source music server, heavily inspired by Grooveshark."
arch=(any)
url="https://funkwhale.audio/"
license=(GPL3)
optdepends=('apache: to use the Apache web server'
            'certbot-apache: for the server to be accessible from outside'
            'nginx: to use nginx web server')
depends=('ffmpeg' 'libjpeg' 'postgresql' 'python' 'youtube-dl'
        'ipython'
        'mod_xsendfile'
        'python-django>=2'
        'python-django-environ'
        'python-whitenoise'
        'python-pillow'
        'python-django-allauth'
        'python-psycopg2'
        'python-pytz'
        'python-redis'
        'python-django-redis'
        'python-celery'
        'python-django-cors-headers'
        'python-musicbrainzngs'
        'python-django-rest-framework'
        'python-django-rest-framework-jwt'
        'python-oauth2client'
        'python-google-api-python-client'
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
        'python-pyacoustid'
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
)
makedepends=(git)
_source_api="https://code.eliotberriot.com/funkwhale/funkwhale/builds/artifacts/${pkgver}/download?job="
_source_env="https://code.eliotberriot.com/funkwhale/funkwhale/raw/${pkgver}/deploy/"
source=("${pkgname}-${pkgver}-api.zip::${_source_api}build_api"
        "${pkgname}-${pkgver}-front.zip::${_source_api}build_front"
        "${_source_env}funkwhale_proxy.conf"
        "${_source_env}nginx.template"
        "${_source_env}funkwhale-beat.service"
        "${_source_env}funkwhale-worker.service"
        "${_source_env}funkwhale-server.service"
        "apache-funkwhale.conf"
        "env-template"
        "funkwhale.service"
)
sha256sums=('8211b9ff86cde6557ff8b3904ffeb7380e18e47b7b4b76c91f30986d284911a3'
            '3578e1c60da578681c4e60a94dde1e18511f2455814c980b24748c87ffb8b4a2'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            '0d022981f24c9ed8306751d905e85a2fa086c124d7284cc765a3a83814e6efd8'
            'b30fd8f119a53a424c9372a3fdcaad3175f33f242b498b0348c697942573588d'
            '976ddd2f409efa367e8f53d96092007d0886a473507294a3092a96e885b5e59a'
            'b2ff1a2911883416b3a8c35a3e579d493c0bcf4039604020a206c6e8b5fc0ba7'
            '26f91e1b22d7c46a6e26c25889babb8d5e77f7a4aec06bd61833cf953fd48f4a'
            '90c9a2b1ef1ac58589eda10c09a9af8141813aa6b661251eb571a1f757bea8c5'
            '2aa5991083ef375b3440e0e0cff6e7de622137bcac1fb852d62f481aa8a5700d')

prepare() {
  cd "$srcdir"
  
  sed -i 's#WorkingDirectory=/srv/funkwhale/api#WorkingDirectory=/usr/share/webapps/funkwhale/api#' funkwhale-*.service
  sed -i 's#EnvironmentFile=/srv/funkwhale/config/.env#EnvironmentFile=/etc/webapps/funkwhale/config/.env#' funkwhale-*.service
  sed -i 's#ExecStart=/srv/funkwhale/virtualenv/bin/#ExecStart=/usr/bin/#' funkwhale-*.service
  sed -i 's#PartOf=funkwhale.target#PartOf=funkwhale.service#' funkwhale-*.service
}

build() {
  cd "$srcdir"
  ## TODO: build front-end from source
}

package() {
  cd "$srcdir"

  # install project
  install -d "$pkgdir"/usr/share/webapps/${pkgname}
  cp -R api "$pkgdir"/usr/share/webapps/${pkgname}/.
  cp -R front "$pkgdir"/usr/share/webapps/${pkgname}/.
  chown -R funkwhale:funkwhale "$pkgdir"/usr/share/webapps/${pkgname}

  install -d "$pkgdir"/etc/webapps/${pkgname}/config
  install -Dm644 funkwhale_proxy.conf "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 nginx.template "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 apache-funkwhale.conf "$pkgdir"/etc/webapps/${pkgname}/.
  install -Dm644 env-template "$pkgdir"/etc/webapps/${pkgname}/env.template

  install -Dm644 funkwhale.service "$pkgdir/usr/lib/systemd/system/funkwhale.service"
  install -Dm644 funkwhale-beat.service "$pkgdir/usr/lib/systemd/system/funkwhale-beat.service"
  install -Dm644 funkwhale-worker.service "$pkgdir/usr/lib/systemd/system/funkwhale-worker.service"
  install -Dm644 funkwhale-server.service "$pkgdir/usr/lib/systemd/system/funkwhale-server.service"

  echo 'u funkwhale - "Funkwhale music server" /srv/funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/funkwhale 0775 funkwhale funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
