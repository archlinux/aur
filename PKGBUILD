# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname="odoo-17"
_pkgname="odoo"
pkgver=17.0
pkgrel=4
pkgdesc="Odoo. Open Source Apps To Grow Your Business."
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-or-later")
conflicts=("openerp" "odoo")
replaces=("openerp", "odoo")
depends=("postgresql"
        "wkhtmltopdf"
        "python310"
	"python310-pip")
source=("https://nightly.odoo.com/$pkgver/nightly/src/${_pkgname}_$pkgver.latest.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
b2sums=('SKIP'
        '5ac1e505808280b824a364bc821014e219c42677ded3be1fb066bf356798e571b3bab47bc7bba5947268c738de3d68c94c8d592597593f2f457e83b3321a1ff9'
        '1ef682d87ba12dd8a185ba36701b737f8feb0c1e6eb4b23302a0dc5930ef63c990af65bc45a36313f879a29a23cbdb602e7fc34ba9cee2e46d9a3d8407d5751a'
        'a14636791b4f0ae76da8a69e95a6926287f5cfa215499be9a6880b6b63fa2081ecdd32ea0dc10fe4d7fe2d14968ac4ed08701c972bc2170e9f4dc36efa406c02'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        'f899025f7637aaed2d231de33e5c2d2a831f21f038cb86b9794f9f75224f6eb14b6c9baf95663278ae15568a80ac49354446202232f38577991a24d332373b53')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

build() {
    cd "$_pkgname-$pkgver.post"*
    pip3.10 install build installer wheel

    # provide out-of-the-box compatibility with the merge of libldap and libldap_r that happened with OpenLDAP's 2.5 release
    sed -i 's/python-ldap==3.4.0/python-ldap==3.4.2/' requirements.txt

    pip3.10 install -r requirements.txt

    # Build the package
     python3.10 -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver.post"*

    # provide out-of-the-box compatibility with the merge of libldap and libldap_r that happened with OpenLDAP's 2.5 release
    sed -i 's/python-ldap==3.4.0/python-ldap==3.4.2/' requirements.txt

    # Install dependencies
    pip3.10 install -r requirements.txt --target=$pkgdir/usr/lib/python3.10/site-packages
    
    # Install Odoo DPD France dependency 
    pip3.10 install xmltodict --target=$pkgdir/usr/lib/python3.10/site-packages

    # Install package
    python3.10 -m installer --destdir="$pkgdir" dist/*.whl

    # Configuration file
    install -d -m 750 "$pkgdir/etc/odoo"
    install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"

    # Logrotate file
    install -D -m 644 "$srcdir/odoo.logrotate" "$pkgdir/etc/logrotate.d/odoo"

    # Systemd files
    install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
    install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
    install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"
}
