# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname="odoo"
pkgver=16.0
pkgrel=1
pkgdesc="Web-based Open Source Business Apps"
url="https://www.odoo.com/"
arch=("any")
license=("GPL3")
conflicts=("openerp")
replaces=("openerp")
depends=("postgresql"
        "wkhtmltopdf"
        "python"
        "python-babel"
        "python-chardet"
        "python-cryptography" # 16
        "python-dateutil" # 16
        "python-decorator"
        "python-docutils"
        #"python-ebaysdk" # 16
        #"python-feedparser" # 16
        "python-freezegun"
        "python-gevent"
        "python-greenlet"
        "python-html2text"
        "python-idna"
        "python-jinja"
        "python-libsass"
        "python-lxml"
        #"python-mako" # 16
        "python-markupsafe"
        #"python-mock" # 16
        "python-num2words"
        "python-ofxparse"
        "python-passlib"
        "python-pillow"
        "python-polib"
        "python-psutil"
        "python-psycopg2"
        "python-pydot"
        #"python-pyparsing" # 16
        "python-pypdf2"
        "python-pyserial"
        "python-dateutil"
        "python-pyopenssl"
        "python-pytz"
        "python-pyusb"
        "python-qrcode"
        "python-reportlab"
        "python-requests"
        "python-stdnum"
        "python-urllib3" # 16
        #"python-vatnumber" # 16
        "python-vobject"
        "python-werkzeug"
        "python-xlrd"
        "python-xlsxwriter"
        "python-xlwt"
        "python-zeep"
        )
optdepends=("python-ldap: LDAP connector" # 16
           )
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://nightly.odoo.com/$pkgver/nightly/src/${pkgname}_$pkgver.latest.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
sha256sums=('SKIP'
            'c0fc3e95000eef53113efb1dfa57cae461b4bf646b945f6842e161df5cd9e4b2'
            '0cfb2d663be2c23491be71ded73284a6a81460e44e5e1f3c37cfcdd73ee51c01'
            '9eb10d79d38ade80cc6c9ee366d0e50ea42d76d860e564cbb8776e0f4ba776d9'
            'b06fcf6f6fc0cd7e3dbc7699bbd31138b39a0a1d1f8d06984ff2605a5eeb3257'
            'b6bae94d1a5e51c6cae42987124dd1528626a6f87331c1777c104394c34a95cb')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

build(){
 cd "$pkgname-$pkgver.post"*
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver.post"*
 python -m installer --destdir="$pkgdir" dist/*.whl
 # required directories
 install -d -m 750 "$pkgdir/etc/odoo"
 install -d -m 700 "$pkgdir/var/lib/odoo"
 install -d "$pkgdir/etc/logrotate.d"
 install -d "$pkgdir/usr/lib/systemd/system"
 # configuration file
 install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"
 # logrotate file
 install -D -m 644 "$srcdir/odoo.logrotate" "$pkgdir/etc/logrotate.d/odoo"
 # systemd files
 install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
 install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
 install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"
}
