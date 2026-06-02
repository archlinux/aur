# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>
# Maintainer: ExplodingDragon <explodingfkl at gmail dot com>

pkgname=awesun
pkgver=16.5.0.30560
pkgrel=1
pkgdesc="Proprietary remote control software for mobile devices, Windows, Mac, Linux and other systems. (GUI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"
         "gtk3"
         "webkit2gtk-4.1"
         "libnotify"
         "util-linux-libs"
         "libepoxy"
         "xorg-xhost"
         "libcrypt.so=1-64")
makedepends=("patchelf")
license=("custom")
provides=("sunlogin" "sunloginclient")
conflicts=("sunloginclient")
backup=("etc/orayconfig.conf")
source=("LICENSE::https://service.oray.com/question/1820.html")
source_x86_64=("https://dl.oray.com/sl/linux/${pkgname}-${pkgver}-x86_64.deb")
install="${pkgname}.install"
options=(emptydirs !debug !strip)
sha256sums=("SKIP")
sha256sums_x86_64=("eda3fffe6d5324afbc4f939f0cb85c08b7851efad3c01878621474ec7503d10f")

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  cd "${srcdir}/build"

  install -dm755 "${pkgdir}/opt"
  cp -dpr --no-preserve=ownership "usr/local/${pkgname}" \
    "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/local"
  ln -s "/opt/${pkgname}" "${pkgdir}/usr/local/${pkgname}"

  while IFS= read -r lib; do
    patchelf --set-rpath '$ORIGIN' "$lib"
  done < <(find "${pkgdir}/opt/${pkgname}/lib" -maxdepth 1 -type f -name '*.so' ! -name 'libflutter_linux_gtk.so' | sort)

  patchelf --set-rpath '$ORIGIN' \
    "${pkgdir}/opt/${pkgname}/lib/libsl_dart_core_plugin.so"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/awesun" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "usr/local/${pkgname}/awesun.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 "usr/share/applications/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i \
    -e "s#^Exec=.*#Exec=/usr/bin/${pkgname}#" \
    -e "s#^Icon=.*#Icon=${pkgname}#" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "usr/local/${pkgname}/scripts/runawesun.service" \
    "${pkgdir}/usr/lib/systemd/system/run${pkgname}.service"
  sed -i \
    -e "s#/usr/local/${pkgname}#/opt/${pkgname}#g" \
    "${pkgdir}/usr/lib/systemd/system/run${pkgname}.service"

  install -dm755 "${pkgdir}/etc"
  : > "${pkgdir}/etc/orayconfig.conf"
  chmod 644 "${pkgdir}/etc/orayconfig.conf"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et:
