# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname="paperless-ngx"
pkgver=1.14.2
pkgrel=2
pkgdesc="A supercharged version of paperless: scan, index and archive all your physical documents"
url="https://github.com/paperless-ngx/paperless-ngx"
license=("GPL3")
arch=("any")
provides=("paperless" "$pkgname")
conflicts=("paperless" "paperless-ng")
depends=("file"
         "gnupg"
         "gunicorn"
         "imagemagick"
         "mailcap"
         "nltk-data"
         "ocrmypdf"
         "optipng"
         "redis"
         "sqlite"
         "tesseract-data-eng"
         "ttf-liberation"
         "uvicorn"
         "python-aiohttp"
         "python-aioredis1" # until components have been updated
         "python-arrow"
         "python-asgiref"
         "python-async-timeout"
         "python-attrs"
         "python-autobahn"
         "python-automat"
         "python-blessed"
         "python-brotli"
         "python-celery"
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
         "python-django-celery-results"
         "python-django-compression-middleware"
         "python-django-cors-headers"
         "python-django-extensions"
         "python-django-filter"
         "python-django-guardian"
         "python-django-ipware"
         "python-django-picklefield"
         "python-django-rest-framework"
         "python-django-rest-framework-guardian"
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
         "python-pdf2image"
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
         "python-magic"
         "python-nltk"
         "python-pytz"
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
         "python-wheel"
         "python-whitenoise"
         "python-whoosh"
         "python-yaml"
         "python-zope-interface"
         "python-zstandard"
         "pyzbar")
optdepends=("jbig2enc: smaller PDF size"
            "postgresql: postgres database"
            "mariadb: mariadb database"
            "python-mysqlclient: connect to mariadb")
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        "paperless.hook"
        "paperless.sysusers"
        "paperless.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-task-queue.service"
        "paperless-webserver.service")
sha256sums=('6375981610c250dac385674c09f065326388e85f0c6859570cc08a65da896614'
            '4e2ca67d7eedf14ba839af852907e1d76aa0a5ee5f4f740a3aee786c24035ace'
            'a002bd55b8e5b1ef89a10b907483c56df99d52d03951d464472d8c375e9835d6'
            '3971deb5721eb4e01c2cc0348546cc22a861a1e84458061fce4fbd2cf01b2a1e'
            'b64182b491708a907d2a65a2f52d51f4cf897cd8b5e874483a9ed22bbfe3b2e7'
            '95d4e665f66f63432c22d9f139769f84575cb427362865931253d9651779ec22'
            'fd25de09705de3b70bfe459b1f917061a2e2d342fdfa3b51982a3e5dfffee3f7'
            'fe099876da92b6c13b45efd38c9fd55c326c57321a0bf69a0fd8f61f4f0ca298'
            '47e47fcadf029d85fa6304191afa6362b7675216cb82ed1bad8cce42c0378e7e')
backup=("etc/paperless.conf")
options=("!strip")
install="paperless.install"

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
 install -D -m 644 "paperless.hook" "$pkgdir/usr/share/paperless/docs/paperless.hook"
 # user and files to create, ownership and permission to set
 install -D -m 644 "paperless.sysusers" "$pkgdir/usr/lib/sysusers.d/paperless.conf"
 install -D -m 644 "paperless.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/paperless.conf"
 # service files
 install -D -m 644 "paperless.target" "$pkgdir/usr/lib/systemd/system/paperless.target"
 install -D -m 644 "paperless-consumer.service" "$pkgdir/usr/lib/systemd/system/paperless-consumer.service"
 install -D -m 644 "paperless-scheduler.service" "$pkgdir/usr/lib/systemd/system/paperless-scheduler.service"
 install -D -m 644 "paperless-task-queue.service" "$pkgdir/usr/lib/systemd/system/paperless-task-queue.service"
 install -D -m 644 "paperless-webserver.service" "$pkgdir/usr/lib/systemd/system/paperless-webserver.service"
}
