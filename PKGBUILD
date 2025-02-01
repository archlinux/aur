# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=fw-fanctrl-git
pkgver=r65.c5a7cfc
pkgrel=1
pkgdesc="A simple systemd service to better control Framework Laptop's fan"
arch=(any)
url="https://github.com/TamtamHero/fw-fanctrl"
license=('BSD-3')
groups=()
depends=(python-watchdog fw-ectool-git)
makedepends=('git')
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

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	./install.sh \
		--dest-dir "${pkgdir}" \
		--prefix-dir "/usr" \
		--sysconf-dir "/etc" \
		--no-ectool \
		--no-pre-uninstall \
		--no-post-install \
		--no-pip-install

	python -m pip install --prefix="${pkgdir}/usr" dist/*.tar.gz

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
