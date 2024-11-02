# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>
# Maintainer: shtrophic <christoph at liebender dot dev>

pkgname="paperless-ngx-venv"
_pkgname="paperless-ngx"
pkgver=2.13.2
pkgrel=1
pkgdesc="A supercharged version of paperless: scan, index and archive all your physical documents"
url="https://docs.paperless-ngx.com/"
license=("GPL3")
arch=("any")
provides=("paperless" "$pkgname")
conflicts=("paperless" "paperless-ng" "paperless-ngx")
replaces=("paperless-ngx")
makedepends=("postgresql-libs"
             "findutils"
)
depends=("python"
         "file"
         "gnupg"
         "imagemagick"
         "nltk-data"
         "optipng"
         "redis"
         "sqlite"
         "tesseract-data-eng"
         "ttf-liberation"
)
optdepends=("jbig2enc: smaller PDF size"
            "postgresql: postgres database"
            "mariadb: mariadb database"
            "tika-server: extract metadata from files"
            "gotenberg: convert files to pdf")
source=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.tar.xz"
        "paperless.hook"
        "paperless.sysusers"
        "paperless.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-task-queue.service"
        "paperless-webserver.service")
b2sums=('c414420ee634df9668134a77705c1830a9e82d744842e6b1fedaa8ade4d8b0a764efd4a7f2f1ad6f014ebb39cac3c39afaabcf3da013bbb3cea311c71dcc4d9c'
        '66073b686ac143f5b6a2c581705ca77a90b48e5ad03208c61976e0421e54c08bb5ce8168a42cd1f11d9f34e270a27ee91102c5fbf5477fdb5a596ad7b38e5750'
        '586ad775e26aef216716c33d8951e00044a7f6866167d27dceab39d51b4fd46527693dfe4e085dc20d2e9193679122ad2b9ac8a1c03a98df747af15ecca24ca2'
        '4a59f0a0c6a4abad23cba01e216909f45a7064e93911b8ba3e3b394f52379e41898b8c9e1246ba034bc8d2fe6dc83f5cad926e265a17da7c7093d997cfe8b4f3'
        'd4eff17cf6b4642211d61545d3722cb626e35b591fc1f11dfc0d4bd3b303ac145777953d405b1bbdf6473512590d50169cf58db8251de2701cee4d7b151ef6be'
        '22789413306028dae8ffbc791599a2f008412417930d093e198157b7d7955be7f386cea550172b5772738106308682d310d7278495087ffd94c257407328aa1a'
        '6ecee87188daf05791ee1dbd152277e2dc09797988c2caf5f01cd2c630925332e3796159e7dce4f3ccb791f925b1c53aa91f89091254b5b55dc51322f9212509'
        '03a55bc65ae9b066e001d56599dcc1d84f19cfba7bdb866bdbb64b6bc53637668a2b0783e3012d5c80638d55667a32058ca2c337c869de5225e19c37b32804f2'
        '0d7784f9e1a960bdba55586032c2682bde0b17f601a08eead332e62a5782319e9dbcbe45b940772107c374f08e39c8d727ec0eb555b15c584238871f4ed5201f')
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

 # create venv
 mkdir -p "$srcdir/venv"
 python -m venv "$srcdir/venv"
 source "$srcdir/venv/bin/activate"
 pip install -r "$srcdir/$pkgname/requirements.txt"
 deactivate
}

package(){
 # program files
 install -d "$pkgdir/usr/share/paperless" "$pkgdir/usr/bin"
 cp -R "$pkgname"/* "$pkgdir/usr/share/paperless"

 # main executable
 cat << EOF > "$pkgdir/usr/bin/paperless-manage"
#!/usr/bin/bash

source /usr/lib/paperless/bin/activate
exec /usr/share/paperless/src/manage.py \$@
EOF

 # venv
 install -d "$pkgdir/usr/lib/paperless"
 cp -R "$srcdir/venv"/* "$pkgdir/usr/lib/paperless" 
 find "$pkgdir/usr/lib/paperless" -type f -exec sed -i "s|$srcdir/venv|/usr/lib/paperless|g" {} +
 find "$pkgdir/usr/lib/paperless" -type d -name "__pycache__" | xargs rm -rf

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
exec gunicorn -c /usr/share/paperless/gunicorn.conf.py paperless.asgi:application
EOF
 
 chmod 755 "$pkgdir/usr/lib/paperless/"{scheduler,task-queue,webserver} "$pkgdir/usr/share/paperless/src/manage.py" "$pkgdir/usr/bin/paperless-manage"

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
