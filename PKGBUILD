# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=clevis-git
pkgver=11.r7.95880c6
pkgrel=3
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
depends=('bash' 'jose')
makedepends=('git' 'meson'
             # Optional components, must be present during build to enable corresponding features
             'asciidoc' # man page support
             'bash-completion' # Bash completion support
             'dracut' # Dracut unlocker support
             'libpwquality' 'luksmeta' # LUKS unlocker support'
             'tpm2-tools' # TPM pin support
             'udisks2') # UDisks2 unlocker support
checkdepends=('tang')
optdepends=('curl: Tang pin support'
            'dracut: Dracut unlocker support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'nmap: Dracut unlocker support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        "clevis-gh-115-ncat.patch::$url/pull/115.patch")
sha512sums=('SKIP'
            '4427457f138b8c45aff4d1b0957418b2eeace0d2bcacdf721a9551b499d8340c580aac3ba14c73280da6620108d73b26e8599c227f38266b15ce650b5cb0f6ee')

prepare() {
	cd "${pkgname%-git}"
	# Replace nc by ncat (GitHub PR #115)
	patch --strip=1 --input="$srcdir/clevis-gh-115-ncat.patch"
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
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
