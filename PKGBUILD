# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Reference: https://wiki.archlinux.org/index.php?title=Go_package_guidelines#Sample_PKGBUILD

pkgname=remote-local-storage-git
_pkgname=remote-local-storage
pkgver=r8.ea930dc
pkgrel=1
pkgdesc='Simple wrapper to save and restore localStorage of webapps in server'
arch=('x86_64')
url="https://gitea.balki.me/balki/$_pkgname"
license=('MPL-2.0')
conflicts=("${_pkgname}")
makedepends=('git' 'go')
source=("git+$url.git#branch=main" "$_pkgname.service" "$_pkgname.socket")
sha256sums=('SKIP'
            '6bdfbf02c5caef218507087d32cfdedcade0e74f97e099574f3dd8b0d66dfeb6'
            '4c0a9bc570346857c0132e14eb277dd25ea97cd6d35b560e69f8c60b4bd252c1')

prepare() {
	cd "$_pkgname"
	mkdir -p build/
}

pkgver() {
	cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./
}

package() {
	cd "$_pkgname"
	install -Dm755 build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/$_pkgname.socket" -t "$pkgdir/usr/lib/systemd/system"
}
