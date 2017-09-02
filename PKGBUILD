# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: Patrick Wozniak <email@patwoz.de>

pkgname=masterpassword-cli-git
pkgver=2.5.cli.2.r119.g060ce610
pkgrel=1
pkgdesc="CLI version of Master Password. (git-version)"

arch=('any')
url="https://github.com/Lyndir/MasterPassword"
license=('GPL3')

optdepends=(
	'xclip: copy password to clipboard'
)
makedepends=(
	'gcc'
	'git'
	'libsodium'
	'openssl'
)
conflicts=(
	'masterpassword-cli'
	'masterpassword-cli-git'
)

source=("${pkgname%-git}::git+https://github.com/Lyndir/MasterPassword.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	echo $(git describe --match '*-cli*' --long --dirty --broken) | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/;s/ //g'
}

build() {
	cd "${pkgname%-git}/platform-independent/cli-c"
	targets="mpw" ./build
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

	cd "platform-independent/cli-c"
	/usr/bin/install -Dm755 "mpw" "$pkgdir/usr/bin/mpw"
}
