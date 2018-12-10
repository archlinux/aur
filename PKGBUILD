# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=clevis
pkgver=11
pkgrel=1
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
depends=('bash' 'jose')
makedepends=('meson'
             # Optional components, must be present during build to enable corresponding features
             'asciidoc' # man page support
             'bash-completion' # Bash completion support
             'libpwquality' 'luksmeta' # LUKS unlocker support
             'tpm2-tools' # TPM pin support
             'udisks2') # UDisks2 unlocker support
checkdepends=('tang')
optdepends=('curl: Tang pin support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('f15033a27f662986c48ca36390d3b0f127bc691b3cd7a35d437db2e2b123f8bbebd6385d799620b11f42db0d279a2030d5bf69e55e96a584800393bf47a00368')

build() {
	cd "$pkgname-$pkgver"
	meson --prefix=/usr --libexecdir=/usr/lib --buildtype=plain build
	ninja -C build
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
