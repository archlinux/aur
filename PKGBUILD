# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>
# Maintainer: shtrophic <christoph at liebender dot dev>

pkgname="paperless-ngx-venv"
_pkgname="paperless-ngx"
pkgver=2.13.4
pkgrel=3
pkgdesc="A supercharged version of paperless: scan, index and archive all your physical documents (version with bundled dependencies)"
url="https://docs.paperless-ngx.com/"
license=("GPL3")
arch=("any")
provides=("paperless" "$pkgname")
conflicts=("paperless" "paperless-ng" "paperless-ngx")
replaces=("paperless-ngx")
makedepends=(
 "findutils"
 "mariadb"
 "postgresql"
 "postgresql-libs"
)
depends=(
 "file"
 "gnupg"
 "imagemagick"
 "nltk-data"
 "optipng"
 "python"
 "redis"
 "sqlite"
 "tesseract-data-eng"
 "ttf-liberation"
)
optdepends=(
 "gotenberg: convert files to pdf"
 "jbig2enc: smaller PDF size"
 "mariadb: mariadb database"
 "postgresql: postgres database"
 "tika-server: extract metadata from files"
)
source=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.tar.xz"
        "paperless.hook"
        "paperless.sysusers"
        "paperless.tmpfiles"
        "paperless.target"
        "paperless-consumer.service"
        "paperless-scheduler.service"
        "paperless-task-queue.service"
        "paperless-webserver.service"
        "requirements.patch"
        "whoosh-filters.patch"
        "whoosh-intraword.patch")
b2sums=('948521ce122c898c40d03e77a34605619243a9349570d5032dc2617edebd1447cb779811cf13b0d864348fe962c102444f6374aa185dbb844aaab2ff2f7f1c30'
        '747a8b8774fa48073e58b9b3ba55b28ca505b193cf180467b1bcbbe3a2c44931a198f355163b377219299c8b43f0a74550e241f835d9941c594fe318ae5235cd'
        '586ad775e26aef216716c33d8951e00044a7f6866167d27dceab39d51b4fd46527693dfe4e085dc20d2e9193679122ad2b9ac8a1c03a98df747af15ecca24ca2'
        '4a59f0a0c6a4abad23cba01e216909f45a7064e93911b8ba3e3b394f52379e41898b8c9e1246ba034bc8d2fe6dc83f5cad926e265a17da7c7093d997cfe8b4f3'
        'd4eff17cf6b4642211d61545d3722cb626e35b591fc1f11dfc0d4bd3b303ac145777953d405b1bbdf6473512590d50169cf58db8251de2701cee4d7b151ef6be'
        '22789413306028dae8ffbc791599a2f008412417930d093e198157b7d7955be7f386cea550172b5772738106308682d310d7278495087ffd94c257407328aa1a'
        '6ecee87188daf05791ee1dbd152277e2dc09797988c2caf5f01cd2c630925332e3796159e7dce4f3ccb791f925b1c53aa91f89091254b5b55dc51322f9212509'
        '03a55bc65ae9b066e001d56599dcc1d84f19cfba7bdb866bdbb64b6bc53637668a2b0783e3012d5c80638d55667a32058ca2c337c869de5225e19c37b32804f2'
        '0d7784f9e1a960bdba55586032c2682bde0b17f601a08eead332e62a5782319e9dbcbe45b940772107c374f08e39c8d727ec0eb555b15c584238871f4ed5201f'
        '799d3f49c2e4c77bea0063f320b16d4521f881b53ad4b54081a352e0463b2bbeb2b44403e621d09927c0e7051db3d2a317067178b0b171e991483b8c3566ef42'
        '216180663dd139513b51e087e1ee59ada29482fd47e138caa9a9aead362722f9111c164e77f9f336afbad05326cc558e256d90f89a087fdbc1ba606bc2ee4517'
        '917d8a50a18b329abfcb19ee25fe8e85636979673f73ca806325eee8c0aa28af60580ac1d52d5b593ecf9e1d87a4bee051533988224b875bc7f42da02baf634b')
backup=("etc/paperless.conf")
options=("!strip")
install="paperless.install"

prepare(){
 # use arch linux canonical paths
 sed -i "$_pkgname/paperless.conf" \
     -e "s|#PAPERLESS_CONSUMPTION_DIR=../consume|PAPERLESS_CONSUMPTION_DIR=/var/lib/paperless/consume|" \
     -e "s|#PAPERLESS_DATA_DIR=../data|PAPERLESS_DATA_DIR=/var/lib/paperless/data|" \
     -e "s|#PAPERLESS_MEDIA_ROOT=../media|PAPERLESS_MEDIA_ROOT=/var/lib/paperless/media|" \
     -e "s|#PAPERLESS_STATICDIR=../static|PAPERLESS_STATICDIR=/usr/share/paperless/static|" \
     -e "s|#PAPERLESS_CONVERT_TMPDIR=/var/tmp/paperless|PAPERLESS_CONVERT_TMPDIR=/var/lib/paperless/tmp|"
 # remove hardcoded bind address
 sed -i "$_pkgname/gunicorn.conf.py" \
     -e "s|bind = '0.0.0.0:8000'||"
 # add custom dir for uploaded files
 printf "\n# Uploads\n\nPAPERLESS_SCRATCH_DIR=/var/lib/paperless/uploads" >> "$_pkgname/paperless.conf"
 # add customizable bind address, will be used by paperless-webserver.service
 printf "\n\n# Webserver\n\nGUNICORN_CMD_ARGS='--bind=127.0.0.1:8000'" >> "$_pkgname/paperless.conf"

 # workaround for https://github.com/paperless-ngx/paperless-ngx/issues/6862
 patch "$srcdir/$_pkgname/requirements.txt" < "$srcdir/requirements.patch"

 # create venv
 mkdir -p "$srcdir/venv"
 python -m venv "$srcdir/venv"
 source "$srcdir/venv/bin/activate"
 pip install -r "$srcdir/$_pkgname/requirements.txt"
 deactivate

 # fix regex warnings
 for whoosh in filters intraword; do
	patch "$srcdir/venv/lib/python3.12/site-packages/whoosh/analysis/$whoosh.py" < "$srcdir/whoosh-$whoosh.patch"
 done
}

package(){
 # program files
 install -d "$pkgdir/usr/share/paperless" "$pkgdir/usr/bin"
 cp -R "$_pkgname"/* "$pkgdir/usr/share/paperless"

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
 install -D -m 640 "$_pkgname/paperless.conf" "$pkgdir/etc/paperless.conf"
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
