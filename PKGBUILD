# Maintainer: Steve Le Roy Harris <steve@nourish.je>
pkgname=vrui-git
pkgver=3.1_003
pkgrel=1
pkgdesc="Vrui VR Toolkit"
arch=('i686' 'x86_64')
url="http://idav.ucdavis.edu/~okreylos/ResDev/Vrui/"
license=('GPL')
depends=('xorg-server' 'libgl')
makedepends=('git')
optdepends=('openal: render three-dimensional sound'
	'libpng: read/write png images'
	'libjpeg: read/write jpg images'
	'libtiff: read/write tiff images'
	'libtheora: read/write video'
	'alsa-lib: sound support'
	'bluez-libs: Wiimote support'
	'libdc1394: firewire device support'
	'speex: speech support'
	)
backup=("etc/Vrui/3DTV.cfg"
	"etc/Vrui/OculusRift.cfg"
	"etc/Vrui/RazerHydra.cfg"
	"etc/Vrui/SpaceBall4000FLX.cfg"
	"etc/Vrui/SpaceNavigator.cfg"
	"etc/Vrui/SpaceTraveler.cfg"
	"etc/Vrui/VRDevices.cfg"
	"etc/Vrui/Vrui.cfg"
	"etc/Vrui/WingmanExtreme3DPro.cfg")
install=vrui-git.install
source=("git+https://github.com/KeckCAVES/Vrui.git")
md5sums=("SKIP")

pkgver() {
	cd "Vrui"
	git describe | sed 's/^v//;s/-/_/g'
}

build() {
	cd "Vrui"
	make -j INSTALLDIR= SYSTEMINSTALL=1 LIBEXT=lib VRUI_NAME=Vrui USE_RPATH=0
}

package() {
	cd "Vrui"
	make INSTALLDIR="$pkgdir" SYSTEMINSTALL=1 LIBEXT=lib VRUI_NAME=Vrui USE_RPATH=0 install

	install -d "$pkgdir/usr/lib/systemd/system"
	echo "[Unit]
Description=Vrui VR Device daemon

[Service]
ExecStart=/usr/bin/VRDeviceDaemon

[Install]
WantedBy=multi-user.target" > "$pkgdir/usr/lib/systemd/system/vrdevicedaemon.service"

	install -d "$pkgdir/etc/ld.so.conf.d"
	echo "/usr/lib/Vrui" > "$pkgdir/etc/ld.so.conf.d/vrui.conf"
}
