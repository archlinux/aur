# Maintainer: K. Hampf <khampf@users.sourceforge.net>
# Original maintainer: Lukas Sabota <lukas@lwsabota.com>

pkgbase="g13"
pkgname="g13-git"
pkgver=v1.0.1.r0.ge6ad66c
pkgrel=1
pkgdesc="Userspace driver for the Logitech G13 Keyboard"
arch=('x86_64' 'i686')
url="https://github.com/khampf/g13"
license=('unknown')
makedepends=('git')
source=("${pkgname}::git://github.com/khampf/g13" "g13.tmpfiles" "g13.service")
install="g13.install"
sha256sums=('SKIP'
            'f96966012da236b2f6fd142fbad3a19524a9c7bf7eea43efdc684a07414a3589'
            'c359fdd80ac37cbbfb0cfdcb071212e9a5390a98dff72a9d9e688d1d3df1c932')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout develop
  msg "Modifying udev 91-g13.rules ..."
  sed -r -i -e 's/MODE="0666"/MODE="0660", OWNER="g13", GROUP="g13"\n/' 91-g13.rules
  echo '
# Unncomment below (and reboot) on errors on uinput or keys not generating keypresses after binding
#KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess", GROUP="wheel"

# Uncomment the following to start g13d as a systemd service when G13 is plugged in
#ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c21c", RUN+="/usr/bin/systemctl start g13.service"
#ACTION=="remove", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c21c", RUN+="/usr/bin/systemctl stop g13.service"
' >> 91-g13.rules
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # binaries
  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 g13d "${pkgdir}"/usr/bin
  install -m 755 pbm2lpbm "${pkgdir}/usr/bin"

  # configuration (location of default.bind)
  install -dm 755 "{pkgdir}"/etc/g13

  # docs
  install -dm 755 "${pkgdir}"/usr/share/doc/${pkgname}
  install -m 644 README.md g13.png g13.svg "${pkgdir}"/usr/share/doc/${pkgname}
  install -dm 755 "${pkgdir}"/usr/share/doc/${pkgname}/examples
  install -m 644 clock.sh *.lpbm *.bind "${pkgdir}"/usr/share/doc/${pkgname}/examples

  # systemd and udev stuff
  install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d,udev/rules.d}
  install -m 644 91-g13.rules "${pkgdir}"/usr/lib/udev/rules.d/91-g13.rules
  install -m 644 ../g13.service "${pkgdir}"/usr/lib/systemd/system/g13.service
  install -m 644 ../g13.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/g13.conf
} 

# vim: set ts=2 sw=2 et:
