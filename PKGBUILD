# Maintainer: SamWhited <sam@samwhited.com>

_name="odoo18"
pkgname="$_name-nightly"
pkgver=18.0
pkgrel=3
pkgdesc="Odoo. Open Source Apps To Grow Your Business."
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-only")
depends=("postgresql>=12.0"
    # I'm unsure how best to handle this as the earlier versions of Python on
    # the AUR do not provide "python", so we'd have to pick one specifically.
    # This should work with >=3.10<=3.12, so 3.10 or 3.11 are fine too.
    "python312"
)
# Virtualenv-tools3 currently doesn't work with Python 3.12.
# See comments in the package() function.
#makedepends=("python-virtualenv-tools3")

source=("https://nightly.odoo.com/$pkgver/nightly/src/odoo_$pkgver.latest.tar.gz"
		"odoo.conf"
		"odoo.service"
		"odoo.sysusers"
		"odoo.tmpfiles")
noextract=("odoo_$pkgver.latest.tar.gz")
sha256sums=(SKIP
		'7ac5830fec158e162c2efce1a5d3a44be6f6c6cde25ab710ad358826f1a41daa'
		'5474ae3277b32d54699d37d2832231c129c5c7d81f035583b938bcf45ad3fb08'
		'f0c775b551c096197c300df7cdc5a26d1eee4db79f7ddc53482d60de6dce3be5'
		'ac4082eb2a6daabfd28c1d86fb310285b51d5fa2a1be6b6ffacd2cdbd1bb0239')
backup=("etc/$_name/odoo.conf")
install="odoo.install"
options=("!strip")
provides=("openerp" "odoo" "odoo18")

prepare() {
	# Extract manually to avoid a folder name that includes the download date.
	rm -rf "odoo-$pkgver"
	tar -xzf "odoo_$pkgver.latest.tar.gz" --one-top-level="odoo-$pkgver" \
		--strip-components 1
}

build() {
	cd "odoo-$pkgver"
	python3.12 -m venv --clear venv
	venv/bin/pip install --upgrade pip build installer wheel
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
	install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo18.service"
	install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo18.conf"
	install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo18.conf"
}

# vim:set ts=2 sw=2 et:
