# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## useful links
# https://floorp.app/
# https://github.com/Floorp-Projects/Floorp

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=11.11.1
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://floorp.app/"
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

options=('!debug')

source=(
  "floorp.desktop"
  "floorp.png"
)
sha256sums=(
  '07a63f189beaafe731237afed0aac3e1cfd489e432841bd2a61daa42977fb273'
  '853ba77377f296d3bf52f191131883702dd96d38084f78ea5ddb29821ac253d1'
)

source_x86_64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-x86_64.tar.bz2")
source_aarch64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-aarch64.tar.bz2")
sha256sums_x86_64=('4bf2e70e155b134bc436ce83474dd7b3efa7a502f5202f9c124806ec5bc21082')
sha256sums_aarch64=('35e57e5a723f6ad81afee56445f1b5f8b9c06c8bd1c0cc8627e2f1092bf5772c')

package() {
  depends=(
    'alsa-lib'
    'dbus-glib'
    'gtk3'

    ## implicit
    #'at-spi2-core'
    #'hicolor-icon-theme'
    #'libxcomposite'
    #'libxi'
    #'libxrandr'
    #'libxtst'
  )

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
exec /$_install_path/$_pkgname "\$@"
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
}
