# Co-Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname="paperless-ng"
pkgver=1.4.5
pkgrel=2
pkgdesc="A supercharged version of paperless: scan, index and archive all your physical documents"
url="https://github.com/jonaswinkler/paperless-ng"
license=("GPL3")
arch=("any")
depends=("file"
         "gnupg"
         "gunicorn"
         "imagemagick"
         "mailcap"
         "ocrmypdf"
         "optipng"
         "redis"
         "sqlite"
         "tesseract-data-eng"
         "ttf-liberation"
         "uvicorn"
         "python-aiohttp"
         "python-arrow"
         "python-asgiref"
         "python-async-timeout"
         "python-attrs"
         "python-autobahn"
         "python-automat"
         "python-blessed"
         "python-certifi"
         "python-django-channels"
         "python-django-channels-redis"
         "python-chardet"
         "python-click"
         "python-concurrent-log-handler"
         "python-constantly"
         "python-cryptography"
         "python-daphne"
         "python-dateparser"
         "python-django"
         "python-django-cors-headers"
         "python-django-extensions"
         "python-django-filter"
         "python-django-picklefield"
         "python-django-q"
         "python-django-rest-framework"
         "python-filelock"
         "python-fuzzywuzzy"
         "python-h11"
         "python-hiredis"
         "python-httptools"
         "python-humanfriendly"
         "python-hyperlink"
         "python-idna"
         "python-imap-tools"
         "python-incremental"
         "python-inotify-simple"
         "python-inotifyrecursive"
         "python-joblib"
         "python-langdetect"
         "python-lxml"
         "python-msgpack"
         "python-numpy"
         "python-pathvalidate"
         "python-portalocker"
         "python-psycopg2"
         "python-pyasn1"
         "python-pyasn1-modules"
         "python-pycparser"
         "python-pyopenssl"
         "python-dateutil"
         "python-dotenv"
         "python-gnupg"
         "python-levenshtein"
         "python-magic-ahupp"
         "python-pytz"
         "python-yaml"
         "python-redis"
         "python-regex"
         "python-requests"
         "python-scikit-learn"
         "python-scipy"
         "python-service-identity"
         "python-six"
         "python-sortedcontainers"
         "python-sqlparse"
         "python-threadpoolctl"
         "python-tika"
         "python-twisted"
         "python-txaio"
         "python-tzlocal"
         "python-urllib3"
         "python-uvloop"
         "python-watchdog"
         "python-watchgod"
         "python-wcwidth"
         "python-websockets"
         "python-whitenoise"
         "python-whoosh"
         "python-zope-interface")
optdepends=("jbig2enc: smaller PDF size"
            "postgresql: postgres database")
source=("$url/releases/download/ng-$pkgver/$pkgname-$pkgver.tar.xz"
        "$pkgname.hook"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-webserver.service")
sha256sums=('d8f25bf23de88a695f889de0aa32bab937a6cc576d00fd8c966e511f4f5bc7f1'
            '5496fb7258fe070450586180437d62eac51189228ae7ac75411630a9253336c5'
            'a002bd55b8e5b1ef89a10b907483c56df99d52d03951d464472d8c375e9835d6'
            '3971deb5721eb4e01c2cc0348546cc22a861a1e84458061fce4fbd2cf01b2a1e'
            '091dc2406139bcc52ca1f9acdb4e20723f4511b8ce6849e37c5ab88784dbac12'
            '95d4e665f66f63432c22d9f139769f84575cb427362865931253d9651779ec22'
            '544821a278617c6493e7a27f25266c39d6cc10a877247fa5f807c7eaf1a460cd'
            '47e47fcadf029d85fa6304191afa6362b7675216cb82ed1bad8cce42c0378e7e')
conflicts=("paperless")
backup=("etc/paperless.conf")
options=("!strip")
install="$pkgname.install"

prepare(){
 # use arch linux canonical paths
 sed -i "$pkgname/paperless.conf" \
     -e "s|#PAPERLESS_CONSUMPTION_DIR=../consume|PAPERLESS_CONSUMPTION_DIR=/var/lib/paperless/consume|" \
     -e "s|#PAPERLESS_DATA_DIR=../data|PAPERLESS_DATA_DIR=/var/lib/paperless/data|" \
     -e "s|#PAPERLESS_MEDIA_ROOT=../media|PAPERLESS_MEDIA_ROOT=/var/lib/paperless/media|" \
     -e "s|#PAPERLESS_STATICDIR=../static|PAPERLESS_STATICDIR=/usr/share/paperless/static|" \
     -e "s|#PAPERLESS_CONVERT_TMPDIR=/var/tmp/paperless|PAPERLESS_CONVERT_TMPDIR=/var/lib/paperless/tmp|"
 # remove hardcoded bind address
 sed -i "$pkgname/gunicorn.conf.py" \
     -e "s|bind = '0.0.0.0:8000'||"
 # add custom dir for uploaded files
 printf "\n# Uploads\n\nPAPERLESS_SCRATCH_DIR=/var/lib/paperless/uploads" >> "$pkgname/paperless.conf"
 # add customizable bind address, will be used by paperless-webserver.service
 printf "\n\n# Webserver\n\nGUNICORN_CMD_ARGS='--bind=127.0.0.1:8000'" >> "$pkgname/paperless.conf"
}

package(){
 # program files
 install -d "$pkgdir/usr/share/paperless" "$pkgdir/usr/bin"
 cp -R "$pkgname"/* "$pkgdir/usr/share/paperless"
 # main executable
 chmod 755 "$pkgdir/usr/share/paperless/src/manage.py"
 ln -s "/usr/share/paperless/src/manage.py" "$pkgdir/usr/bin/paperless-manage"
 # config file
 install -D -m 640 "$pkgname/paperless.conf" "$pkgdir/etc/paperless.conf"
 rm "$pkgdir/usr/share/paperless/paperless.conf"
 ln -s "/etc/paperless.conf" "$pkgdir/usr/share/paperless/paperless.conf"
 # optional pacman hook
 install -D -m 644 "$pkgname.hook" "$pkgdir/usr/share/paperless/docs/$pkgname.hook"
 # user and files to create, ownership and permission to set
 install -D -m 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
 # service files
 install -D -m 644 "paperless.target" "$pkgdir/usr/lib/systemd/system/paperless.target"
 install -D -m 644 "paperless-consumer.service" "$pkgdir/usr/lib/systemd/system/paperless-consumer.service"
 install -D -m 644 "paperless-scheduler.service" "$pkgdir/usr/lib/systemd/system/paperless-scheduler.service"
 install -D -m 644 "paperless-webserver.service" "$pkgdir/usr/lib/systemd/system/paperless-webserver.service"
}
