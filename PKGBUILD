# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>
# Maintainer: TimWcx <timwcx at qq dot com>

pkgname=sunloginclient
_pkgname=awesun
_debname=awesun
pkgver=16.5.0.30560
pkgrel=1
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
depends=("gtk3"
         'libnotify'
         'libepoxy'
         'libappindicator-gtk3'
         'webkit2gtk-4.1'
         'util-linux-libs'
         'libcrypt.so=1-64')
license=('custom')
provides=('sunlogin'
          'awesun')
source=("runsunloginclient.service"
        'LICENSE::https://service.oray.com/question/1820.html')
source_x86_64=("https://down.oray.com/sl/linux/${_debname}-${pkgver}-x86_64.deb")
install="${pkgname}.install"
options=(emptydirs)
sha256sums=('31a15b3da81917f13eab0e34a2ea7fb50b33af20e6cebf3779f188571d459501'
            'SKIP')
sha256sums_x86_64=('eda3fffe6d5324afbc4f939f0cb85c08b7851efad3c01878621474ec7503d10f')

# upstream ships the whole app under /usr/local/awesun; we relocate it to
# /opt/awesun. the bundled binaries resolve their libraries via $ORIGIN
# (RUNPATH), so the tree is fully relocatable -- only a single standalone
# "/usr/local/awesun" string baked into three binaries needs patching, and it
# is replaced same-length to stay binary-safe.
_opt_path="/opt/${_pkgname}"
_orig_path="/usr/local/${_pkgname}"

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  cd build

  # install the whole awesun tree (bin/ lib/ data/ scripts/ + launcher)
  install -dm755 "${pkgdir}/opt"
  cp -a "usr/local/${_pkgname}" "${pkgdir}/opt/"

  # relocate the standalone prefix baked into the bundled binaries
  # (same length: /usr/local/awesun -> ///////opt/awesun, resolves to /opt/awesun)
  sed -i "s#${_orig_path}#///////${_opt_path#/}#g" \
    "${pkgdir}${_opt_path}/bin/awesun" \
    "${pkgdir}${_opt_path}/bin/awesun_daemon" \
    "${pkgdir}${_opt_path}/bin/awesun_desktop"

  # relocate paths in the helper scripts (plain text)
  sed -i "s#${_orig_path}#${_opt_path}#g" \
    "${pkgdir}${_opt_path}/scripts/"*

  # system service
  install -Dm644 "${srcdir}/run${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system/"

  # runtime log dir (matches upstream postinst)
  install -dm777 "${pkgdir}/var/log/${_pkgname}"

  # desktop entry
  install -Dm644 "usr/share/applications/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications/"
  sed -i -e "s#Exec=${_orig_path}/awesun#Exec=${_opt_path}/awesun#g" \
         -e "s#Icon=${_orig_path}/awesun.png#Icon=${pkgname}#g" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # icon
  install -Dm644 "usr/local/${_pkgname}/awesun.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # launcher symlinks
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "${_opt_path}/awesun" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "${_opt_path}/awesun" "${pkgdir}/usr/bin/${_pkgname}"

  # license
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et:
