# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>
# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname="paperless-ngx-venv"
_pkgname="paperless-ngx"
pkgver=2.19.3
pkgrel=1
pkgdesc="paperless-ngx: scan, index and archive all your physical documents"
url="https://docs.paperless-ngx.com/"
license=("GPL-3.0-or-later")
arch=("x86_64" "aarch64")
provides=("paperless" "$pkgname")
conflicts=("paperless" "paperless-ng" "paperless-ngx")
replaces=("paperless-ngx")
makedepends=(
 "uv"
 "findutils"
 "mariadb"
 "postgresql"
 "postgresql-libs"
 "python-virtualenv-tools3"
)
depends=(
 "file"
 "ghostscript"
 "gnupg"
 "imagemagick"
 "nltk-data"
 "optipng"
 "python"
 "poppler"
 "redis"
 "sqlite"
 "tesseract-data-eng"
 "ttf-liberation"
 "unpaper"
)
optdepends=(
 "gotenberg: convert files to pdf"
 "jbig2enc: smaller PDF size"
 "mariadb: mariadb database"
 "postgresql: postgres database"
 "tika-server: extract metadata from files"
)
source=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.tar.xz"
        "paperless.conf"
        "paperless.hook"
        "paperless.sysusers"
        "paperless.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-task-queue.service"
	"paperless-webserver.service")
b2sums=('cd003adbf86113e3848c0d14c4f3baaa47f018fff7e732bc0f1bbbb23e2bbdde78d0d05beaf519249c6c9d6ee39cb082f2a9ce6f4568426b58037147b15f9bfe'
        'a182b37e6d885094e41ff90b82f4685c1a1ae20f0b03cf1478b072e3161875df7a1ea3d2410a0a5791df5fd911430d216bf1be67a996a943e74f7d65df98f76d'
        '747a8b8774fa48073e58b9b3ba55b28ca505b193cf180467b1bcbbe3a2c44931a198f355163b377219299c8b43f0a74550e241f835d9941c594fe318ae5235cd'
        '586ad775e26aef216716c33d8951e00044a7f6866167d27dceab39d51b4fd46527693dfe4e085dc20d2e9193679122ad2b9ac8a1c03a98df747af15ecca24ca2'
        '4a59f0a0c6a4abad23cba01e216909f45a7064e93911b8ba3e3b394f52379e41898b8c9e1246ba034bc8d2fe6dc83f5cad926e265a17da7c7093d997cfe8b4f3'
        'd4eff17cf6b4642211d61545d3722cb626e35b591fc1f11dfc0d4bd3b303ac145777953d405b1bbdf6473512590d50169cf58db8251de2701cee4d7b151ef6be'
        '3a294006b2c7cd856a5034c22634e1c4b6d2c623ef690e1a72b4ae85964b068636520ff3b417a290a7224fceec0d7097b108085f33df40fbd21bb613369fa5f4'
        'fb642f0354a1fefc709c1a5278e042ca47becf1256d8e83ed631546812ff3c74b9821d7ae46dababd90cf6159ba79d94a4f8c31d3e79241a6b909de70776d56c'
        'f8de2bcb231a577b14eb2ff33b646d503d1b071cbc0f3916c37f425098c37ead94c6d86838f5f37066281ce5dea50cab2d4c18792f59039ae77168a058af6c18'
        '706718fee07c4d0b0af759b3054ee914a8492a3f1957b7354546da2ec333ab6581a4cd7f887c3d93181801cd253b685bffa7b11f590d9722e99317e63dd57fb8')
backup=("etc/paperless.conf")
options=("!strip")
install="paperless.install"

prepare(){
 uv venv --clear --no-managed-python -q "$srcdir/venv"
 source "$srcdir/venv/bin/activate"
 uv pip install -r "$srcdir/$_pkgname/requirements.txt"
 deactivate

 # roughly sorted by assumed compatibility
 for f in redis{,-git} valkey keydb redict; do
     fork=$(pacman -Qq $f) && break
 done

 if [[ -n "$fork" && redis != $fork ]]; then
    echo "redis is not available. patching services to use $fork instead ..."
    sed -i "s/redis.service/${fork%-git}.service/g" "$srcdir"/*.service "$srcdir/paperless.target"
 fi
}

package(){
 # program files
 install -d "$pkgdir/usr/share/paperless" "$pkgdir/usr/bin"
 cp -R "$_pkgname"/* "$pkgdir/usr/share/paperless"

 # venv
 install -d "$pkgdir/usr/lib/paperless"
 cp -R "$srcdir/venv"/* "$pkgdir/usr/lib/paperless"
 (cd "$pkgdir/usr/lib/paperless"; virtualenv-tools --update-path /usr/lib/paperless)
 find "$pkgdir/usr/lib/paperless" -type d -name "__pycache__" | xargs rm -rf

 # main executable
 cat << EOF > "$pkgdir/usr/bin/paperless-manage"
#!/usr/bin/bash

source /usr/lib/paperless/bin/activate
exec /usr/share/paperless/src/manage.py \$@
EOF

 # scheduler
 cat << EOF > "$pkgdir/usr/lib/paperless/scheduler"
#!/usr/bin/bash
source /usr/lib/paperless/bin/activate
exec celery --app paperless beat --loglevel INFO
EOF

 # task queue
 cat << EOF > "$pkgdir/usr/lib/paperless/task-queue"
#!/usr/bin/bash
source /usr/lib/paperless/bin/activate
exec celery --app paperless worker --loglevel INFO
EOF

 # webserver
 cat << EOF > "$pkgdir/usr/lib/paperless/webserver"
#!/usr/bin/bash

source /usr/lib/paperless/bin/activate

[ -n "\$PAPERLESS_BIND_ADDR" ] && export GRANIAN_HOST=\$PAPERLESS_BIND_ADDR
[ -n "\$PAPERLESS_PORT" ] && export GRANIAN_PORT=\$PAPERLESS_PORT
[ -n "\$PAPERLESS_WEBSERVER_WORKERS" ] && export GRANIAN_WORKERS=\$PAPERLESS_WEBSERVER_WORKERS
[ -n "\$PAPERLESS_FORCE_SCRIPT_NAME" ] && export GRANIAN_URL_PATH_PREFIX=\$PAPERLESS_FORCE_SCRIPT_NAME

exec granian --interface asginl --ws "paperless.asgi:application"
EOF
 
 chmod 755 "$pkgdir/usr/lib/paperless/"{scheduler,task-queue,webserver} "$pkgdir/usr/share/paperless/src/manage.py" "$pkgdir/usr/bin/paperless-manage"

 # config file
 install -D -m 640 "$srcdir/paperless.conf" "$pkgdir/etc/paperless.conf"
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
