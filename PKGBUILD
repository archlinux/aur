# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>

pkgname=healthchecks
_pkgver=3.9
pkgver=3.9.0
pkgrel=2
pkgdesc="A cron monitoring service with a web-based dashboard, API, and notification integrations."
arch=('any')
url="https://github.com/healthchecks/healthchecks"
license=('BSD-3-Clause')
depends=('python-aiosmtpd' 'python-cron-descriptor' 'python-cronsim' 'python-django'
         'python-django-compressor' 'python-django-stubs-ext' 'python-fido2' 'python-minio'
         'python-oncalendar' 'python-pyotp' 'python-pytz' 'python-pycurl' 'python-pydantic'
         'python-segno' 'python-statsd' 'python-whitenoise' 'uwsgi' 'uwsgi-plugin-python')
optdepends=('python-psycopg2: Add support for postgreSQL.'
            'apprise: Add support for the Apprise integration.')
backup=("var/lib/$pkgname/local_settings.py" "etc/uwsgi/$pkgname.ini")
install="$pkgname.install"
source=("$url/archive/refs/tags/v$_pkgver.tar.gz"
        "hc-clean-db"
        "hc-manage"
        "$pkgname-clean-db.service"
        "$pkgname-clean-db.timer"
        "$pkgname.ini"
        "$pkgname-nginx.conf"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "local_settings.py"
        "settings.patch"
        "webauthn.patch")
sha256sums=('a003ba50a34f9888d924ff399c30fdf3f726f3eef6483f3de0aeca307e0eb781'
            'b3873cb0d45807e15b5bca7e11d1b1d72e6618409ca62b008eea2f84e78fd1b0'
            '355ac237284642e24a3cbe7ddb285bf7dbb802e72ea7fe7c68f0476178ab94fc'
            '9d32c4d1404079cac9b7a4ccbc97e01d867735c2536f915220d2ac5dffc333e7'
            '39d54c71890449a8f114c756cb96c87bf40538f7dbb056eb5c19882cc40e59da'
            'd6eba99257afc8f75092af7d018d56618d0930ad2258fa6963d86089b7b3c35a'
            '55af4162848e448233fea8eefa42f4bc8c09f99be9d9fb0c8841a9dd38e95dd5'
            '3d6cfec48c4d60498080dd3309079a53ba7775c24ca9367b4e6776f6dce4f344'
            '2407d81ae0224d5c394b35e20a3b29d138fbde3fdde951de9dfea44d97e73eca'
            'c04de046d176958b3705d751ac09cf018d395b6c37f38977ec4048a561d5041f'
            '4cb8857de8ef834e0e41eddc56a3e7bbab63adb210196642ca2544b48220f31d'
            '86dbe0d8ac731908833848fdae056722f10a10647c5256eab4413e80663f23ca'
            'a4400f9e7d3683fa23dd72b618af86b6f5fe1f8479843604c8aa05d973c2d57e')

prepare () {
    cd "$pkgname-$_pkgver/hc"
    echo $(pwd)
    patch -p0 -i '../../settings.patch'
    patch -p2 -i '../../webauthn.patch'
}
    
build() {
    cd "$pkgname-$_pkgver"
    
    # create the python compiled files, static-collected files and an initial database
    python -m compileall .
    ./manage.py compress --force
    ./manage.py collectstatic --no-input
}

check() {
    cd "$pkgname-$_pkgver"
    ./manage.py test
}

package() {
    cd "$pkgname-$_pkgver"
    
    # create directories
    install -dm755 "$pkgdir/etc/uwsgi"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/"{healthchecks,sysusers.d,tmpfiles.d}
    install -dm755 "$pkgdir/usr/share/"{doc,licenses,webapps}/"$pkgname"
    install -dm755 "$pkgdir/var/lib/$pkgname"

    # install healthchecks
    cp -r {hc,__pycache__,static,static-collected,stuff,templates} "$pkgdir/usr/share/webapps/$pkgname/"
    install -Dm755 manage.py "$pkgdir/usr/share/webapps/$pkgname/"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/webapps/$pkgname/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/"

    # install our package files - config, scripts, uwsgi and nginx config, service files, sysusers/tmpfiles
    cd "$srcdir"
    install -Dm644 "$pkgname.ini" "$pkgdir/etc/uwsgi/"
    install -Dm644 "$pkgname-nginx.conf" "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm600 "local_settings.py" "$pkgdir/var/lib/$pkgname/"
    ln -s "/var/lib/$pkgname/local_settings.py" "$pkgdir/usr/share/webapps/$pkgname/hc/local_settings.py"

    install -Dm755 hc-manage "$pkgdir/usr/bin"
    install -Dm755 hc-clean-db "$pkgdir/usr/lib/$pkgname"

    install -Dm644 "$pkgname-clean-db.service" "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "$pkgname-clean-db.timer" "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"

    install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
