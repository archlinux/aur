pkgname=gtkcord3-git
_pkgname=gtkcord3
pkgver=r245.1897d38
pkgrel=1
pkgdesc='Discord client written in go and gtk3'
arch=('any')
url='https://github.com/diamondburned/gtkcord3'
license=('GPL3')
depends=('gtk3' 'discordlogin-git' 'libhandy')
provides=('gtkcord3')
conflicts=('gtkcord3-git')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/gtkcord3'
	'gtkcord3.desktop')
sha256sums=('SKIP'
	'8839b86e0a4174d5b5f3f7aa1248ee6af26901e4b5d4e749088444e1861982a4')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# add config flags as per https://wiki.archlinux.org/index.php/Go_package_guidelines
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	# check if user has already set their GoLang path
	if [[ -z "${GOPATH}" ]]; then
		export GOPATH="${srcdir}/go"
	fi
	cd "$_pkgname"
	go build -trimpath
}

check() {
	cd "$_pkgname"
	go test
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gtkcord.png"
}

