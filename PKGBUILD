# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=opengamepadui-git
_pkgbase=OpenGamepadUI
pkgver=0.34.0.r0.gcc70012d
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
  'libxdmcp' 'gamescope' 'vulkan-tools' 'mesa-utils' 'inputplumber'
)
optdepends=('firejail' 'bubblewrap' 'wireplumber' 'networkmanager' 'bluez' 'dbus' 'powerstation')
makedepends=('godot' 'scons' 'pkgconf' 'gcc' 'libxcursor' 'libxinerama'
  'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'make' 'unzip' 'wget' 'git'
)
provides=('opengamepadui')
conflicts=('opengamepadui-bin')
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
  cd "$srcdir/${_pkgbase}"
  make import build
}

package() {
  options=('!strip')
  cd "$srcdir/${_pkgbase}"

  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 rootfs/usr/bin/opengamepadui "${pkgdir}"/usr/bin

  mkdir -p "${pkgdir}"/usr/lib/systemd/user
  install -Dm644 rootfs/usr/lib/systemd/user/ogui-overlay-mode.service "${pkgdir}"/usr/lib/systemd/user

  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
  install -Dm444 rootfs/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg

  mkdir -p "${pkgdir}"/usr/share/opengamepadui/scripts
  install -Dm644 build/libpty.linux.template_release.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libpty.linux.template_release.x86_64.so
  install -Dm644 build/libxlib.linux.template_release.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libxlib.linux.template_release.x86_64.so
  install -Dm644 build/libunixsock.linux.template_release.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libunixsock.linux.template_release.x86_64.so
  install -Dm644 build/libdbus.linux.template_release.x86_64.so "${pkgdir}"/usr/share/opengamepadui/libdbus.linux.template_release.x86_64.so
  install -Dm644 build/liblinuxthread.linux.template_release.x86_64.so "${pkgdir}"/usr/share/opengamepadui/liblinuxthread.linux.template_release.x86_64.so
  install -Dm755 build/opengamepad-ui.x86_64 "${pkgdir}"/usr/share/opengamepadui/opengamepad-ui.x86_64
  install -Dm755 build/opengamepad-ui.pck "${pkgdir}"/usr/share/opengamepadui/opengamepad-ui.pck
  install -Dm755 rootfs/usr/share/opengamepadui/scripts/manage_input "${pkgdir}"/usr/share/opengamepadui/scripts/manage_input
  install -Dm755 rootfs/usr/share/opengamepadui/scripts/make_nice "${pkgdir}"/usr/share/opengamepadui/scripts/make_nice
  setcap 'cap_sys_nice=eip' "${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64"

  mkdir -p "${pkgdir}"/usr/share/polkit-1/actions
  install -Dm644 rootfs/usr/share/polkit-1/actions/org.shadowblip.manage_input.policy "${pkgdir}"/usr/share/polkit-1/actions/org.shadowblip.manage_input.policy
  install -Dm644 rootfs/usr/share/polkit-1/actions/org.shadowblip.setcap.policy "${pkgdir}"/usr/share/polkit-1/actions/org.shadowblip.setcap.policy
}
