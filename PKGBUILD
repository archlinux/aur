# Maintainer: SamWhited <sam@samwhited.com>

_name="odoo19"
pkgname="$_name-nightly"
pkgver=19.0
pkgrel=1
pkgdesc="Odoo. Open Source Apps To Grow Your Business."
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-only")
depends=(
  "libldap"
  "libsasl"
  "postgresql>=13.0"
  "postgresql-libs"
  "python312"
)
optdepends=(
  "wkhtmltopdf: generate PDF invoices and receipts"
)
# Virtualenv-tools3 currently doesn't work with Python >3.12.
# See comments in the package() function.
#makedepends=("python-virtualenv-tools3")

source=("https://nightly.odoo.com/$pkgver/nightly/src/odoo_$pkgver.latest.tar.gz"
		"odoo.conf"
		"odoo.service"
		"odoo.sysusers"
		"odoo.tmpfiles")
noextract=("odoo_$pkgver.latest.tar.gz")
sha256sums=('SKIP'
            '3629d309c87dd914d5d27cfcf4f350dfd726ddb65c71e50d7111db6ac2b5638d'
            '93232237a2f69b45e1434908679f59d37d830db10736dfed24158f7ffb859962'
            '1725f4f4a47f80dd65dfd2fe59295d424eb9b927d7d88e41df0be6052b89720e'
            '6d152800ff5416d535d6b1cda438315cc434d8d178a28aae82c0bb2a1e8bc55c')
backup=("etc/$_name/odoo.conf")
install="odoo.install"
options=("!strip")
provides=("openerp" "odoo" "odoo19")

prepare() {
	# Extract manually to avoid a folder name that includes the download date.
	rm -rf "odoo-$pkgver"
	tar -xzf "odoo_$pkgver.latest.tar.gz" --one-top-level="odoo-$pkgver" \
		--strip-components 1
}

build() {
	cd "odoo-$pkgver"
	python3.12 -m venv --clear --upgrade-deps venv
	venv/bin/pip install --upgrade pip build installer wheel setuptools
	venv/bin/pip install -r requirements.txt

	venv/bin/python3.12 -m build --no-isolation --wheel
}

package() {
	cd "odoo-$pkgver"

  # Install package
	venv/bin/python3.12 -m installer dist/*.whl

	# Relocate and copy the venv
	# Right now virtualenv-tools is not compatible with Python 3.12.
	# Temporarily just rename paths and assume that's good enough for our purposes
	# where we're not likely to have to deal with lots of different versions of
	# virtualenv. If you are using a version of Python other than the system
	# version, this may fail until we can get virtualenv-tools updated.
  rm -rf "venv/bin/__pycache__"
	find venv -type f -name '*.pyc' -delete
	rm -rf 'venv/local'
	find ./venv -type f -exec sed -i "s,$srcdir/odoo-$pkgver/venv,/var/lib/$_name/venv,g" {} \;
	# virtualenv-tools --update-path "/var/lib/$_name/venv/" venv
	install -d -m 750 "$pkgdir/var/lib/$_name/venv"
	cp -r ./venv/* "$pkgdir/var/lib/$_name/venv/"

	# Configuration file
	install -d -m 750 "$pkgdir/etc/$_name"
	install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/$_name/odoo.conf"

	# Systemd files
	install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo19.service"
	install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo19.conf"
	install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo19.conf"
}

# vim:set ts=2 sw=2 et:
