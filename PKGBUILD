# Maintainer: fossdd <fossdd@pwned.life>
pkgname=simplytranslate-git
_pkgname="${pkgname%-git}"
pkgver=r53.fb21898
pkgrel=1
pkgdesc='A privacy friendly frontend for multiple Translation Websites.'
arch=('x86_64')
url='https://codeberg.org/ManeraKai/simplytranslate'
_giturl="$url.git"
license=('GPL3')
groups=()
depends=()
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=(etc/simplytranslate.conf)
options=()
install=
source=(
	"$_pkgname::git+$_giturl"
	"$_pkgname.service"
	"$_pkgname.conf"
	"$_pkgname.sysusers"
)
noextract=()
md5sums=('SKIP'
         'e34b69542d984664eca6805a2edd91ca'
         '8e4a00c7a99ea46814ef53d1740a7546'
         '63e31e91d5e720d740e29f88e3668185')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname/web"
	go mod tidy
	go mod download
}

build() {
	cd "$srcdir/$_pkgname/web"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o $_pkgname
}

package() {
	cd "$srcdir/$_pkgname"

	# binary
	install -Dm0755 "web/$_pkgname" -t "$pkgdir/usr/bin/"

	# web frontend
	install -vd "$pkgdir/usr/lib/$_pkgname/static"
	install -vd "$pkgdir/usr/lib/$_pkgname/views"
	cp -vr web/static/* "$pkgdir/usr/lib/$_pkgname/static"
	cp -vr web/views/* "$pkgdir/usr/lib/$_pkgname/views"

	# systemd integration
	install -Dm0644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm6044 "$srcdir/$_pkgname.conf" -t "$pkgdir/etc/"
	install -Dm0644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

	# other
	install -Dm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm0644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
}
