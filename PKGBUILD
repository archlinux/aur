# Maintainer: tatsumoto <tatsu at autistici.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Steef Hegeman <mail@steefhegeman.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Julian Schacher <jspp@posteo.net>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: teutat3s <teutates@mailbox.org>
# Contributor: jaltek <post@ezod.de>
# Contributor: Daniel Mason (idanoo) <daniel@m2.nz>

_electron=electron17
pkgname=(element-{desktop,web}-greentext)
pkgver=1.10.15
pkgrel=1
pkgdesc="Glossy Matrix collaboration client with greentext baked in — "
arch=(x86_64)
url="https://element.io"
license=(Apache)
makedepends=(npm git yarn python rust tcl ${_electron} nodejs-lts-gallium)
optdepends=('darkhttpd: using element-web without electron')
provides=(element-{desktop,web})
conflicts=(element-{desktop,web}{,-git})
_url="https://github.com/vector-im/element"
source=(element-web-${pkgver}.tar.gz::${_url}-web/archive/v${pkgver}.tar.gz
        element-web-${pkgver}.tar.gz.asc::${_url}-web/releases/download/v${pkgver}/v${pkgver}-src.tar.gz.asc
        element-desktop-${pkgver}.tar.gz::${_url}-desktop/archive/v${pkgver}.tar.gz
        element-desktop-${pkgver}.tar.gz.asc::${_url}-desktop/releases/download/v${pkgver}/v${pkgver}-src.tar.gz.asc
        custom-emoji.json
        autolaunch.patch
        io.element.Element.desktop
        greentext.patch
        element-config.json
        element-web.sh
        element-desktop.sh)
sha256sums=('e0831ed43364dadad4167ac12299217aec5f8b4673b5b371d5e7c47aa985bf8d'
            'SKIP'
            '3b5c37b858c9fe773e4fd6e9c79dabe55dadd51c04dc651bbd6b6e0bbdde9d33'
            'SKIP'
            '63ff6e4264b85da29f9147f5cbe58cc3ff395a936683988bca6ef6d0ebeabc99'
            'aaae4ffa41590361dac0c159aecc1166f69e459e89faa9d5cab1202f0277e06f'
            '0103f28a32fe31f698836516783c1c70a76a0117b5df7fd0af5c422c224220f9'
            '0d65ffa85e486a48e8a844fcc8c21b4eaadb28756a74566b22e44f3bdb257e2c'
            'c0a5581ab0dfca07c26888cfb7b75cf9f21567955d0b3982d965434096130b36'
            'bf4892cb7b76ea049d76e443c7d7c93afd19c44bd41839f378661275642cf9cd'
            'c1bd9ace215e3ec9af14d7f28b163fc8c8b42e23a2cf04ce6f4ce2fcc465feba')
validpgpkeys=(712BFBEE92DCA45252DB17D7C7BE97EFA179B100) # Element Releases <releases@riot.im>

prepare() {
  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" element-desktop.sh

  cd -- "element-web-${pkgver}"
  yarn install --no-fund

  # Custom reactions by @q:glowers.club
  # Using python here to avoid depending on jq
  grep -Fq cringe "./node_modules/emojibase-data/en/compact.json" ||
  python -c '
import json
emoji_file = "./node_modules/emojibase-data/en/compact.json"
additional_emoji = "../custom-emoji.json"
with open(emoji_file) as ef, open(additional_emoji) as ae:
    combined = json.load(ae) + json.load(ef)
with open(emoji_file, "w") as ef:
    json.dump(combined, ef, ensure_ascii=False)'

  # Adding custom emoji picker CSS...
  cd -- './node_modules/matrix-react-sdk/res/css/views/emojipicker/' &&
  patch -p1 --forward <<< '
--- a/_EmojiPicker.scss
+++ b/_EmojiPicker.scss
@@ -155,6 +155,9 @@
 }

 .mx_EmojiPicker_item_wrapper {
+    text-overflow: clip;
+    white-space: nowrap;
+    overflow: hidden;
     display: inline-block;
     list-style: none;
     width: 38px;' || true

  cd -- "$srcdir/element-desktop-${pkgver}"
  patch -p1 < ../autolaunch.patch
  sed -i 's|"target": "deb"|"target": "dir"|' package.json
  sed -i 's|"https://packages.element.io/desktop/update/"|null|' element.io/release/config.json
  sed -i 's|"version": "\([^"]*\)"|"version": "\1+greentext"|' package.json
  yarn install --no-fund

  # Patch to include greentext.
  cd -- "$srcdir/element-web-${pkgver}/node_modules/matrix-react-sdk"
  patch -p1 --forward < "$srcdir/greentext.patch" || true
}

build() {
  cd -- "element-web-${pkgver}"
  VERSION=${pkgver} yarn build --offline

  cd -- ../"element-desktop-${pkgver}"
  yarn run build:native
  yarn run build
}

package_element-web-greentext() {
  pkgdesc+="web version."
  replaces=(riot-web vector-web)
  provides=(element-web)
  conflicts=(element-web{,-git,-git-greentext})

  cd -- "element-web-${pkgver}"

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/element

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/element/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/element/
  ln -s /etc/webapps/element/config.json "${pkgdir}"/usr/share/webapps/element/
  echo "${pkgver}" > "$pkgdir/usr/share/webapps/element/version"

  # Install element web launcher
  install -Dm755 "$srcdir/element-web.sh" "$pkgdir/usr/bin/element-web"

  # Alter config
  install -Dm644 "$srcdir/element-config.json" "$pkgdir/etc/webapps/element/config.sample.json"
}

package_element-desktop-greentext() {
  pkgdesc+="desktop version."
  replaces=(riot-desktop)
  provides=(element-desktop)
  conflicts=(element-desktop{,-git,-git-greentext})
  depends=("element-web" ${_electron} libsecret)
  backup=('etc/element/config.json')

  cd -- "element-desktop-${pkgver}"

  install -d "${pkgdir}"{/usr/lib/element/,/etc/webapps/element}

  # Install the app content, replace the webapp with a symlink to the system package
  cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/element/
  ln -s /usr/share/webapps/element "${pkgdir}"/usr/lib/element/webapp

  # Config file
  ln -s /etc/element/config.json "${pkgdir}"/etc/webapps/element/config.json
  install -Dm644 element.io/release/config.json -t "${pkgdir}"/etc/element

  # Required extras
  install -Dm644 ../io.element.Element.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ../element-desktop.sh "${pkgdir}/usr/bin/element-desktop"

  # Icons
  install -Dm644 ../element-web-${pkgver}/res/themes/element/img/logos/element-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/io.element.Element.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/io.element.Element.png
  done

  # Alter config
  install -Dm644 "$srcdir/element-config.json" "$pkgdir/etc/element/config.json"
}
