# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=9.0.10
pkgrel=1
pkgdesc='The web frontend for seafile server'
arch=('any')
url='https://github.com/haiwen/seahub'
license=('Apache')
depends=(
    "seafile-server>=$pkgver"
    'python-django'
    'python-future'
    'python-django-statici18n'
    'gunicorn'
    'python-mysqlclient'
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
    'python-requests-oauthlib'
    'python-django-ranged-response'
    'python-chardet'
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
    'django-3.2.16'
    'django-webpack-loader-0.7.0'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    "${_thirdpart[0],,}.tar.gz::https://github.com/django/${_thirdpart[0]%-*}/archive/${_thirdpart[0]##*-}.tar.gz"
    "${_thirdpart[1],,}.tar.gz::https://github.com/django-webpack/${_thirdpart[1]%-*}/archive/${_thirdpart[1]##*-}.tar.gz"
    'seahub@.service'
    'nginx.example.conf'
)
sha256sums=(
    '3a885a8a1894d003264a1d9bbdbae6593a513f7654b7d750171bab1086b8f79d'
    '21f3f72c7a6e938315f437d7225e91c4fe1d8b29d2d2428aaeb86341b9e88863'
    'fef6b13bbd61d682e12f3bd73bb7ac1c398dd0dea22ef2cf34309c6d1078b0d1'
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
