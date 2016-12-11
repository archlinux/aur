# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=kolide-git
pkgver=r62.720f425
_pkgname=kolide
pkgrel=1
pkgdesc="osquery command and control"
url="https://www.kolide.co/"
arch=('x86_64' 'i686')
license=('Apache')
optdepends=('osquery-git' 'postgresql' 'sqlite')
makedepends=('go')
install="kolide.install"
source=('git+https://github.com/kolide/kolide.git' 'kolide.sysusers')

md5sums=('SKIP'
         '4934e838c831a12242550ae5e762a77a')

#pkgver() {
#	cd "${srcdir}/${_pkgname}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
	cd "${srcdir}"

	mkdir -p "go/src/github.com/kolide"
	ln -sf "${srcdir}/${_pkgname}" "go/src/github.com/kolide/kolide"
}

build() {
	cd "${srcdir}/go/src/github.com/kolide/kolide"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make deps
	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make
}

package() {
	cd "${srcdir}/go/src/github.com/kolide/kolide"

	install -Dm644 "${srcdir}/${_pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "shared/kolide.service" \
		"${pkgdir}/usr/lib/systemd/system/kolide.service"
	install -Dm644 "shared/kolide.toml" \
		"${pkgdir}/etc/${_pkgname}/kolide.toml"
	install -Dm644 "LICENSE" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "bin/kolide" "${pkgdir}/usr/bin/kolide"
}
