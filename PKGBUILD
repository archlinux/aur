# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname="odoo"
pkgver=17.0
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
        "python-ebaysdk" # 16
        "python-freezegun"
        "python-geoip2" # 17
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
        "python-pyopenssl"
        "python-pypdf2"
        "python-pyserial"
        "python-pytz"
        "python-pyusb"
        "python-qrcode"
        "python-reportlab"
        "python-requests"
        "python-rjsmin" # 17
        "python-stdnum"
        "python-urllib3" # 16
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
b2sums=('246e4c02a6e41a4b7d95a897eaec080f45465eb38ee6e121b3c6db7586d65de866465d8ea03bc43bf5c2891417ab55f7051a3d0a960627aa72fbaea8def4401b'
        '3254a9857e0bf77b692a610bb929d21decea4e4fb7e044f97b69d026bf4ae94cfac0a4a220c2f842e8d32d74f7785a3a5f848ca248fbde7b86b2b5cc7b593541'
        '1ef682d87ba12dd8a185ba36701b737f8feb0c1e6eb4b23302a0dc5930ef63c990af65bc45a36313f879a29a23cbdb602e7fc34ba9cee2e46d9a3d8407d5751a'
        'a14636791b4f0ae76da8a69e95a6926287f5cfa215499be9a6880b6b63fa2081ecdd32ea0dc10fe4d7fe2d14968ac4ed08701c972bc2170e9f4dc36efa406c02'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        '80e9a5954c3eece0be4c4f44e60d519a30e6264fd1d57a77eba46581faf71f66c4404247b71925dd0970a5b7bfb2bda99cc3c38bd663f443b258385d0f85be83')
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
