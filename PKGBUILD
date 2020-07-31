# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
# Contributor: Dorian Stoll <dorian.stoll@tmsp.io>

pkgname=iptsd-git
_pkgname=iptsd
pkgver=r81.818eb92
pkgrel=1
pkgdesc='Userspace daemon for Intel Precise Touch & Stylus'
arch=('x86_64')
url="https://github.com/linux-surface/${_pkgname}"
license=('GPL2')
provides=(${_pkgname})
conflicts=(${_pkgname})
optdepends=("ipts-uapi-dkms: The kernel module required by this daemon. \
Alternatively, you can use a kernel with this module built in.")
makedepends=('go')
source=("git+${url}.git")
sha256sums=('SKIP')
install=iptsd.install

prepare() {
	cd "${_pkgname}"
	mkdir -p bin
}

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "${_pkgname}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o "bin/$pkgname" .
}

package() {
	cd "${_pkgname}"

	# Install iptsd binary
	install -Dpm 0755 "bin/$pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Install iptsd service
	install -Dpm 0644 etc/systemd/iptsd.service \
		"$pkgdir/usr/lib/systemd/system/$_pkgname.service"

	# Install udev configuration
	install -Dpm 0644 etc/udev/50-ipts.rules \
		"$pkgdir/usr/lib/udev/rules.d/50-ipts.rules"

	# Install iptsd device configs
	install -dm 0755 "$pkgdir/usr/share/ipts"
	install -Dpm 0644 config/* "$pkgdir/usr/share/ipts"
}
