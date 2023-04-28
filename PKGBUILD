# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>
_pkgname=lenovolegionlinux-dkms
pkgname=${_pkgname}-git
pkgver=r255.84de130
pkgrel=1
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
arch=("x86_64")
url="https://github.com/johnfanv2/LenovoLegionLinux"
license=('GPL')
makedepends=("git"
		"dkms"
		"lm_sensors"
		"i2c-tools" 
		"dmidecode"
)
depends=(lenovolegionlinux-git)
optdepends=(
		"legion-fan-utils-linux-git: Systemd service that will apply a given profile"
)
source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux")
sha256sums=('SKIP')
install="lenovolegionlinux.install"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  pkgver_commit=$(echo $pkgver | cut -c 6-)
  git checkout $pkgver_commit
}

build() {
	cd "${srcdir}/${_pkgname}/python/legion_linux"
	python setup.py build
}
package() {
	cd "${srcdir}/${_pkgname}/kernel_module/"
	cp -r {issue-warning.sh,legion-laptop-unused-snippets.c,legion-laptop.c,Makefile} ${pkgdir}/usr/src/$_pkgname-1.0.0/
	install -Dm644 dkms.conf ${pkgdir}/usr/src/$_pkgname-1.0.0/dkms.conf

	cd "${srcdir}/${_pkgname}/deploy/"
	install -Dm644 LenovoLegionLinux.hook ${pkgdir}/etc/pacman.d/hooks/LenovoLegionLinux.hook

	mv ${pkgdir}/usr/bin ${pkgdir}/usr/local/ #move from /usr/bin to /usr/local/bin (for legion_gui.desktop to work)
}
