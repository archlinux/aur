# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=ezau-git
_pkgname=ezau
pkgver=790d787
pkgrel=1
pkgdesc="EVTC Zipper And Uploader"
arch=("x86_64")
url="https://gitlab.com/dunj3/ezau"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}")
makedepends=('cargo' 'git')
depends=("openssl")
source=(
    "${_pkgname}::git+https://gitlab.com/dunj3/ezau.git#branch=master"
)
sha256sums=('SKIP')
backup=(
	"etc/ezau.toml"
)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

check() {
    cd "${_pkgname}"
    cargo test --release --locked
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/ezau" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "ezau-sample.toml" "${pkgdir}/usr/share/${_pkgname}/ezau-sample.toml"
    install -Dm 644 "ezau-sample.toml" "${pkgdir}/etc/ezau.toml"
    install -Dm 644 "ezau.service" "${pkgdir}/usr/share/${pkgname}/${_pkgname}.service"
    echo "INFO: Since arcdps.cbtlogs directory configuration is currently only possible on command line,"\
	  "please edit the /usr/share/${pkgname}/${_pkgname}.service to match the correct path and copy it to ~/.config/systemd/user/"\
	  "This behavior might change in future versions."
    # install -Dm 644 "ezau.service" "${pkgdir}/usr/lib/systemd/user/ezau.service"
}

