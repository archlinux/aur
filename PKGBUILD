# Maintainer: Matt Geskey <matt@celtra.com>
pkgname=kolide-launcher-git
pkgver=v0.11.6.r2.g0cdd690
pkgrel=1
pkgdesc="osquery command and control"
url="https://www.kolide.co/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('osquery')
makedepends=('go')
#install="kolide.install"
source=("${pkgname}::git+https://github.com/kolide/launcher.git" 
        "launcher.conf"
        "kolide-launcher.service"
)
backup=("etc/kolide/launcher.conf")
sha256sums=("SKIP"
            "84e6c43518ae8e0fb8a94a954fcb7bb56df8f14d4adb7916913d2635f1bdac9c"
            "6b0f9ec82302b7cf52e1710668f2b84ccce84d917cefa2ed32557eb1673972dc"
)

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/kolide"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/kolide/launcher"
}

build() {
	cd "${srcdir}/go/src/github.com/kolide/launcher"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	export PATH="${GOPATH}/bin:${PATH}"

	make deps
	make
}

package() {
	cd "${srcdir}/go/src/github.com/kolide/launcher"

	install -Dm755 "build/launcher" "${pkgdir}/usr/bin/kolide-launcher"
	install -Dm755 "build/osquery-extension.ext" "${pkgdir}/usr/bin/osquery-extension.ext"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/kolide/LICENSE"

	install -m755 -d "${pkgdir}/var/lib/kolide"
	install -Dm644 "${srcdir}/launcher.conf" "${pkgdir}/etc/kolide/launcher.conf"
	install -Dm644 "${srcdir}/kolide-launcher.service" "${pkgdir}/usr/lib/systemd/system/kolide-launcher.service"
}
