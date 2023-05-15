# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>


_pkgname=lenovolegionlinux
pkgname=${_pkgname}-git
pkgver=r255.a03d860
pkgrel=1
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
arch=("x86_64")
url="https://github.com/johnfanv2/LenovoLegionLinux"
license=('GPL')

depends=(
  python-argcomplete
  python-yaml
  python-pyqt5
)
makedepends=(
  git
  python-build
  python-installer
)
optdepends=(
  "legion-fan-utils-linux-git: Systemd service that will apply a given profile"
  "lenovolegionlinux-dkms-git: DKMS module"
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
 python -m build --wheel --no-isolation
	
}
package() {
  mkdir -p $pkgdir/usr/share/{applications/,icons/,polkit-1/actions/}
  mkdir -p $pkgdir/usr/{local/bin,bin/}
  cd "${srcdir}/${_pkgname}/python/legion_linux/legion_linux"
  install -Dm775 legion_gui.desktop "${pkgdir}/usr/share/applications/"
  install -Dm644 legion_logo.png "${pkgdir}/usr/share/pixmaps/legion_logo.png"
  install -Dm644 legion_gui.policy "${pkgdir}/usr/share/polkit-1/actions/"
	
  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python -m installer --destdir="$pkgdir" dist/*.whl
  ln -s $pkgdir/usr/bin/legion_gui $pkgdir/usr/local/bin/legion_gui #fix dektop file
}
