# Maintainer: Martin Schrodt <martin@schrodt.org>
pkgname=nvme-cli-git
pkgver=r2646.29c66608
pkgrel=1
pkgdesc='NVM-Express user space tooling for Linux'
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('util-linux' 'libsystemd')
makedepends=('systemd' 'meson' 'git')
provides=('nvme-cli')
conflicts=('nvme-cli')
source=("$pkgname::git+https://github.com/linux-nvme/nvme-cli.git")
sha256sums=('SKIP')
install=nvme-cli-git.install

pkgver() { 
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	meson setup \
	--prefix /usr \
	--libexecdir lib \
	--sbindir bin \
	--buildtype plain \
	--auto-features enabled \
	-D b_lto=true -D b_pie=true \
	-D udevrulesdir=lib/udev/rules.d \
	.build
}

package() {
	cd "${pkgname}"
	DESTDIR="$pkgdir" meson install -C .build
}

