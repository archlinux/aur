# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=clevis-git
pkgver=11.r0.3375b08
pkgrel=1
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
depends=('bash' 'jose')
makedepends=('git' 'meson'
             # Optional components, must be present during build to enable corresponding features
             'asciidoc' # man page support
             'bash-completion' # Bash completion support
             'libpwquality' 'luksmeta' # LUKS unlocker support'
             'tpm2-tools' # TPM pin support
             'udisks2') # UDisks2 unlocker support
checkdepends=('tang')
optdepends=('curl: Tang pin support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	meson --prefix=/usr --libexecdir=/usr/lib --buildtype=plain build
	ninja -C build
}

check() {
	cd "${pkgname%-git}"
	ninja -C build test
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
