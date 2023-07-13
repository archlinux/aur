# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>


_pkgname=lenovolegionlinux
pkgname=${_pkgname}-git
pkgver=r255.f029ef9
pkgrel=1
pkgdesc="LenovoLegionLinux (LLL) brings additional drivers and tools for Lenovo Legion series laptops to Linux. PLEASE READ THE REPO BEFORE INSTALL THIS PACKAGE!!!"
arch=("x86_64")
url="https://github.com/johnfanv2/LenovoLegionLinux"
license=('GPL')

depends=(
  python-argcomplete
  python-yaml
  python-pyqt5
  polkit
  python-wheel
  curl
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
)
optdepends=(
  "lenovolegionlinux-dkms-git: DKMS module"
)

conflicts=(
  legion-fan-utils-linux-git
)

source=("${_pkgname}::git+https://github.com/johnfanv2/LenovoLegionLinux"
   'legion_cli.policy::https://raw.githubusercontent.com/MrDuartePT/mrduarte-ebuilds/master/sys-firmware/LenovoLegionLinux/files/legion_cli.policy'
   'legion_gui.desktop::https://raw.githubusercontent.com/MrDuartePT/mrduarte-ebuilds/master/sys-firmware/LenovoLegionLinux/files/legion_gui.desktop')
sha256sums=('SKIP'
            '8e0c262868b5de17ca384b200a0080b2f03e284422ab06ee408310d038c9cdf5'
            '3af20ff4678b603f98e71b1fb540553dd751509d6ea5c1158462aebe532b8189')

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
  mkdir -p ${pkgdir}/usr/share/{applications/,icons/,polkit-1/actions/}
  mkdir -p ${pkgdir}/usr/{local/bin,bin/,share/legion_linux}
  mkdir -p ${pkgdir}/etc/{systemd/system,legion_linux}
  mkdir -p ${pkgdir}/etc/acpi/{events,actions}

  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "legion_linux"
  install -Dm644 legion_logo.png "${pkgdir}/usr/share/pixmaps/legion_logo.png"

#Install custom files
  install -Dm644 "${srcdir}/legion_cli.policy" "${pkgdir}/usr/share/polkit-1/actions/"
  install -Dm775 "${srcdir}/legion_gui.desktop" "${pkgdir}/usr/share/applications/"

# Systemd service
  cd "${srcdir}/${_pkgname}/extra"
  install -Dm664 service/*.service "${pkgdir}/etc/systemd/system" 
	install -Dm664 service/*.path "${pkgdir}/etc/systemd/system"
  
  install -Dm664 service/profiles/* "${pkgdir}/usr/share/legion_linux/"
  install -Dm664 service/profiles/* "${pkgdir}/usr/share/legion_linux/"

  install -Dm664 service/profiles/* "${pkgdir}/etc/legion_linux/"
  install -Dm664 service/profiles/* "${pkgdir}/etc/legion_linux/"

  install -Dm775 service/fancurve-set "${pkgdir}/usr/bin/fancurve-set"
	
# ACPI service
  install -Dm775 acpi/actions/battery-legion-quiet.sh "${pkgdir}/etc/acpi/actions/"
  install -Dm664 acpi/events/ac_adapter_legion-fancurve "${pkgdir}/etc/acpi/events/"
}
