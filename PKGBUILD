# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>
# Maintainer: TimWcx <timwcx at qq dot com>

pkgname=sunloginclient
_pkgname=awesun
_debname=awesun
pkgver=16.6.0.32198
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
source_x86_64=("https://dw.oray.com/sl/linux/${_debname}_${pkgver}_amd64.deb")
install="${pkgname}.install"
options=(!strip emptydirs)
sha256sums=('31a15b3da81917f13eab0e34a2ea7fb50b33af20e6cebf3779f188571d459501'
            'SKIP')
sha256sums_x86_64=('76d2d534413a58a8bbf5c577b5e6178e3eaf8a685304c027af02fa4e922d5639')

_opt_path="/opt/${_pkgname}"
_orig_path="/usr/local/${_pkgname}"

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build

  # awesun's webview plugin dlopen()s both the libwebkit2gtk-4.0 and 4.1
  # sonames. When webkit2gtk (the 4.0 ABI) is installed alongside
  # webkit2gtk-4.1, the 4.0 soname may be resolved first and the
  # login/register page renders blank. Redirect the 4.0 sonames to a
  # non-existent "0.0" version so the loader falls back to the 4.1 ABI we
  # depend on. Equal-length substitution keeps the ELF string table intact.
  sed -i 's/libwebkit2gtk-4\.0\.so/libwebkit2gtk-0.0.so/g' \
    "build/usr/local/${_pkgname}/lib/libwebview_linux_plugin.so"
}

package() {
  cd build

  # install the whole awesun tree (bin/ lib/ data/ scripts/ + launcher)
  install -dm755 "${pkgdir}/opt"
  cp -a "usr/local/${_pkgname}" "${pkgdir}/opt/"

  # relocate the hardcoded /usr/local/awesun prefix to /opt/awesun in every file
  local _pad_path="///////opt/${_pkgname}"
  while IFS= read -r -d '' _f; do
    sed -i "s#${_orig_path}#${_pad_path}#g" "$_f"
  done < <(grep -RslZ "${_orig_path}" "${pkgdir}${_opt_path}")
  
  # relocate paths in the helper scripts (plain text)
  sed -i "s#${_pad_path}#${_opt_path}#g" "${pkgdir}${_opt_path}/scripts/"*

  # oray config file
  install -Dm644 /dev/null "${pkgdir}/etc/orayconfig.conf"

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
