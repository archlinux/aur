# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=7.1.1
pkgrel=1
pkgdesc='The web frontend for seafile server'
arch=('any')
url='https://github.com/haiwen/seahub'
license=('Apache')
depends=(
    "seafile-server>=$pkgver"
    'python-future'
    'python-django-statici18n'
    'python-django-post-office'
    'python-django-webpack-loader'
    'gunicorn'
    'python-pymysql'
    'python-django-picklefield'
    'python-openpyxl'
    'python-qrcode'
    'python-django-formtools'
    'python-django-simple-captcha'
    'python-django-rest-framework'
    'python-dateutil'
    'python-requests'
    'python-pillow'
    'python-pyjwt'
    'python-pycryptodome'
    'python-django-ranged-response'
)
optdepends=(
    'python-wsgidav-seafile: Webdav support'
    'python-django-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'https://www.djangoproject.com/m/releases/1.11/Django-1.11.25.tar.gz'
    'nginx.example.conf'
)
sha256sums=(
    '31dbcfa3ff176925f3de69d9b920fa8407150587be97b3fc568d52042dc44e23'
    '5314e8586285d532b7aa5c6d763b0248d9a977a37efec86d30f0212b82e8ef66'
    '461591ba500d012523d6fdecbcc230461f6fd8d708b92eefdedc8b93b1542171'
)
options=('!strip')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"

    # Remove useless files and directories
    rm -rf \
        ./{CONTRIBUTORS,HACKING,Makefile} \
        ./{*test*,*dev*,*sh*,README*,pylintrc*,LICENSE*} \
        "$(find . -name \*.pyc)"

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
    cp -r -p "./"* "$pkgdir/usr/share/seafile-server/seahub/"

    cd "$srcdir/Django-1.11.25"
    python setup.py install \
        --root="$pkgdir" --optimize=1 \
        --install-lib "usr/share/seafile-server/$pkgname/thirdpart"
    rm -rf "$pkgdir/usr/bin/"

    install -Dm644 \
        "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/$pkgname/nginx.conf"
}
