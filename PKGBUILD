# Maintainer: George Anthony Nuarin <qzsong [at] proton.me>
# Contributor: Martin Schrodt <martin@schrodt.org>

pkgname=nvme-cli-git
pkgver=r7673.c93350e11
pkgrel=1
pkgdesc='NVM-Express user space tooling for Linux'
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('util-linux' 'libsystemd')
optdepends=(
    'json-c: parsing /etc/nvme/config.json; all vendor plugins; JSON output format'
)

makedepends=('systemd' 'meson' 'git' 'swig')
provides=('nvme-cli' 'libnvme' 'python-libnvme')
conflicts=('nvme-cli' 'libnvme' 'python-libnvme')
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
	--sysconfdir /etc \
	--libexecdir lib \
	--sbindir bin \
	--buildtype release \
	-D docs='man' \
	.build
}

package() {
	cd "${pkgname}"
	DESTDIR="$pkgdir" meson install -C .build
}
