# Maintainer: Niko <archpkgs@niko.lgbt>

_basename=iocaine
pkgname="${_basename}-nginx"
pkgver=3.5.0
pkgrel=1
pkgdesc='The deadliest poison known to AI (with Unix socket optimized for nginx)'
arch=('x86_64' 'i686' 'armv7' 'aarch64')
url='https://iocaine.madhouse-project.org/'
license=('MIT')
makedepends=('rust' 'git' 'nftables' 'clang')
depends=('nginx')
optdepends=('ai-robots-txt: automatically updated ai.robots.txt')
# not supported for entire directories, let's leave this to sub-packages
#backup=('etc/iocaine/iocaine.toml')

conflicts=("${_basename}" "${_basename}-git")
provides=("${_basename}")

options=('!lto')

install='iocaine.install'
source=(
	"${_basename}::git+https://git.madhouse-project.org/iocaine/iocaine.git#tag=iocaine-${pkgver}"
	"iocaine.socket"
	"0001-ai-robots-txt-read-only.patch"
)
sha256sums=('6560d53c573a4e8a16a03a27ae78145bea84a4fbc909a149b4498c4357308826'
            'c141614c910f066797c4f55aa380f1d069489924cf608fe55797a48fbf2a3a04'
            '13470e7e6549b3a133f66a5005a23771af5fca08248a84d876a39172d1b555fe')

prepare() {
	cd "${_basename}"
	patch -p1 -i "../0001-ai-robots-txt-read-only.patch"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
        cd "${_basename}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
        cargo build --frozen --release
}

package() {
        cd "${_basename}"
        # Binary
        install -Dm755 "target/release/iocaine" "${pkgdir}/usr/bin/iocaine"

        # Systemd/Arch integration
        install -Dm644 "iocaine-powder/embeds/iocaine.service" "${pkgdir}/usr/lib/systemd/system/iocaine.service"
	install -Dm644 "../iocaine.socket" "${pkgdir}/usr/lib/systemd/system/iocaine.socket"
}
