# Maintainer: Joffrey <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=13.0.12
pkgrel=1
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
    'python-cairosvg'
)
optdepends=(
    'python-pymysql: Installation script'
    'python-wsgidav-seafile: Webdav support'
    'python-pylibmc: Memcached support'
    'python-redis: Redis support'
    'ffmpeg: For video thumbnails'
)
source=(
    "$pkgname-$pkgver-server.tar.gz::$url/archive/v$pkgver-server.tar.gz"
    'seahub@.service'
    'seahub.service'
    'nginx.example.conf'
    'fix_gunicorn_no_daemon.diff'
    'fix_seafevents_error.diff'
    'fix_cache_provider.diff'
)
sha256sums=(
    'c86098797d1144c40d11f8a067b0fb02be712fd657204f1698a14a2f96801ed7'
    'ba48ce265a8f411184ab92e8d914d2a02e06f19156333d6058eb3fcf861d780a'
    'c80abc71a12d86c6e42f860a69acfc079f1542a9e21f1b93692ce3313130b21c'
    '9ef2e5753f031ff6c5e2e1c7fd7399a01cbde795a3d01fac4749fa372ca1f689'
    'cbb614ada361aa594be8cafbdb532788a3884f4f63998748cfede8b49be4664c'
    '86ada5079decbc58d8afd4fbd9b14ff01fe1f4a377420429171d1faf66ef6e91'
    '19666e434d6cde4d5e016d657d8095a52f31d10f8b61293bb3d902e66e3b50ff'
)
options=('!strip')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-server"

    patch -p1 -i "$srcdir/fix_gunicorn_no_daemon.diff"
    patch -p1 -i "$srcdir/fix_seafevents_error.diff"
    patch -p1 -i "$srcdir/fix_cache_provider.diff"

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
    cd "$srcdir/seahub-$pkgver-server"

    install -dm755 "$pkgdir/usr/share/seafile-server/seahub"
    cp -rp ./* "$pkgdir/usr/share/seafile-server/seahub"
    mv "$pkgdir/usr/share/seafile-server/seahub/scripts/"* \
        "$pkgdir/usr/share/seafile-server"

    python -m compileall -f -j 0 -o 1 \
        -s "$pkgdir" -p / "$pkgdir/usr/share/seafile-server/seahub"

    install -Dm644 "$srcdir"/*.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 \
        "$srcdir/nginx.example.conf" \
        "$pkgdir/etc/webapps/$pkgname/nginx.conf"
}
