# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=11.0.4
pkgrel=1
pkgdesc='The web frontend for seafile server'
arch=('any')
url='https://github.com/haiwen/seahub'
license=('Apache')
depends=(
    "seafile-server>=$pkgver"
    'python-setuptools'
    'python-django'
    'python-django-statici18n'
    'python-django-webpack-loader'
    'python-django-picklefield'
    'python-django-formtools'
    'python-django-simple-captcha'
    'python-django-saml2'
    'python-django-rest-framework'
    'python-dateutil'
    'python-pyjwt'
    'python-pycryptodome'
    'python-requests'
    'python-requests-oauthlib'
    'python-future'
    'gunicorn'
    'python-mysqlclient'
    'python-qrcode'
    'python-pillow'
    'python-chardet'
    'python-cffi'
    'python-openpyxl'
    'python-markdown'
    'python-bleach'
    'python-ldap'
)
optdepends=(
    'python-pymysql: Installation script'
    'python-wsgidav-seafile: Webdav support'
    'python-django-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'seahub@.service'
    'nginx.example.conf'
)
sha256sums=(
    '9406575f8fde8f91f99115835858813caa3f2ea499cb5c7d7d3c9d93aad3672f'
    '67bb375871ce908b48bef53277284c9d8f80ee2e733efc89cb66d987647195e4'
    '461591ba500d012523d6fdecbcc230461f6fd8d708b92eefdedc8b93b1542171'
)
options=('!strip')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"

    # Remove useless files and directories
    rm -rf \
        ./{CONTRIBUTORS,HACKING,Makefile} \
        ./{*test*,*dev*,*sh*,README*,pylintrc*,LICENSE*} \
        ./scripts/{build,pro.py,*.{md,conf}}
    find . -type f \( -name '*.pyc' -o -name '.git*' \) -delete

    # Fix paths to Gunicorn
    sed -e 's|gunicorn_exe=.*|gunicorn_exe=/usr/bin/gunicorn|g' \
        -e 's|thirdpart/bin/gunicorn|$gunicorn_exe|g' \
        -i ./scripts/seahub.sh

    sed -i -E "/SEAFILE_VERSION/s/[0-9.]+/$pkgver/" ./seahub/settings.py
}

build() {
    cd "$srcdir/$pkgname-$pkgver-server"

    for locale in ./locale/*/LC_MESSAGES/*.po; do
        echo "$locale"
        msgfmt -vo "${locale%.po}.mo" "$locale"
    done
}

package() {
    cd "$srcdir/seahub-$pkgver-server/"

    install -dm755 "$pkgdir/usr/share/seafile-server/seahub"
    cp -rp ./* "$pkgdir/usr/share/seafile-server/seahub"
    mv "$pkgdir/usr/share/seafile-server/seahub/scripts/"* \
        "$pkgdir/usr/share/seafile-server"

    python -m compileall -f -j 0 -o 1 \
        -s "$pkgdir" -p / "$pkgdir/usr/share/seafile-server/seahub"

    install -Dm644 \
        "$srcdir/seahub@.service" \
        "$pkgdir/usr/lib/systemd/system/seahub@.service"
    install -Dm644 \
        "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/$pkgname/nginx.conf"
}
