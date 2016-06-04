# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>

pkgbase=hybris-ready
pkgname=('hybris-ready' 'hybris-ready-bootanim' 'hybris-ready-qt5-qpa-meta' 'hybris-ready-plasma-support-meta')
pkgver=0.1
pkgrel=1
arch=('armv7h')
url="https://github.com/mickybart/"
license=('')
makedepends=()
source=('hybris-ready.install'
	'gls-common::git+https://github.com/mickybart/gnulinux_support-common'
	'bootanim::git+https://github.com/mickybart/hybris-ready-bootanim')
md5sums=('9c7d863fd54b8651fb016b40a11173fb'
	 'SKIP'
         'SKIP')

build() {
  cd ${srcdir}

}

package_hybris-ready() {
  pkgdesc="hybris ready permit to fully support GNU/Linux and Android Hardware"
  depends=('hybris-device' 'hybris-usb'
	   'libhybris' 'libgl' 'libwayland-egl'
	   'inotify-tools')
  optdepends=('hybris-ready-bootanim: required to display a pretty boot animation')
  install='hybris-ready.install'

  cd ${srcdir}

  # services for hybris-ready
  install -d ${pkgdir}/usr/bin
  install -m 755 gls-common/init/android-init ${pkgdir}/usr/bin/

  install -d ${pkgdir}/usr/lib/systemd/system/
  install -m 644 gls-common/systemd/units/hybris-ready.service ${pkgdir}/usr/lib/systemd/system/
  install -m 644 gls-common/systemd/units/hybris-ready-completed.service ${pkgdir}/usr/lib/systemd/system/

  # special services and target for Android Hw
  install -m 644 gls-common/systemd/units/hybris-reboot-bootloader.service ${pkgdir}/usr/lib/systemd/system/
  install -m 644 gls-common/systemd/units/hybris-reboot-recovery.service ${pkgdir}/usr/lib/systemd/system/
  install -m 644 gls-common/systemd/units/bootloader.target ${pkgdir}/usr/lib/systemd/system/
  install -m 644 gls-common/systemd/units/recovery.target ${pkgdir}/usr/lib/systemd/system/

}

package_hybris-ready-bootanim() {
  pkgdesc="Boot animation for hybris system"
  depends=('hybris-ready'
	   'hybris-ready-qt5-qpa-meta'
	   'qt5-declarative' 'qt5-svg')

  cd ${srcdir}

  # share
  install -d ${pkgdir}/usr/share/hybris-ready-bootanim/
  cp -r ${srcdir}/bootanim/bootanim/* ${pkgdir}/usr/share/hybris-ready-bootanim/
  ln -s archlinux.qml ${pkgdir}/usr/share/hybris-ready-bootanim/active.qml

  # Boot Animation service
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -m 644 ${srcdir}/bootanim/systemd/hybris-ready-bootanim.service ${pkgdir}/usr/lib/systemd/system/

}

package_hybris-ready-qt5-qpa-meta() {
  pkgdesc="Qt QPA Platform for hybris"
  depends=('hybris-ready'
	   'qt5-qpa-hwcomposer-plugin' 'qt5-qpa-surfaceflinger-plugin')

}

package_hybris-ready-plasma-support-meta() {
  pkgdesc="plasma support for hybris system"
  depends=('hybris-ready' 'qt5-wayland-compositor' 'kwin-hybris')

}

