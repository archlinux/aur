# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=gopro-vrplayer
pkgver=2.0
pkgrel=1
pkgdesc="GoPro VR Player is a 360-degree video and photo player based on VLC"
arch=('x86_64')
url="http://www.kolor.com/gopro-vr-player/"
license=('custom')
optdepends=('icu' 'qt5-base' 'vlc')
provides=('gopro-vrplayer' 'vrplayer')
install=$pkgname.install
source=("http://cdn-download.kolor.com/ked/2.0.0.400_2016-07-01/GoProVRPlayer_Linux64_200_2016-07-01.tar.xz")
md5sums=('1c7883ff07c2a7d9b0928dd7ee6cdda0')
_savedir='/usr/share/gopro-vrplayer'

build() {
  cd "${srcdir}/GoProVRPlayer"

	# wrapper
	echo "#!/bin/sh" > vrplayer
	echo "LD_LIBRARY_PATH=${_savedir}:${_savedir}/vlc/lib" >> vrplayer
	echo "export LD_LIBRARY_PATH" >> vrplayer
	echo "cd ${_savedir}" >> vrplayer
	echo "./GoProVRPlayer \$@" >> vrplayer
	chmod +x vrplayer

	# launcher
	echo "[Desktop Entry]" > gopro-vrplayer.desktop
	echo "Name=GoPro VR Player" >> gopro-vrplayer.desktop
	echo "Icon=vrplayer" >> gopro-vrplayer.desktop
	echo "Exec=gopro-vrplayer %U" >> gopro-vrplayer.desktop
	echo "Comment=Viewer for 360-degree video and photos" >> gopro-vrplayer.desktop
	echo "Type=Application" >> gopro-vrplayer.desktop
	echo "Categories=AudioVideo;Player;Video;Qt;" >> gopro-vrplayer.desktop
}

package() {
	cd "${srcdir}/GoProVRPlayer"

	mkdir -p "${pkgdir}${_savedir}"
  cp qt.conf "${pkgdir}/${_savedir}/"
  cp -r {plugins,Qt,vlc} "${pkgdir}/${_savedir}/"
  cp -r Qt{GraphicalEffects,Multimedia,Quick,Quick.2} "${pkgdir}/${_savedir}/"
  cp GoProVRPlayer{,.sh} "${pkgdir}/${_savedir}/"
	cp *.so *.so.* "${pkgdir}/${_savedir}/"

	mkdir -p "${pkgdir}/usr/bin"
	cp vrplayer "${pkgdir}/usr/bin/vrplayer"
  cp vrplayer "${pkgdir}/usr/bin/gopro-vrplayer"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp gopro-vrplayer.desktop "${pkgdir}/usr/share/applications/"
}
