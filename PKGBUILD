# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=7.1.5
pkgrel=2
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
    'python-openpyxl'
    'python-qrcode'
    'python-django-formtools'
    'python-django-simple-captcha'
    'python-dateutil'
    'python-requests'
    'python-pillow'
    'python-pyjwt'
    'python-pycryptodome'
    'python-requests-oauthlib'
    'python-django-ranged-response'
)
optdepends=(
    'python-wsgidav-seafile: Webdav support'
    'python-django-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
# Outdated Python modules, but required by Seahub
_thirdpart=(
    'Django-1.11.29'
    'django-picklefield-2.1.1'
    'django-rest-framework-3.11.1'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    "${_thirdpart[0],,}.tar.gz::https://media.djangoproject.com/releases/1.11/${_thirdpart[0]}.tar.gz"
    "${_thirdpart[1],,}.tar.gz::https://github.com/gintas/${_thirdpart[1]%-*}/archive/v${_thirdpart[1]##*-}.tar.gz"
    "${_thirdpart[2],,}.tar.gz::https://github.com/encode/${_thirdpart[2]%-*}/archive/${_thirdpart[2]##*-}.tar.gz"
    'seahub@.service'
    'nginx.example.conf'
)
sha256sums=(
    'cc7f5a1642d203b2390ae3c30c8a5546d1e829d9d1a5ddf686e558292746ce5c'
    '4200aefb6678019a0acf0005cd14cfce3a5e6b9b90d06145fcdd2e474ad4329c'
    '5985205ec990ad1319e6d238616284b342f018d41a30dc089b76349fb17b15ae'
    '513c0da69619e76715a4ac9149d7715751b9c4820a29476cb143f2bb6b5a3d11'
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

    # Install third part
    for thirdpart in "${_thirdpart[@]}"; do
        cd "$srcdir/$thirdpart"
        python setup.py install \
            --root="$pkgdir/" \
            --install-lib="usr/share/seafile-server/$pkgname/thirdpart/" \
            --optimize=1
    done
    rm -rf "$pkgdir"/usr/{bin,share/seafile-server/"$pkgname"/thirdpart/*.egg-info}

    install -Dm644 \
        "$srcdir/seahub@.service" \
        "$pkgdir/usr/lib/systemd/system/seahub@.service"
    install -Dm644 \
        "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/$pkgname/nginx.conf"
}
