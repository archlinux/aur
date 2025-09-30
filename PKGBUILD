# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=marzban
pkgver=0.8.4
pkgrel=3
pkgdesc="Unified GUI Censorship Resistant Solution Powered by Xray"
arch=(any)
url="https://github.com/Gozargah/$pkgname"
license=(AGPL-3.0-only)
depends=(
  python-alembic          # alembic==1.14.0
  python-anyio            # anyio==4.2.0
  python-apscheduler      # APScheduler==3.9.1.post1 (AUR)
  python-bcrypt           # bcrypt==4.0.1
  python-certifi          # certifi==2024.07.04
  python-cffi             # cffi==1.17.1
  python-click            # click==8.1.7
  python-commentjson      # commentjson==0.9.0
  python-cryptography     # cryptography==43.0.1
  python-dateutil         # python-dateutil==2.8.2
  python-decouple         # python-decouple==3.6 (AUR)
  python-deprecated       # Deprecated==1.2.13
  python-dotenv           # python-dotenv==0.21.1
  python-fastapi          # fastapi==0.115.2
  python-grpcio           # grpcio==1.67.1
  python-grpcio-tools     # grpcio-tools==1.67.1
  python-httptools        # httptools==0.6.4
  python-jdatetime        # jdatetime==4.1.1 (AUR)
  python-jinja            # Jinja2==3.1.4
  python-markupsafe       # MarkupSafe==2.1.1
  python-passlib          # passlib==1.7.4
  python-psutil           # psutil==5.9.4
  python-python-multipart # python-multipart==0.0.7
  python-pyjwt            # PyJWT==2.8.0
  python-pymysql          # PyMySQL==1.1.1
  python-pydantic         # pydantic==2.10.4
  python-pyopenssl        # pyOpenSSL==24.2.1
  python-pytelegrambotapi # pyTelegramBotAPI==4.9.0 (AUR)
  python-pysocks          # PySocks==1.7.1
  python-pyyaml           # PyYAML==6.0.2
  python-qrcode           # qrcode==7.4.2
  python-requests         # requests==2.32.3
  python-rich             # rich==13.7.1
  python-rpyc             # rpyc==6.0.0
  python-rsa              # rsa==4.9
  python-sniffio          # sniffio==1.3.0
  python-sqlalchemy       # SQLAlchemy==2.0.36
  python-starlette        # starlette==0.40.0
  python-typer            # typer==0.7.0
  python-urllib3          # urllib3==1.26.19
  python-websocket-client # websocket-client==1.7.0
  python-websockets       # websockets==12.0
  uvicorn                 # uvicorn==0.27.0.post1 (AUR)
  xray
)
options=(!debug)
backup=(
  var/lib/$pkgname/.env
  var/lib/$pkgname/xray_config.json
  )
install=$pkgname.install
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
  $pkgname.service
)
sha512sums=('e11e798265976b329747b5dba24d2944232128ff20de1584b23256ab7800bf2a2782f0d969458589f9f80677e12e312785ca4c64afd8257128c7c344b381e971'
            '743c4721357b53a78ea73246af0561bbc7815d9aa48ab0bad945f296e066c485bbc0984464394d530e643e6f26dbdeae3b06cbda3263f6973b2c054261cb461f')
b2sums=('803d112a1d402a467b3520c2c20489ab94271cae285627c8d23efb106595289ba15132a3a59535529fd8206e50b8163af597a395918b2817abe13394d868cb48'
        'a565a987b4f8bb442dcd76eb4d6759c072363270d9eacfa7d23d331a21ac4ac25698be4d219a0c3d3818f415d93d2c04826a085dd087935dad4eb3308cb4a4a9')

prepare() {
  cd "$srcdir"/${pkgname^}-$pkgver
  cp .env{.example,}
  sed -i 's|# XRAY_JSON = "xray_config.json"|XRAY_JSON = "/var/lib/marzban/xray_config.json"|'                                     .env
  sed -i 's|# XRAY_EXECUTABLE_PATH = "/usr/local/bin/xray"|XRAY_EXECUTABLE_PATH = "/usr/bin/xray"|'                                .env
  sed -i 's|# XRAY_ASSETS_PATH = "/usr/local/share/xray"|XRAY_ASSETS_PATH = "/usr/share/xray"|'                                    .env
  sed -i 's|# SQLALCHEMY_DATABASE_URL = "sqlite:///db.sqlite3"|SQLALCHEMY_DATABASE_URL = "sqlite:////var/lib/marzban/db.sqlite3"|' .env
}

package() {
  cd "$srcdir"/${pkgname^}-$pkgver
  install -vDm 644 .env.example                -t "$pkgdir"/opt/$pkgname/
  install -vDm 644 alembic.ini                 -t "$pkgdir"/opt/$pkgname/
  install -vDm 644 {config,main}.py            -t "$pkgdir"/opt/$pkgname/
  install -vDm 755 $pkgname-cli.py             -t "$pkgdir"/opt/$pkgname/
  install -vDm 644 .env                        -t "$pkgdir"/var/lib/$pkgname/
  install -vDm 644 xray_config.json            -t "$pkgdir"/var/lib/$pkgname/
  install -vd                                     "$pkgdir"/usr/bin
  install -vDm 644 ../$pkgname.service         -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE                     -t "$pkgdir"/usr/share/licenses/$pkgname/            
  ln      -sv      /opt/$pkgname/$pkgname-cli.py  "$pkgdir"/usr/bin/$pkgname-cli
  find app -type f -exec install -vDm 644 {}      "$pkgdir"/opt/$pkgname/{} \;
  find cli -type f -exec install -vDm 644 {}      "$pkgdir"/opt/$pkgname/{} \;
  find xray_api -type f -exec install -vDm 644 {} "$pkgdir"/opt/$pkgname/{} \;
}
