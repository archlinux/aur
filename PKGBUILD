# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Carey Minaieva <jedi2light@jedi2light.moe>

declare -Ag _arch=(
  ['i686']='linux_32'
  ['x86_64']='linux_64'
)

pkgname="cryptoplugin"
pkgver=1.2.3
pkgrel=1
pkgdesc="PrivatBank Crypto Plugin"
arch=(
  "${!_arch[@]}"
)
url="https://privatbank.ua"
license=(
  'custom:Limited Use Software License Agreement'
)
depends=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
  'pcsclite'
)
# provides=(
#   "libnp${pkgname}.so"
# )
_pkgsrc="${pkgname}-${pkgver}"
source=(
  # https://biprocessing.org.ua/IdentDigitalSignature/resources/plugin/${_pkgsrc}.deb
  # https://biprocessing.org.ua/IdentDigitalSignature/resources/plugin/${_pkgsrc}.rpm
  "https://biprocessing.org.ua/IdentDigitalSignature/resources/plugin/${_pkgsrc}.run"
)
b2sums=('cbb4a6582c0d0e8a659b27983d5b96be5540e752bcb4e4d8b8e5257fec36f3348516f20810f07a05270daff95d78a3dd4bec07f904ff887732cf6ac5cf0fcaed')

prepare() {
  cd "${srcdir}"
  # chmod +x ./"${_pkgsrc}.run"
  # ./"${_pkgsrc}.run"

  mkdir -p "${_pkgsrc}"
  sed '1,/EOFEOFEOFEOFEOFEOF/d' "${_pkgsrc}.run" | bsdtar xvzf - -C "${_pkgsrc}"

  cd "${_pkgsrc}"
  sed -i 's|PLUGIN_PATH|/usr/bin/nmcryptoplugin|' 'com.privatbank.cryptoplugin.json'

  cd "mozilla"
  sed -i 's|PLUGIN_PATH|/usr/bin/nmcryptoplugin|' 'com.privatbank.cryptoplugin.json'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # https://chromium.googlesource.com/chromium/src.git/+/62.0.3178.1/chrome/common/extensions/docs/examples/api/nativeMessaging/host/install_host.sh
  # ???
  install -vDm644 "com.privatbank.cryptoplugin.json" \
    "${pkgdir}/usr/lib/chromium/native-messaging-hosts/com.privatbank.cryptoplugin.json"

  cd "${srcdir}/${_pkgsrc}/mozilla"
  # https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#linux
  install -vDm644 "com.privatbank.cryptoplugin.json" \
    "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/com.privatbank.cryptoplugin.json"
  install -vDm644 "cryptoplugin_ext_id@privatbank.ua.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/cryptoplugin_ext_id@privatbank.ua.xpi"

  cd "${srcdir}/${_pkgsrc}/${_arch[$CARCH]}"
  install -vDm755 "nm${pkgname}" "${pkgdir}/usr/bin/nm${pkgname}"
  install -vDm644 "libnp${pkgname}.so" "${pkgdir}/usr/lib/libnp${pkgname}.so.${pkgver}"

  cd "${pkgdir}/usr/lib"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
