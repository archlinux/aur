# Maintainer: czyt <czytcn@gmail.com>

pkgname=pinky-bin
pkgver=2026.1125.9
pkgrel=1
pkgdesc="Let AI agents use an Android phone or iPhone, with you approving the risky steps: drives the phone over MCP, records every run, and brings its own adb"
arch=('x86_64')
url="https://github.com/DIYgod/pinky"
license=('Apache-2.0')
# The program is a Go build that links only glibc and opens GTK 3 for its
# window; adb, the FFmpeg libraries and the phone app travel with it.
depends=('glibc' 'gtk3' 'dbus')
optdepends=(
  'android-udev: open an Android phone over USB without root'
  'usbmuxd: open an iPhone or iPad over USB'
  'libsecret: save the phone PIN in your keyring'
  'libayatana-appindicator: show Pinky in the system tray'
  'gtk-layer-shell: place the window through the compositor layer shell'
  'libva: decode the phone screen stream on the GPU'
  'webkit2gtk-4.1: show HTML pages, such as an exported run report'
  'xdg-utils: open a link from the phone in your browser'
)
provides=('pinky')
conflicts=('pinky' 'pinky-git')
options=('!strip' '!debug')

# Upstream names its deb after the version, so the local name is the same one
# and makepkg cannot keep serving an older release from its cache.
_deb="pinky_${pkgver}_amd64.deb"
source=("${_deb}::https://github.com/DIYgod/pinky/releases/download/v${pkgver}/${_deb}"
        "pinky-LICENSE::https://raw.githubusercontent.com/DIYgod/pinky/v${pkgver}/LICENSE")
noextract=("${_deb}")
sha256sums=('a42557b3bb4c6f7537319ac8ccf1793c711ceb68d3889c847a3e4fe742ebd419'
            'c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')

package() {
  # The deb is an ar archive holding data.tar.*; the compression suffix varies,
  # so the member is looked up instead of assumed.
  local data_archive stage
  data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar/{p;q;}')"
  [[ -n "$data_archive" ]] || { echo "No data.tar.* member in ${_deb}" >&2; return 1; }

  stage="${srcdir}/stage"
  rm -rf "${stage}"
  mkdir -p "${stage}"
  bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" |
    bsdtar --no-same-owner -xf - -C "${stage}"

  # The deb puts Pinky in /opt/pinky, which Arch packages keep under /usr/lib.
  # Everything Pinky looks up, its bundled adb, FFmpeg libraries and the phone
  # app, sits beside its own executable, so the whole tree moves together.
  install -d "${pkgdir}/usr/lib/pinky"
  cp -a "${stage}/opt/pinky/." "${pkgdir}/usr/lib/pinky/"

  # Upstream installs this command and no /usr/bin/pinky, which coreutils owns.
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/pinky/pinky "${pkgdir}/usr/bin/pinkyctl"

  install -Dm644 "${stage}/usr/share/applications/pinky.desktop" \
    "${pkgdir}/usr/share/applications/pinky.desktop"
  install -Dm644 "${stage}/usr/share/icons/hicolor/256x256/apps/pinky.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pinky.png"
  install -Dm644 "${stage}/usr/share/icons/hicolor/512x512/apps/pinky.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pinky.png"

  # The deb's desktop file points at /opt; the command is on PATH here.
  sed -i 's|^Exec=.*|Exec=pinkyctl|' \
    "${pkgdir}/usr/share/applications/pinky.desktop"

  # The deb carries no licence text of Pinky's own, so it comes from the tag.
  install -Dm644 "${srcdir}/pinky-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
