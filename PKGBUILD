# Maintainer: tatsumoto <tatsu at autistici.org>
# Contributor: ta180m <ta180m@pm.me>
# Contributor: teutat3s <teutates@mailbox.org>
# Contributor: jaltek <post@ezod.de>
# Contributor: Daniel Mason (idanoo) <daniel@m2.nz>

pkgbase=element-desktop-git-greentext
pkgname=(element-{desktop,web}-git-greentext)
pkgver=1.9.9.r28.gcfa97212f+greentext
pkgrel=1
pkgdesc="Glossy Matrix collaboration client with greentext baked in — "
arch=(x86_64)
url="https://element.io"
license=(Apache)
makedepends=(npm git yarn python rust sqlcipher electron nodejs-lts-fermium)
optdepends=('darkhttpd: using element-web without electron')
provides=(element-desktop{,-git} element-web{,-git})
conflicts=(element-desktop{,-git} element-web{,-git})
_giturl="git+https://github.com/vector-im"
source=("element-web::${_giturl}/element-web.git"
        "element-desktop::${_giturl}/element-desktop.git"
        custom-emoji.json
        autolaunch.patch
        io.element.Element.desktop
        greentext.patch
        element-config.json
        element-web.sh
        element-desktop.sh)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'aaae4ffa41590361dac0c159aecc1166f69e459e89faa9d5cab1202f0277e06f'
            '0103f28a32fe31f698836516783c1c70a76a0117b5df7fd0af5c422c224220f9'
            'a3565475dc4ec1365ae2d0d52a000683386618fb49009dccd93ff3b2a0d53576'
            'eb422aca8b3dd71282aa432bdf66eaac0272a9ac5a91b332fde5f6fb9e885852'
            'bf4892cb7b76ea049d76e443c7d7c93afd19c44bd41839f378661275642cf9cd'
            'c1bd9ace215e3ec9af14d7f28b163fc8c8b42e23a2cf04ce6f4ce2fcc465feba')
_electron=electron

pkgver() {
  cd "$srcdir/element-web"

  ( set -o pipefail
    # cutting off 'v' prefix that presents in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    echo '+greentext'
  ) | tr -d '\n'
}

prepare() {
  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" element-desktop.sh

  cd -- "$srcdir/element-web"
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

  cd -- "$srcdir/element-desktop"
  patch -p1 < "$srcdir/autolaunch.patch"
  sed -i 's|"target": "deb"|"target": "dir"|' package.json
  sed -i 's|"version": "\([^"]*\)"|"version": "\1+greentext"|' package.json
  sed -i 's|"https://packages.riot.im/desktop/update/"|null|' element.io/release/config.json
  yarn install --no-fund

  cd "$srcdir/element-web/node_modules/matrix-react-sdk"
  patch -p1 --forward < "$srcdir/greentext.patch" || true
  yarn reskindex
}

build() {
  cd "$srcdir/element-web"
  yarn build --offline

  cd "$srcdir/element-desktop"
  yarn run build:native
  yarn run build
}

package_element-web-git-greentext() {
  pkgdesc+="web version."
  replaces=(riot-web vector-web)
  provides=(element-web{,-git})
  conflicts=(element-web{,-git})

  cd element-web

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/element

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/element/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/element/
  ln -s /etc/webapps/element/config.json "${pkgdir}"/usr/share/webapps/element/
  echo "$pkgver" > "$pkgdir/usr/share/webapps/element/version"

  # Install element web launcher
  install -Dm755 "$srcdir/element-web.sh" "$pkgdir/usr/bin/element-web"

  # Alter config
  install -Dm644 "$srcdir/element-config.json" "$pkgdir/etc/webapps/element/config.sample.json"
}

package_element-desktop-git-greentext() {
  pkgdesc+="desktop version."
  replaces=(riot-desktop)
  depends=("element-web" ${_electron} sqlcipher)
  provides=(element-desktop{,-git})
  conflicts=(element-desktop{,-git})
  backup=("etc/element/config.json")

  cd element-desktop

  install -d "${pkgdir}"{/usr/lib/element/,/etc/webapps/element}

  # Install the app content, replace the webapp with a symlink to the system package
  cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/element/
  ln -s /usr/share/webapps/element "${pkgdir}"/usr/lib/element/webapp

  # Config file
  ln -s /etc/element/config.json "${pkgdir}"/etc/webapps/element/config.json
  install -Dm644 element.io/release/config.json -t "${pkgdir}"/etc/element

  # Required extras
  install -Dm644 ../io.element.Element.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ../element-desktop.sh "$pkgdir/usr/bin/element-desktop"

  # Icons
  install -Dm644 ../element-web/res/themes/element/img/logos/element-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/io.element.Element.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/io.element.Element.png
  done

  # Alter config
  install -Dm644 "$srcdir/element-config.json" "$pkgdir/etc/element/config.json"
}
