# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=10.0.1
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
    'python-openpyxl'
    'python-cffi'
    'python-markdown'
    'python-bleach'
)
optdepends=(
    'python-pymysql: Installation script'
    'python-pysaml2: SSO support'
    'python-django-saml2: SSO support'
    'python-wsgidav-seafile: Webdav support'
    'python-django-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
# Outdated Python modules, but required by Seahub
_thirdpart=(
    'django-3.2.18'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    "${_thirdpart[0],,}.tar.gz::https://github.com/django/${_thirdpart[0]%-*}/archive/${_thirdpart[0]##*-}.tar.gz"
    'seahub@.service'
    'nginx.example.conf'
)
sha256sums=(
    '4df0697ea9ed62ceb53f2f17dcc35f4abf2b69f276c87c913bb30a72f6007cb2'
    'b7894330d7fd9a268cf5b430b09db111508c5f7a98fa4ffc8c0b88aada9b6dbf'
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

    # Install third part
    for thirdpart in "${_thirdpart[@]}"; do
        cd "$srcdir/$thirdpart"
        python setup.py install \
            --root="$pkgdir/" \
            --install-lib="usr/share/seafile-server/$pkgname/thirdpart" \
            --optimize=0
    done
    rm -rf "$pkgdir"/usr/{bin,share/seafile-server/"$pkgname"/thirdpart/*.egg-info}

    python -m compileall -f -j 0 -o 1 \
        -s "$pkgdir" -p / "$pkgdir/usr/share/seafile-server/seahub"

    install -Dm644 \
        "$srcdir/seahub@.service" \
        "$pkgdir/usr/lib/systemd/system/seahub@.service"
    install -Dm644 \
        "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/$pkgname/nginx.conf"
}
