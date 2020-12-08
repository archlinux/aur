# Maintainer: Riccardo Paolo Bestetti <pbl@bestov.io>
pkgname=accio-git
pkgver=r2.a42b6ed
pkgrel=1
pkgdesc='Initrd cryptsetup hook to retrieve keys from hardware tokens'
arch=('any')
url='https://www.bestov.io/software/accio'
license=('GPL3')
groups=()
depends=('systemd' 'mkinitcpio' 'yubikey-personalization')
makedepends=('scdoc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("source::git+https://github.com/vmsh0/accio.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "source"

	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "source"

	scdoc <accio.1.scd | gzip -c >accio.1.gz
}

package() {
	cd "source"

	mkdir -p "$pkgdir/etc/cryptsetup-keys.d/"
	install -Dm644 "accio-deploy-key@.service" "$pkgdir/usr/lib/systemd/system/accio-deploy-key@.service"
	install -Dm755 "accio" "$pkgdir/usr/bin/accio"
	install -Dm644 "sd-accio" "$pkgdir/usr/lib/initcpio/install/sd-accio"
	install -Dm644 "accio.1.gz" "$pkgdir/usr/share/man/man1/accio.1.gz"
}

