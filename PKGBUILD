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
		"python-build"
		"python-pyqt5"
		"python-yaml" 
		"python-argcomplete"
)
optdepends=(
		"legion-fan-utils-linux-git: Systemd service that will apply a given profile
		lenovolegionlinux-dkms-git: DKMS module (install if your distro dosent patch in the kernel our you are not sure to haveit)"
)
source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  pkgver_commit=$(echo $pkgver | cut -c 6-)
  git checkout $pkgver_commit
}

build() {
	cd "${srcdir}/${_pkgname}/python/legion_linux"
	python setup.py build
	
}
package() {

	cd "${srcdir}/${_pkgname}/python/legion_linux"
	install -dDm775 legion_gui.desktop "${pkgdir}/usr/share/applications/"
	install -dDm644 legion_logo.png "${pkgdir}/usr/share/pixmaps/legion_logo.png"
	install -dDm644 legion_gui.policy "${pkgdir}/usr/share/polkit-1/actions/"
	
	cd "${srcdir}/${_pkgname}/python/legion_linux"
	python setup.py install --root="$pkgdir" --optimize=1
	mv $pkgdir/usr/bin $pkgdir/usr/local/ #move from /usr/bin to /usr/local/bin (for legion_gui.desktop to work)
}
