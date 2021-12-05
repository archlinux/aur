# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname="odoo"
pkgver=15.0
_pkgsubver=20211204
pkgrel=1
pkgdesc="Web-based Open Source Business Apps"
url="https://www.odoo.com/"
arch=("any")
license=("GPL3")
conflicts=("openerp")
replaces=("openerp")
makedepends=("python-setuptools")
depends=("postgresql"
        #"sassc" # not needed
        "wkhtmltopdf-static"
        "python-babel"
        "python-chardet"
        "python-decorator"
        "python-docutils"
        "python-ebaysdk"
        "python-feedparser"
        # "python-freezegun" # used for testing
        "python-gevent"
        "python-greenlet"
        "python-html2text"
        "python-idna"
        "python-jinja"
        "python-libsass"
        "python-lxml"
        "python-mako"
        "python-markupsafe"
        "python-mock"
        "python-num2words"
        "python-ofxparse"
        "python-passlib"
        "python-pillow"
        "python-polib"
        "python-psutil"
        "python-psycopg2"
        "python-pydot"
        "python-ldap"
        #"python-pyparsing" # not needed
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
        #"python-vatnumber" # not needed
        "python-vobject"
        "python-werkzeug"
        "python-xlsxwriter"
        "python-xlwt"
        "python-xlrd"
        "python-zeep"
        )
source=("https://nightly.odoo.com/$pkgver/nightly/src/${pkgname}_$pkgver.$_pkgsubver.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
sha256sums=('79a1796ff452cf3bf22d0bcb284588ab0f846b528c3b7ec3d816c51fa23e9f46'
            '33d3331e47ab31705e2122ee9cebf791bf2a23169767960fd949ff26e3fb420e'
            '0cfb2d663be2c23491be71ded73284a6a81460e44e5e1f3c37cfcdd73ee51c01'
            '949cfeb604af5425860cffa197b7464b9d87ab3999424d890b2210511823264f'
            'b06fcf6f6fc0cd7e3dbc7699bbd31138b39a0a1d1f8d06984ff2605a5eeb3257'
            'b6bae94d1a5e51c6cae42987124dd1528626a6f87331c1777c104394c34a95cb')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

prepare(){
 # posixemulation has been removed in werkzeug 2.0
 sed -i "$pkgname-$pkgver.post$_pkgsubver/$pkgname/tools/_vendor/sessions.py" \
     -e "s/from werkzeug.posixemulation import rename/#from werkzeug.posixemulation import rename/" \
     -e "s/rename(tmp, fn)/os.rename(tmp, fn)/"
}

build(){
 cd "$pkgname-$pkgver.post$_pkgsubver"
 python setup.py build >/dev/null
}

package(){
 cd "$pkgname-$pkgver.post$_pkgsubver"
 python setup.py install --root="$pkgdir" --optimize=1 --skip-build >/dev/null

 install -d -m 750 "$pkgdir/etc/odoo"
 install -d -m 700 "$pkgdir/var/lib/odoo"
 install -d "$pkgdir/etc/logrotate.d"
 install -d "$pkgdir/usr/lib/systemd/system"

 install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"
 install -D -m 644 "$srcdir/odoo.logrotate" "$pkgdir/etc/logrotate.d/odoo"
 install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
 install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
 install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"
}
