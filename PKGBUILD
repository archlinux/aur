# Maintainer:  Rock Neurotiko <rockneurotiko AT GMAIL>
pkgname=ironmime-git
_pkgname=ironmime
pkgver=0.3.0.r0.gdbc34b5
pkgrel=1
pkgdesc="IronMime is a Linux daemon to bind touchpad gestures to shell commands."
arch=('x86_64')
url="https://github.com/cyber-sushi/ironmime"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#branch=main" "ironmime.service" "ironmime.install")
sha256sums=("SKIP" "8d21f5ea62ea1224f0b9be3f47f3402f4c971ed785d5c1a1855b8bfedab86ac6" "982d14240039144fadc409592fb342b7d1e0dcf2c25c33cb0a5d7c7f7ec78905")
install=ironmime.install

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    install -Dm644 ironmime.service -t "${pkgdir}/usr/lib/systemd/system" || return 1

    cd "${pkgname}"

    install -Dm755 target/release/ironmime -t "${pkgdir}/usr/bin" || return 1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ironmime/LICENSE" || return 1
}
