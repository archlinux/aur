# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>
_pkgname=lenovolegionlinux
pkgname=${_pkgname}-git
pkgver=r01.395feaa
pkgrel=1
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. It is the alternative to Lenovo Vantage or Legion Zone (both Windows only). PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
arch=("x86_64")
url="https://github.com/johnfanv2/LenovoLegionLinux"
license=('GPL')
makedepends=("git"
		"linux-headers" 
		"base-devel" 
		"i2c-tools" 
		"dmidecode" 
		"python-pyqt5"
		"python-yaml" 
		"python-argcomplete"
		"python-pip"
)
optdepends=(
		"legion-fan-utils-linux-git: Systemd service that will apply a given profile"
)
options=(!makeflags !buildflags !strip)
changelog=
source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux")
sha256sums=('SKIP')
install="lenovolegionlinux.install"

prepare() {
  cd "$_pkgname"
  pkgver_commit=$(echo $pkgver | cut -c 5-)
  git checkout $pkgver_commit
}

build() {
	cd "${srcdir}/${_pkgname}/kernel_module"
	make
	cd "${srcdir}/${_pkgname}/python/legion_linux"
	python -m build
}
package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p $pkgdir/usr/{local,lib/modules/$(uname -r)/kernel/drivers/platform/x86/}
	mkdir -p $pkgdir/usr/share/{applications/,icons/,polkit-1/actions/}

	install -Dm644 kernel_module/*.ko "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/platform/x86"

	cd "${srcdir}/${_pkgname}/python/legion_linux"
	install -Dm775 legion_gui.desktop "${pkgdir}/usr/share/applications/"
	install -Dm775 legion_logo.png "${pkgdir}/usr/share/icons/legion_logo.png"
	install -Dm775 legion_gui.policy "${pkgdir}/usr/share/polkit-1/actions/"
	
	python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps -e .
	mv $pkgdir/usr/bin $pkgdir/usr/local/ #move from /usr/bin to /usr/local/bin (for legion_gui.desktop to work)
}
