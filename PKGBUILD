# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>
_pkgname=lenovolegionlinux
pkgname=${_pkgname}-git
pkgver=r255.84de130
pkgrel=1
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
arch=("x86_64")
url="https://github.com/johnfanv2/LenovoLegionLinux"
license=('GPL')
makedepends=("git"
		"linux-headers" 
		"base-devel" 
		"lm_sensors"
		"i2c-tools" 
		"dmidecode"
		"python-build"
		"python-pyqt5"
		"python-yaml" 
		"python-argcomplete"
		"python-pip"
)
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
  pkgver_commit=$(echo $pkgver | cut -c 5-)
  git checkout $pkgver_commit
}

build() {
	cd "${srcdir}/${_pkgname}/python/legion_linux"
	make
	python3 -m pip install --upgrade build
	python -m build
}
package() {
	install -Dm644 kernel_module/*.ko "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/platform/x86"

	cd "${srcdir}/${_pkgname}/deploy/"
	install -Dm644 LenovoLegionLinux.hook $pkgdir/etc/pacman.d/hooks/LenovoLegionLinux.hook

	cd "${srcdir}/${_pkgname}/python/legion_linux"
	install -Dm775 legion_gui.desktop "${pkgdir}/usr/share/applications/"
	install -Dm644 legion_logo.png "${pkgdir}/usr/share/pixmaps/legion_logo.png"
	install -Dm644 legion_gui.policy "${pkgdir}/usr/share/polkit-1/actions/"
	
	python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps -e .
	mv $pkgdir/usr/bin $pkgdir/usr/local/ #move from /usr/bin to /usr/local/bin (for legion_gui.desktop to work)
}
