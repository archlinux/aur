# Maintainer: renagadesol <81797108+dwaycik@users.noreply.github.com>
#
# A split package: one source build, two installable packages.
#
#   epomaker-rt100-git      core + terminal front end + headless daemon
#   epomaker-rt100-gtk-git  adds the desktop front end
#
# Everything either package needs is a hard dependency, so installing either
# one gives you a working command with no follow-up steps. Optional
# dependencies were tried first and were a mistake: pacman prints them and
# moves on, so the app installed "successfully" and then failed at launch.
pkgbase=epomaker-rt100-git
pkgname=('epomaker-rt100-git' 'epomaker-rt100-gtk-git')
_srcname=epomaker-rt100
pkgver=0.2.0.r24.g4ee85a9
pkgrel=1
arch=('any')
url="https://github.com/dwaycik/epomaker-rt100"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_srcname}::git+https://github.com/dwaycik/epomaker-rt100.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"
  python -m build --wheel --no-isolation
}

package_epomaker-rt100-git() {
  pkgdesc="Control the Epomaker RT100 on Linux: screen images and GIFs, clock/CPU/temp, per-key RGB (terminal UI)"
  depends=('python' 'python-epomakercontroller-git' 'python-pillow' 'python-psutil'
           'python-textual')
  provides=("${_srcname}=${pkgver}")
  conflicts=("${_srcname}")
  install="${_srcname}.install"

  cd "${srcdir}/${_srcname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # The GTK entry point ships in the -gtk package instead, so this one does not
  # advertise a command that would fail without a desktop stack installed.
  rm -f "${pkgdir}/usr/bin/epomaker-rt100-gtk"
  rm -f "${pkgdir}/usr/lib/python"*/site-packages/epomaker_rt100_gtk.py

  # udev rule. Must sort before 73-seat-late.rules, which is what turns
  # TAG=="uaccess" into an ACL -- a 99- prefix is set too late and ignored.
  install -Dm644 udev/70-epomaker-rt100.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-epomaker-rt100.rules"

  # systemd *user* unit: stopping and starting it needs no authorisation, so
  # the app can pause it around other operations without a polkit prompt.
  sed -e 's|@PYTHON@ @SCRIPT@|/usr/bin/epomaker-rt100-daemon|' \
      -e 's|@SENSOR@|coretemp-0|' \
    systemd/epomaker-controller.service.in > epomaker-controller.service
  install -Dm644 epomaker-controller.service \
    "${pkgdir}/usr/lib/systemd/user/epomaker-controller.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/calibration/rt100-calibration.png \
    "${pkgdir}/usr/share/doc/${pkgname}/rt100-calibration.png"
  install -Dm644 docs/calibration/rt100-gif-calibration.gif \
    "${pkgdir}/usr/share/doc/${pkgname}/rt100-gif-calibration.gif"
}

package_epomaker-rt100-gtk-git() {
  pkgdesc="Control the Epomaker RT100 on Linux: screen images and GIFs, clock/CPU/temp, per-key RGB (GTK4 desktop app)"
  depends=('epomaker-rt100-git' 'python-gobject' 'gtk4' 'libadwaita')
  provides=("${_srcname}-gtk=${pkgver}")
  conflicts=("${_srcname}-gtk")

  cd "${srcdir}/${_srcname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Only the GTK bits: the rest belongs to epomaker-rt100-git, which this
  # depends on. Removing them avoids a file conflict between the two.
  find "${pkgdir}/usr/bin" -type f ! -name 'epomaker-rt100-gtk' -delete
  rm -rf "${pkgdir}/usr/lib/python"*/site-packages/epomaker_rt100
  rm -rf "${pkgdir}/usr/lib/python"*/site-packages/epomaker_rt100-*.dist-info

  sed 's|@EXEC@|/usr/bin/epomaker-rt100-gtk|' \
    desktop/epomaker-rt100-gtk.desktop.in > epomaker-rt100-gtk.desktop
  install -Dm644 epomaker-rt100-gtk.desktop \
    "${pkgdir}/usr/share/applications/epomaker-rt100-gtk.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
