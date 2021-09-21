# Maintainer: Matt Geskey <matt@celtra.com>
pkgname=kolide-launcher-git
pkgver=v0.11.22.r4.g554bd92
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
            "424544443f3165e37622b8e1f3ca4280c39d85bf46c061477891ec75a38bc5e1"
            "f8f6e60c417aff696c531ef000035feb982f76a5a0767aed5501819aa44255fb"
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
