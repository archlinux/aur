# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>

pkgname=healthchecks
pkgver=2.2.1
pkgrel=1
pkgdesc="A cron monitoring service with a web-based dashboard, API, and notification integrations."
arch=('any')
url="https://github.com/healthchecks/healthchecks"
license=('BSD')
depends=('python-cron-descriptor' 'python-cronsim' 'python-django' 'python-django-compressor'
	 'python-fido2' 'python-pyotp' 'python-pytz' 'python-requests' 'python-segno'
	 'python-statsd' 'python-whitenoise' 'uwsgi' 'uwsgi-plugin-python')
optdepends=('python-psycopg2: Add support for postgreSQL.'
	    'python-apprise: Add support for the Apprise integration.')
backup=("var/lib/$pkgname/local_settings.py" "etc/uwsgi/$pkgname.ini")
install="$pkgname.install"
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
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
        "settings.patch")
sha256sums=('af25ceb07a222ef6dd16788df6b28a34dfe2d8385d1638e91d822dd4bc927985'
	    'a7b75bdd35c6952e06e1cd3824450f7c613aff5e3fb1d9f4f57f517b57cefbde'
	    '355ac237284642e24a3cbe7ddb285bf7dbb802e72ea7fe7c68f0476178ab94fc'
	    '9d32c4d1404079cac9b7a4ccbc97e01d867735c2536f915220d2ac5dffc333e7'
	    '39d54c71890449a8f114c756cb96c87bf40538f7dbb056eb5c19882cc40e59da'
	    'd6eba99257afc8f75092af7d018d56618d0930ad2258fa6963d86089b7b3c35a'
	    '55af4162848e448233fea8eefa42f4bc8c09f99be9d9fb0c8841a9dd38e95dd5'
	    'efa32e5bb8ef6dae017e2e196e8a37e42e73c2aade36743905f544c0c8b936b8'
	    '2407d81ae0224d5c394b35e20a3b29d138fbde3fdde951de9dfea44d97e73eca'
	    'c04de046d176958b3705d751ac09cf018d395b6c37f38977ec4048a561d5041f'
	    '4cb8857de8ef834e0e41eddc56a3e7bbab63adb210196642ca2544b48220f31d'
	    '6daf90731364cfb1b80fb94438d93891be6565cbbf220fbe4ba11b1f3fdbc777')

prepare () {
    cd "$pkgname-$pkgver/hc"
    echo $(pwd)
    patch -p0 -i '../../settings.patch'
}
    
build() {
    cd "$pkgname-$pkgver"
    
    # create the python compiled files, static-collected files and an initial database
    python -m compileall .
    ./manage.py compress --force
    ./manage.py collectstatic --no-input
}

check() {
    cd "$pkgname-$pkgver"
    ./manage.py test
}

package() {
    cd "$pkgname-$pkgver"
    
    # create directories
    install -dm755 "$pkgdir/etc/uwsgi"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/"{healthchecks,sysusers.d,tmpfiles.d}
    install -dm755 "$pkgdir/usr/share/"{doc,licenses,webapps}/"$pkgname"
    install -dm755 "$pkgdir/var/lib/$pkgname"

    # install healthchecks
    cp -r {hc,locale,__pycache__,static,static-collected,stuff,templates} "$pkgdir/usr/share/webapps/$pkgname/"
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
