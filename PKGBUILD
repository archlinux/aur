# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=7.0.3
pkgrel=1
pkgdesc='The web frontend for seafile server'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/haiwen/seahub'
license=('Apache')
depends=(
    "seafile-server>=$pkgver"
    'python2-dateutil'
    'python2-memcached'
    'python2-chardet'
    'python2-six'
    'python2-pillow'
    'python2-django'
    'python2-django-compressor'
    'python2-django-post-office'
    'python2-django-statici18n'
    'python2-django-rest-framework'
    'python2-django-constance'
    'python2-openpyxl'
    'python2-pytz'
    'python2-django-formtools'
    'python2-qrcode'
    'python2-requests'
    'python2-requests-oauthlib'
    'python2-django-simple-captcha'
    'python2-flup'
    'python2-gunicorn'
    'python2-django-webpack-loader'
    'python2-cas'
    'python2-django-picklefield'
    'xmlsec'  # dep missing for python2-dm.xmlsec.binding
    'python2-social-auth-core'
)
optdepends=(
    'mysql-python: MySQL support'
    'python2-wsgidav-seafile: Webdav support'
    'python2-django-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
changelog="ChangeLog"
source=("$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz")
sha256sums=('0cc209b6195eef73253f45e18b9ba33db977144de7092d417bfebe2e46f98cca')
options=('!strip')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"
    # Remove useless files and directories
    rm -rf \
        './'{CONTRIBUTORS,HACKING,Makefile} \
        './'{*test*,*dev*,*sh*,README*,pylintrc*,LICENSE*} \
        "$(find . -name \*.pyc)"

    shebang='#!/usr/bin/env python'
    grep -s -l -r "$shebang" | xargs sed -i "1 s|$shebang|${shebang}2|"
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"
    printf 'Compile seahub locales...'
    for locale in ./locale/*/LC_MESSAGES/*.po; do
        msgfmt -o "${locale%.po}.mo" "$locale"
    done
    printf 'done.\n'
}

package() {
    cd "$srcdir/seahub-$pkgver-server/"
    install -dm755 "$pkgdir/usr/share/seafile-server/seahub"
    cp -r -p "./"* "$pkgdir/usr/share/seafile-server/seahub/"
}
