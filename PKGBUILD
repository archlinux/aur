# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: SamWhited <sam@samwhited.com>

pkgname="odoo-nightly"
_pkgname="odoo"
pkgver=17.0
pkgrel=16
pkgdesc="Odoo. Open Source Apps To Grow Your Business."
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-only")
conflicts=("openerp" "odoo" "odoo-17")
replaces=("openerp" "odoo" "odoo-17")
depends=("postgresql"
         "wkhtmltopdf-static"
         "python310")
source=("https://nightly.odoo.com/$pkgver/nightly/src/${_pkgname}_$pkgver.latest.tar.gz"
        "odoo.conf"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
b2sums=('SKIP'
        'e0a384d279b7b2c09261041d630e65a2237f6ee4838cdc6d7cc839b7a0a83f7c93ff591c0a27f84d51b80a6f44c7933268a603c0318348d16795e4fa8e58b859'
        'faeecb1fa46237b65064668fe2366d6f62c1faee65db00c6d950670e4fc2c1a183ccbd463cb38985335654e83ddf5c198cc9cb73c9eaccf9ee9791f265518cac'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        '80e9a5954c3eece0be4c4f44e60d519a30e6264fd1d57a77eba46581faf71f66c4404247b71925dd0970a5b7bfb2bda99cc3c38bd663f443b258385d0f85be83')
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
  python -m installer dist/*.whl

  # Update the .venv path
  pip install virtualenv-tools3
  cd .venv
  virtualenv-tools --update-path /var/lib/odoo/.venv/

  # Copy the .venv directory
  rm -rf "bin/__pycache__"
  install -d -m 750 "$pkgdir/var/lib/odoo/.venv"
  cp -r . "$pkgdir/var/lib/odoo/.venv/"
    
  # Configuration file
  install -d -m 750 "$pkgdir/etc/odoo"
  install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"

  # Systemd files
  install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
  install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
  install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"

  # Clean build
  rm -rf "$srcdir/$_pkgname-$pkgver.post"*
}
