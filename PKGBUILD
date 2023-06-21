# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: johnfanv2 <https://github.com/johnfanv2>


_pkgname=lenovolegionlinux
pkgname=${_pkgname}-git
pkgver=r255.7477dc6
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
)
makedepends=(
  git
  python-build
  python-installer
)
optdepends=(
  "lenovolegionlinux-dkms-git: DKMS module"
)

conflicts=(
  "legion-fan-utils-linux-git: Systemd service that will apply a given profile" #Not needed merge in LLL
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
  mkdir -p "${pkgdir}/usr/share/{applications/,icons/,polkit-1/actions/}"
  mkdir -p "${pkgdir}/usr/{local/bin,bin/,share/legion_linux}"
  mkdir -p "${pkgdir}/etc/systemd/system"
  mkdir -p "${pkgdir}/etc/acpi/{events,actions}"

  cd "${srcdir}/${_pkgname}/python/legion_linux"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "legion_linux"
  install -Dm644 legion_logo.png "${pkgdir}/usr/share/pixmaps/legion_logo.png"

#Custom files also use in gentoo (fix root gui application and desktop file)
  mkdir -p files && cd files
  wget https://raw.githubusercontent.com/MrDuartePT/mrduarte-ebuilds/master/sys-firmware/lenovolegionlinux/files/legion_cli.policy
  wget https://raw.githubusercontent.com/MrDuartePT/mrduarte-ebuilds/master/sys-firmware/lenovolegionlinux/files/legion_gui.desktop

#Install custom files
  install -Dm644 legion_cli.policy "${pkgdir}/usr/share/polkit-1/actions/"
  install -Dm775 legion_gui.desktop "${pkgdir}/usr/share/applications/"

# Systemd service
  cd "${srcdir}/${_pkgname}/extra"
  install -Dm664 service/*.service "${pkgdir}/etc/systemd/system" 
	install -Dm664 service/*.path "${pkgdir}/etc/systemd/system"
  install -Dm664 service/profiles/* "${pkgdir}/usr/share/legion_linux/.env"
  install -Dm664 service/profiles/* "${pkgdir}/usr/share/legion_linux/"
	
# ACPI service
  install -Dm775 acpi/actions/battery-legion-quiet.sh "${pkgdir}/etc/acpi/actions/"
  install -Dm664 acpi/events/ac_adapter_legion-fancurve "${pkgdir}/etc/acpi/events/"
}
