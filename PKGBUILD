# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=nvidia-173xx-utils
pkgver=173.14.39
pkgrel=4
pkgdesc="NVIDIA drivers utilities and libraries, 173xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('xorg-server<1.15.99' 'mesa')
optdepends=('gtk2: nvidia-settings' 'pkgconfig: nvidia-xconfig')
conflicts=('libgl')
provides=('libgl')
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-${ARCH}/${pkgver}/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run")
md5sums=('5b423543428554ef33a200fbbe3cb9fc')
[ "$CARCH" = "x86_64" ] && md5sums=('0799f194869e40141c7bac8a71762db6')

prepare() {
	cd $srcdir
	sh NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run --extract-only
}

package() {
	cd $srcdir/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/usr/

	mkdir -p $pkgdir/usr/{lib,bin,share/applications,share/pixmaps,share/man/man1}
	mkdir -p $pkgdir/usr/lib/xorg/modules/{extensions,drivers}
	mkdir -p $pkgdir/usr/share/licenses/nvidia-173xx/

	install lib/{libGLcore,libGL,libnvidia-cfg,tls/libnvidia-tls}.so.${pkgver} \
	$pkgdir/usr/lib/
	install -m644 share/man/man1/* $pkgdir/usr/share/man/man1/
	rm $pkgdir/usr/share/man/man1/nvidia-installer.1.gz
	install X11R6/lib/libXv* $pkgdir/usr/lib/
	install -m644 share/applications/nvidia-settings.desktop $pkgdir/usr/share/applications/
	# fix nvidia .desktop file
	sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i $pkgdir/usr/share/applications/nvidia-settings.desktop
	install -m644 share/pixmaps/nvidia-settings.png $pkgdir/usr/share/pixmaps/
	install X11R6/lib/modules/drivers/nvidia_drv.so $pkgdir/usr/lib/xorg/modules/drivers
	install X11R6/lib/modules/extensions/libglx.so.$pkgver $pkgdir/usr/lib/xorg/modules/extensions
	install -m755 bin/nvidia-{settings,xconfig,bug-report.sh} $pkgdir/usr/bin/
	cd $pkgdir/usr/lib/
	ln -s libGL.so.$pkgver libGL.so
	ln -s libGL.so.$pkgver libGL.so.1
	ln -s libGLcore.so.$pkgver libGLcore.so.1
	ln -s libnvidia-cfg.so.$pkgver libnvidia-cfg.so.1
	ln -s libnvidia-tls.so.$pkgver libnvidia-tls.so.1
	ln -s libXvMCNVIDIA.so.$pkgver libXvMCNVIDIA_dynamic.so.1

	cd $pkgdir/usr/lib/xorg/modules/extensions
	ln -s libglx.so.$pkgver libglx.so

	# We have to provide symlinks to mesa, as nvidia 173xx doesn't ship them
	ln -s mesa/libEGL.so.1.0.0 "${pkgdir}/usr/lib/libEGL.so.1.0.0"
	ln -s libEGL.so.1.0.0      "${pkgdir}/usr/lib/libEGL.so.1"
	ln -s libEGL.so.1.0.0      "${pkgdir}/usr/lib/libEGL.so"

	ln -s mesa/libGLESv1_CM.so.1.1.0 "${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0"
	ln -s libGLESv1_CM.so.1.1.0      "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
	ln -s libGLESv1_CM.so.1.1.0      "${pkgdir}/usr/lib/libGLESv1_CM.so"

	ln -s mesa/libGLESv2.so.2.0.0 "${pkgdir}/usr/lib/libGLESv2.so.2.0.0"
	ln -s libGLESv2.so.2.0.0      "${pkgdir}/usr/lib/libGLESv2.so.2"
	ln -s libGLESv2.so.2.0.0      "${pkgdir}/usr/lib/libGLESv2.so"

	install -m644 $srcdir/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/LICENSE $pkgdir/usr/share/licenses/nvidia-173xx/
	ln -s nvidia-173xx $pkgdir/usr/share/licenses/nvidia-173xx-utils

	install -D -m644 $srcdir/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0/usr/share/doc/README.txt $pkgdir/usr/share/doc/nvidia-173xx/README

	find $pkgdir/usr -type d -exec chmod 755 {} \;
}
