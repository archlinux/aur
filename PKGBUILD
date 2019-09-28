# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=clevis
pkgver=11
pkgrel=5
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
depends=('bash' 'jose')
makedepends=('meson'
             # Optional components, must be present during build to enable corresponding features
             'asciidoc' # man page support
             'bash-completion' # Bash completion support
             'dracut' # dracut unlocker support
             'libpwquality' 'luksmeta' # LUKS unlocker support
             'tpm2-tools' # TPM pin support
             'udisks2') # UDisks2 unlocker support
checkdepends=('tang')
optdepends=('cryptsetup: LUKS unlocker support'
            'curl: Tang pin support'
            'dracut: dracut unlocker support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'nmap: dracut unlocker support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "clevis-gh-81-dracut-fixes.patch::$url/pull/81.patch"
        "clevis-11-gh-115-ncat.patch"
        "clevis-11-gh-114-tpm2-tools-4.patch")
sha512sums=('f15033a27f662986c48ca36390d3b0f127bc691b3cd7a35d437db2e2b123f8bbebd6385d799620b11f42db0d279a2030d5bf69e55e96a584800393bf47a00368'
            'ab159ff8de8bc6ffa804cb258e53a7960fbdb016d5b63d872e0e30ac3575765a1380e932fcfb8f694a0c9563bc8ee7d72bf2618eb854b4280b8dc88e65451f40'
            'f98e700fa33c86aa7589c18a13e8c1248c1d8346dc05c17eee5b5f284f6537d514f917d417e1e9e65242657d4f586122b33fc3666c9557b1f00d2f154791b91c'
            '21298b8141dd437b7cf9dc8d095bde1f54995eb2f2fd15321b4eafef1a9c9efe95ea5f188e7d67e7c306f7f489d422a866ac7bec125e200df38631bc24502af4')

prepare() {
	cd "$pkgname-$pkgver"
	# Fix dracut module-setup.sh (GitHub PR #81)
	patch --strip=1 --input="$srcdir/clevis-gh-81-dracut-fixes.patch"
	# Replace nc by ncat (backport of GitHub PR #115)
	patch --strip=1 --input="$srcdir/clevis-11-gh-115-ncat.patch"
	# Add support for tpm2-tools 4.0 (backport of GitHub PR #114)
	patch --strip=1 --input="$srcdir/clevis-11-gh-114-tpm2-tools-4.patch"
}

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
