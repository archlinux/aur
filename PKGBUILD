pkgname=cchat-gtk-git
_pkgname=cchat-gtk
pkgver=r123.776b58b
pkgrel=1
pkgdesc='Gtk frontend for cchat.'
arch=('any')
url='https://github.com/diamondburned/cchat-gtk'
license=('GPL3')
depends=('gtk3' 'libhandy0' 'gspell')
optdepends=('discordlogin-git: Discord login support')
provides=('cchat')
conflicts=('cchat')
# Maintainer: Nicholas George <vencorr@zoho.com>
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/cchat-gtk'
	'cchat-gtk.desktop')
sha256sums=('SKIP'
	'429790014af6dc2575dbcaf100008f9abdaf366553cc8665730e4c521018799f')

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
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

	# check if user has already set their GoLang path
	if [[ -z "${GOPATH}" ]]; then
		export GOPATH="${srcdir}/go"
	fi
	cd "$_pkgname"
	go build -trimpath
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 icons/cchat_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/cchat-gtk.png"
}

