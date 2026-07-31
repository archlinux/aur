# Maintainer: renagadesol <81797108+dwaycik@users.noreply.github.com>
pkgname=epomaker-rt100-git
_pkgname=epomaker-rt100
pkgver=0.2.0.r19.g60909de
pkgrel=1
pkgdesc="Control the Epomaker RT100 on Linux: screen images and GIFs, clock/CPU/temp, per-key RGB (TUI + GTK4)"
arch=('any')
url="https://github.com/dwaycik/epomaker-rt100"
license=('MIT')
depends=('python' 'python-epomakercontroller-git' 'python-pillow' 'python-psutil')
# The front ends are optional: install neither and you still get the headless
# --daemon mode. python-textual for the terminal UI, the GTK stack for the
# desktop window.
optdepends=(
  'python-textual: terminal front end (epomaker-rt100)'
  'python-gobject: desktop front end (epomaker-rt100-gtk)'
  'gtk4: desktop front end'
  'libadwaita: desktop front end'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/dwaycik/epomaker-rt100.git")
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # udev rule. Must sort before 73-seat-late.rules, which is what turns
  # TAG=="uaccess" into an ACL -- a 99- prefix is set too late and ignored.
  install -Dm644 udev/70-epomaker-rt100.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-epomaker-rt100.rules"

  # Desktop entry, with the Exec resolved to the installed command so no
  # post-install script has to rewrite it.
  sed 's|@EXEC@|/usr/bin/epomaker-rt100-gtk|' \
    desktop/epomaker-rt100-gtk.desktop.in > epomaker-rt100-gtk.desktop
  install -Dm644 epomaker-rt100-gtk.desktop \
    "${pkgdir}/usr/share/applications/epomaker-rt100-gtk.desktop"

  # systemd *user* unit: stopping and starting it needs no authorisation, so
  # the app can pause it around other operations without a polkit prompt.
  sed -e 's|@PYTHON@|/usr/bin/python|' \
      -e "s|@PYTHON@ @SCRIPT@|/usr/bin/epomaker-rt100-daemon|" \
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
