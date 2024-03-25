# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## useful links
# https://floorp.app/
# https://github.com/Floorp-Projects/Floorp

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=11.11.2
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
sha256sums_x86_64=('60e48e49153d1fbeb7f5d10157c2089961fdfed4c495f0eea6f2b93a6b6392ad')
sha256sums_aarch64=('07e049c1a68e3c30cbfda472a463537c9dea98306bbe2cfba9d78d800367ec04')

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
