# Maintainer: MrDuartePT <gonegrier.duarte@gmail.com>
# Maintainer: Petingoso <https://github.com/Petingoso>
_pkgname=legion-fan-utils-linux
pkgname=${_pkgname}-git
pkgver=r52.d2b4ef8
pkgrel=1
pkgdesc="Systemd service that will apply a given profile (read the systemd section in the repo). Needs LenovoLegionLinux to work"
arch=("x86_64")
url="https://github.com/Petingoso/legion-fan-utils-linux"
license=('GPL')
depends=(
		"python-psutil"
		"python-argparse-shim"  # Arch bug report "https://bugs.archlinux.org/task/78484"
		"lenovolegionlinux-git"
		"acpid"
)
makedepends=(
		"git" 
		"python"
)
options=(!makeflags !buildflags !strip)
changelog=
source=("${_pkgname}::git+https://github.com/Petingoso/legion-fan-utils-linux.git")
sha256sums=('SKIP')
install='legion-fan-utils-linux.install'

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  pkgver_commit=$(echo $pkgver | cut -c 5-)
  git checkout $pkgver_commit
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/etc/lenovo-fan-control/profiles"
	mkdir -p "${pkgdir}/etc/systemd/system"
	mkdir -p "${pkgdir}/etc/acpi/events"
	install -Dm664 service/profiles/* -t "${pkgdir}/etc/lenovo-fan-control/profiles"
	install -Dm755 service/fancurve-set.sh -t "${pkgdir}/etc/lenovo-fan-control"
	install -Dm775 service/lenovo-legion-fan-service.py "${pkgdir}/usr/local/bin/"
	install -Dm775 profile_man.py "${pkgdir}/etc/lenovo-fan-control/lenovo-legion-manager.py"
	install -Dm664 service/*.service "${pkgdir}/etc/systemd/system"
	install -Dm664 service/*.path "${pkgdir}/etc/systemd/system"
	install -Dm775 /service/ac_adapter_legion-fancurve "${pkgdir}/etc/acpi/events"
}
