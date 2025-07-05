# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=1.0.3.r4.6e2182d
pkgrel=2
pkgdesc="A simple systemd service to better control Framework Laptop's fan(s)"
arch=(any)
url="https://github.com/TamtamHero/fw-fanctrl"
license=('BSD-3')
groups=()
depends=('python>=3.12' python-watchdog fw-ectool-git python-jsonschema)
makedepends=('git' 'python-setuptools>=75.2.0' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=(etc/fw-fanctrl/config.json)
options=()
install=
source=("${pkgname%-git}::git+https://github.com/TamtamHero/fw-fanctrl.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"

	cp "$srcdir/${pkgname%-git}/dist"/*.whl "$srcdir"

	# we run this install script just to have config + systemd services in place
	./install.sh \
		--dest-dir "${pkgdir}" \
		--effective-installation-dir "/usr/bin" \
		--python-prefix-dir "${pkgdir}/usr" \
		--prefix-dir "/usr" \
		--sysconf-dir "/etc" \
		--no-ectool \
		--no-pip-install \
		--no-pre-uninstall \
		--no-post-install \
		--no-sudo

	python -m installer --destdir "${pkgdir}" "$srcdir"/*.whl
	rm "$srcdir"/*.whl

	#install -Dm644 "./config.json" "${pkgdir}/etc/fw-fanctrl"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
