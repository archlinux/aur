# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: AlphaJack <alphajack at tuta dot io>

pkgname="odoo-nightly"
_pkgname="odoo"
pkgver=17.0
pkgrel=2
pkgdesc="Odoo. Open Source Apps To Grow Your Business."
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-only")
conflicts=("openerp" "odoo" "odoo-17")
replaces=("openerp" "odoo" "odoo-17")
depends=("postgresql"
        "wkhtmltopdf"
        "python310")
source=("https://nightly.odoo.com/$pkgver/nightly/src/${_pkgname}_$pkgver.latest.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
b2sums=('623b9a1074bfa10082c70cd28a22d378d04955859b9b76cae69b50f77717036d9e722fec1e69e04c0b1ab4c747e656a1e8a888167a84e42bdb87e2a752079f17'
        '8e9041197f9aa0dd84f55e7fd742382f52a3a2198fcf30743db5af2e50a52e2a402db3b777baa9d9f662ea51bf26296b27a3d0d9f4cbbf323f2aa7a93367a99c'
        '1ef682d87ba12dd8a185ba36701b737f8feb0c1e6eb4b23302a0dc5930ef63c990af65bc45a36313f879a29a23cbdb602e7fc34ba9cee2e46d9a3d8407d5751a'
        'd912aad674e86ed75820af252e978e0bc0bf2b8a5e956d7b33734eacff98639e5efe460a6a79ca1ffdad5a174a3a0f774cff56e2db19667e8597f9b27b3e547b'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        'f899025f7637aaed2d231de33e5c2d2a831f21f038cb86b9794f9f75224f6eb14b6c9baf95663278ae15568a80ac49354446202232f38577991a24d332373b53')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

build() {
    cd "$_pkgname-$pkgver.post"*
    python3.10 -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip build installer wheel

    # provide out-of-the-box compatibility with the merge of libldap and libldap_r that happened with OpenLDAP's 2.5 release
    sed -i 's/python-ldap==3.4.0/python-ldap==3.4.2/' requirements.txt

    pip install -r requirements.txt
    
    # Install Odoo DPD France dependency
    pip install xmltodict 

    # Build the package
    python -m build --wheel
}

package() {
    cd "$_pkgname-$pkgver.post"*
    source .venv/bin/activate

    # Install package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Copy the .venv directory
    install -d -m 750 "$pkgdir/var/lib/odoo/.venv"
    cp -r ".venv" "$pkgdir/var/lib/odoo/"

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
