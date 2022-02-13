# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=keymash-dkms-git
pkgver=r3.cb152fd
pkgrel=1
pkgdesc='Device driver that provides an endless supply of lowercase characters from the QWERTY home row in a cryptographically secure random order.'
arch=('x86_64')
url="https://git.bsd.gay/fef/keymash"
license=('BSD' 'GPL2')
depends=('dkms')
provides=('keymash-module' 'keymash-dkms')
conflicts=('keymash-module' 'keymash-dkms')
source=("git+https://git.bsd.gay/fef/keymash.git")
sha256sums=('SKIP')

pkgver() {
	cd "keymash"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
	install -D -m0644 keymash/{Makefile,dkms.conf} -t "${pkgdir}/usr/src/keymash-${pkgver}"
	install -d -m0644 "${pkgdir}/usr/src/keymash-${pkgver}/src"
	find keymash/src -type f -exec install -Dm755 "{}" "${pkgdir}/usr/src/keymash-${pkgver}/src" \;
	echo keymash | install -D -m0644 /dev/stdin "${pkgdir}"/usr/lib/modules-load.d/keymash.conf
	install -d -m0644 "${pkgdir}/usr/share/licenses/${pkgname}"
	sed -n '/This is licensed/,/,/p' "${srcdir}/keymash/README.md" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
