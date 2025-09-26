# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=12.0.14
pkgrel=2
pkgdesc='The web frontend for seafile server'
arch=('any')
url='https://github.com/haiwen/seahub'
license=('Apache-2.0')
depends=(
    "seafile-server>=$pkgver"
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
    'pypinyin'
    'python-dnspython'
    'python-pillow-heif'
)
optdepends=(
    'python-pymysql: Installation script'
    'python-wsgidav-seafile: Webdav support'
    'python-pylibmc: Memcached support'
    'ffmpeg: For video thumbnails'
)
django_version=4.2.24
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    "python-django-$django_version.tar.gz::https://github.com/django/django/archive/$django_version.tar.gz"
    'seahub@.service'
    'nginx.example.conf'
    'fix_avatar_storage.diff'
    'fix_gunicorn_no_daemon.diff'
    'fix_seafevents_error.diff'
)
sha256sums=(
    '127ad4161f37321ac198c09625ada6114dbfe0ea5fdd6d9fa568073bb9483fe9'
    'a1bde6af40756bc1ffd574c6e9e054e514890500b437a39a053abfbf555f2f5e'
    '67bb375871ce908b48bef53277284c9d8f80ee2e733efc89cb66d987647195e4'
    '461591ba500d012523d6fdecbcc230461f6fd8d708b92eefdedc8b93b1542171'
    '371f9c01a31691167b76c43e29277c266a4b3aec985fb29ff8a0180a8db5b59f'
    'cbb614ada361aa594be8cafbdb532788a3884f4f63998748cfede8b49be4664c'
    'fc0c98d3b381752976557f53390ee59e8956d3fa2418cdeb97888bf3de37d7ad'
)
options=('!strip')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"

    patch -p1 -i "$srcdir/fix_avatar_storage.diff"
    patch -p1 -i "$srcdir/fix_gunicorn_no_daemon.diff"
    patch -p1 -i "$srcdir/fix_seafevents_error.diff"

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

    cp -a "$srcdir/django-$django_version/django" \
        "$pkgdir/usr/share/seafile-server/$pkgname/thirdpart"
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
