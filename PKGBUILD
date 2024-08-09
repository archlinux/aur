# Maintainer: hjmjaa-aur <aur AT hjmjaa DOT com>

_pkgname=wait_ex
pkgname="$_pkgname-git"
pkgver=0.1.0.r3.g1557ace
pkgrel=1
pkgdesc="Replacement of Bash's wait with error handling"
arch=('x86_64')
url="https://git.sr.ht/~mjaa/$_pkgname"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(nim git)
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+$url")
noextract=()
md5sums=(SKIP) # updpkgsums

pkgver() {
	cd "$_pkgname"
	git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

build() {
	cd "$_pkgname"
	# The options ensure private and total memory usage is as low as
	# possible. Private usage is 340 kB. Resident set size is 1.0 MB.
	# Private usage is calculated using following (with wait_ex running):
	# `ps -eo size,command | sort -n -k 1,1 | cut -c1-80 | grep wait_ex`
	# `-d:useMalloc` ensures that Nim doesn't preallocate a big heap, thus
	# reducing private usage by about 500 kB.
	nimble -o:wait_ex -d:danger --opt:size --threads:off --mm:arc \
		--passC:-flto --passL:-flto -d:useMalloc build
}

package() {
	cd "$_pkgname"
	install -Dm 755 wait_ex -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
}
