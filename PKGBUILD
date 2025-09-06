# Contributor: Mohamed Tarek <Mokhamed_tarek At mail Dot ru>
# Contributer: knedl1k <knedl1k At tuta Dot io>

pkgname=coppeliasim-bin
pkgver=4.10.0.rev0
pkgrel=1
pkgdesc="Robotic Simulation software from Coppelia Robotics"
arch=("x86_64")
url="http://www.coppeliarobotics.com/"
license=("GPL" "LGPL")
makedepends=(binutils patchelf)
optdepends=(
qt5-{3d,connectivity,declarative,graphicaleffects,imageformats,location,multimedia,remoteobjects,scxml,sensors,serialport,svg}
qt5-{quick3d,quickcontrols,quickcontrols2,webchannel,webengine,websockets,xmlpatterns}
qt5-wayland libQt5Gamepad.so libdeclarative_gamepad.so libdeclarative_webview.so
)
conflicts=($_name)
options=(!strip)
provides=($_name)
source=("$pkgver.tar.xz::${url}/files/V${pkgver//./_}/CoppeliaSim_Edu_V${pkgver//./_}_Ubuntu24_04.tar.xz")
sha256sums=('fb62947c3ca7015e7f526830aeac04a1e7914027368ad2230a64190f97f68bba')
noextract=(${pkgver}.tar.xz)

package() {
  depends=(qt5-base ffmpeg4.4 openssl zeromq)
  install -d "${pkgdir}"/{opt/${pkgname%-bin},usr/{bin,share/doc}}
  # save BUILDDIR size. --no-same-permissions ?
  tar --strip-components=1 -xf ${pkgver}.tar.xz -C "${pkgdir}"/opt/${pkgname%-bin} \
    --exclude '*/libQt5*' --exclude '*/imageformats' --exclude '*/platform*' --exclude '*/xcbglintegrations' \
    --exclude '*/sensors' --exclude '*/qml/Qt*' \
    --exclude '*/libssl.so*' --exclude '*/libcrypto.so*' --exclude '*/libzmq.so*' \
    --exclude '*/libicu*.so*' --exclude '*/libav*.so*' --exclude '*/libsw*/so.*'

  ln -sf "/opt/${pkgname%-bin}/coppeliaSim.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  cd "${pkgdir}"/opt/${pkgname%-bin}
  mv manual "${pkgdir}"/usr/share/doc/${pkgname%-bin}
  #Remove Qt5 symbol ver
  for b in coppeliaSim libcoppeliaSim.so libsim*.so
    do patchelf $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
  done
}
