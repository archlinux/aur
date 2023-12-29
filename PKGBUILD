# Maintainer:

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=11.7.1
pkgrel=3
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="http://floorp.app/"
arch=('x86_64' 'aarch64')
license=('MPL-2.0')

makedepends=(
  'imagemagick'
  'optipng'
)
optdepends=(
  'ffmpeg: h.264 video'
  'hunspell-dictionary: spell checking'
  'hyphen: hyphenation'
  'libnotify: notification integration'
  'networkmanager: location detection via available WiFi networks'
  'speech-dispatcher: text-to-speech'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

source=(
  "floorp.desktop"
  "floorp.png"
)
sha256sums=(
  '031ed9b2973315247e716836bb365ac5ce70cb4624742a7e565050c654eba4f9'
  '71f1bee3ae03473884d7c202b4dfb260f8d68470d6c79695d1208fb944b6f5c8'
)

source_x86_64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-${arch}.tar.bz2")
source_aarch64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-${arch}.tar.bz2")
sha256sums_x86_64=('af943e71ed5d5d43e58ea34a8e23e8fc543f8013b834bf961fb3852b3632143e')
sha256sums_aarch64=('1b094fbb84fcf5214ec7da98364ccd6b88e5fbbe8f6b067cee7cad945a796f11')

package() {
  depends+=('hicolor-icon-theme')

  local _install_path="opt/$_pkgname"

  # app
  install -dm755 "$pkgdir/$_install_path"
  cp --reflink=auto -r "$_pkgname"/* "$pkgdir/$_install_path/"

  # icons
  for i in 32 64 128 256 512; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    install -dm755 "$_icon_dest"
    convert -resize ${i}x${i} "$_pkgname.png" "$_icon_dest/$_pkgname.png"
    optipng "$_icon_dest/$_pkgname.png"
    chmod 644 "$_icon_dest/$_pkgname.png"
  done

  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /opt/$_pkgname/$_pkgname "\$@"
END

  # Disable auto-updates
  local _policies_json="$pkgdir/$_install_path/distribution/policies.json"
  install -Dvm644 /dev/stdin "$_policies_json" <<END
{
  "policies": {
    "DisableAppUpdate": true
  }
}
END

  # Use system-provided dictionaries
  rm -rf "$pkgdir/$_install_path"/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/$_install_path/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/$_install_path/hyphenation"
}
