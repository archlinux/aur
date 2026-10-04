# Maintainer: Damian Nowak <spam at nowaker dot net>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgbase=whatsapp-nativefier
pkgname=(whatsapp-nativefier whatsapp-nativefier-with-remote-control)
pkgver=2.3000.1019818867
pkgrel=6
pkgdesc="WhatsApp desktop with tray, spellcheck and save-as downloads"
arch=("x86_64" "aarch64")
url="https://web.whatsapp.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs>=22" "nodejs-nativefier=52.0.0" "unzip")
_modules=(adapter approval cli client core electron-bridge electron-main
  electron-preload electron-shell mcp private requests service)
source=(
  "${pkgbase}.png"
  "${pkgbase}.desktop"
  "whatsapp-nativefier-with-remote-control"
  "whatsapp-nativefier-with-remote-control.desktop"
  "patch-nativefier.cjs"
  "${_modules[@]/#/control-}"
  "wa-js-4.6.0.tgz::https://registry.npmjs.org/@wppconnect/wa-js/-/wa-js-4.6.0.tgz"
)
for _i in "${!source[@]}"; do
  [[ ${source[_i]} == control-* ]] && source[_i]+=.cjs
done
sha256sums=(
  '3899581abcfed9b40b7208bbbca8bdbfe3ae9655980dbf55f04dec9cb3309f27'
  'bad0489ae519bc78afab3d226966691feede8bcedf58025af1b171215ae51423'
  'b2201760b0af5438bb2c5586f0f9cb2d187624c9e5e32f690aa8a0458366db8b'
  'e6dbedc1987b61d8277a2a0679a336ad24975e8dbfe01893f3b43b9980a64fc6'
  'ef75ea31c473853a7d2f5e720e706b5d5b9481bbfe7016b7b433a751432ed657'
  '865e57c6e9c22ec5ecaaff515c3d7d9a628e0d4f747c787be5510dd9ea9e055b'
  '6dfd81bb3022d31684179d263d5e58873fe012a593a64b960ca630775a2aa283'
  '7568863ebe91915263682413730003d7728b21cf0959231a1ad1ce71280b8f2d'
  '4f12ef5c578893c15df4ba5573f3e57375563d452ed123cdfa75d4a539df66e0'
  '6e7172449a27e0ea8d6bf606a57ae73cd3bc4bc5afcb5f4c0aebc27e7a047667'
  'dc0e1ab9300faf47bda45cf02440264151c934ead80071dfd21bd9c5ad993a12'
  '3126e0b1a0283fc7f856cfdf870ec8912f386f08ba766ad43e4132cdf673a039'
  '87e17077bb01abea3ace4e1d3fd1a92f494ab6b884966911e1ebe9153c090ac1'
  '38213d746a3a70da594a11d531f490109c183fbb5b770ee4ab6bbe919a8a8116'
  '9467f68be8ec6f1d8b2354bbeb2da2d2f5ca69e17062850ac23ff685cd914034'
  '75dd0a0015022f8ec3ffdfb591fda86b3a80c3b7a9a325ccd15be98dbd8270f4'
  '89e86bb24a0aaaeac55ba39e440cf0580601ff6168eba0cc40d2c83dd7a7cd16'
  '31e26c1d07dcd295279e6e6a55466727916812900cd76567283944a9ad0c8a37'
  '28f761a900db2160ec7a165c2a67b97cf6f814d8a797a5d9b6bfc06df1574df9'
)

prepare() {
  local _module
  for _module in "${_modules[@]}"; do
    install -Dm644 "control-${_module}.cjs" "control/${_module}.cjs"
  done
  install -m644 patch-nativefier.cjs patch-nativefier-build.cjs
}

build() {
  cd "${srcdir}"

  # nativefier 52.0.0 ships electron-packager 17.1.2 / extract-zip 2.0.1,
  # which silently exits mid Electron-zip extraction when invoked with
  # Node 24+ (no error message, no stack, just an incomplete src/ tree
  # that makes package() fail with "ls | grep" returning nothing).
  # Switch to Node 22 via nvm; this fork is personal so the dependency
  # on ~/.nvm is acceptable.
  if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
    # shellcheck source=/dev/null
    source "${HOME}/.nvm/nvm.sh"
    nvm use 22 || nvm install 22
  fi

  # Supported Electron 44, pinned alongside the isolated fixture. The patch
  # verifies the exact Nativefier and WA-JS assets before enabling any controls.
  nativefier \
    --name "WhatsApp" \
    --icon "${pkgbase}.png" \
    --width "800px" \
    --height "600px" \
    --electron-version "44.4.1" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.7977.78 Safari/537.36" \
    --single-instance \
    --tray \
    --show-menu-bar \
    --file-download-options '{
      "saveAs": true,
      "showProgressBar": true,
      "showBadge": true
    }' \
    "${url}"

  local _arch
  case "$CARCH" in x86_64) _arch=x64;; aarch64) _arch=arm64;; esac
  rm -rf "WhatsApp-plain-linux-${_arch}"
  cp -a "WhatsApp-linux-${_arch}" "WhatsApp-plain-linux-${_arch}"
  node patch-nativefier-build.cjs "WhatsApp-plain-linux-${_arch}/resources/app" --plain
  node patch-nativefier-build.cjs "WhatsApp-linux-${_arch}/resources/app" "package/dist/wppconnect-wa.js"
  install -Dm644 package/LICENSE "WhatsApp-linux-${_arch}/resources/app/control/vendor/LICENSE"
}

_package_app() {
  local _variant=$1 _arch _size
  case "$CARCH" in x86_64) _arch=x64;; aarch64) _arch=arm64;; esac
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  cp -rL "${srcdir}/WhatsApp${_variant}-linux-${_arch}" "${pkgdir}/opt/${pkgbase}"
  chmod 755 "${pkgdir}/opt/${pkgbase}"
  ln -s "/opt/${pkgbase}/WhatsApp" "${pkgdir}/usr/bin/${pkgbase}"
  install -Dm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in 192 128 96 64 48 32 24 22 20 16 8; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    magick "${srcdir}/${pkgbase}.png" -strip -resize "${_size}x${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgbase}.png"
  done
}

package_whatsapp-nativefier() {
  pkgdesc="WhatsApp desktop with tray, spellcheck and save-as downloads"
  conflicts=(whatsapp-nativefier-with-remote-control)
  _package_app -plain
}

package_whatsapp-nativefier-with-remote-control() {
  pkgdesc="WhatsApp desktop with authenticated local CLI/MCP remote control"
  depends=(gtk3 libxss nss 'nodejs>=22' util-linux)
  provides=("whatsapp-nativefier=${pkgver}")
  conflicts=(whatsapp-nativefier)
  _package_app ''
  install -Dm755 control/cli.cjs "${pkgdir}/opt/${pkgbase}/resources/app/control/cli.cjs"
  ln -s "/opt/${pkgbase}/resources/app/control/cli.cjs" "${pkgdir}/usr/bin/whatsapp-controls"
  install -Dm755 whatsapp-nativefier-with-remote-control "${pkgdir}/usr/bin/whatsapp-nativefier-with-remote-control"
  install -Dm644 whatsapp-nativefier-with-remote-control.desktop "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
}
