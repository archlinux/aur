# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## links
# https://floorp.app/
# https://github.com/Floorp-Projects/Floorp

## options
: ${_install_path:=opt}

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=11.20.0
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://floorp.app/"
arch=('x86_64' 'aarch64')
license=('MPL-2.0')

makedepends=(
  'imagemagick'
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

options=('!strip' '!debug')

source=(
  "floorp.desktop"
  "floorp.png"
)
source_x86_64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-x86_64.tar.bz2")
source_aarch64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-aarch64.tar.bz2")

sha256sums=(
  '07a63f189beaafe731237afed0aac3e1cfd489e432841bd2a61daa42977fb273'
  '853ba77377f296d3bf52f191131883702dd96d38084f78ea5ddb29821ac253d1'
)
sha256sums_x86_64=('59e3a67de994bfc8da3038cfb355b249ea67bf13bda8aaff021c459aabffb767')
sha256sums_aarch64=('cd416460b0b5a8b06ee2c4699110197c8180143e76bce4c119719edfc19c0d00')

package() {
  depends=(
    'alsa-lib'
    'gtk3'
  )

  # app
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgname"/* "$pkgdir/$_install_path/$_pkgname/"

  # symlink duplicate
  ln -srf "$pkgdir/usr/bin/$_pkgname" "$pkgdir/$_install_path/$_pkgname/${_pkgname}-bin"

  # icons
  for i in 32 64 128 256 512; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    install -dm755 "$_icon_dest"
    magick "$_pkgname.png" \
      -resize "${i}x${i}" \
      -define png:compression-filter=0 \
      -define png:compression-level=9 \
      -define png:compression-strategy=0 \
      -type palette \
      "$_icon_dest/$_pkgname.png"
    chmod 644 "$_icon_dest/$_pkgname.png"
  done

  # desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /$_install_path/$_pkgname/$_pkgname "\$@"
END

  # Disable auto-updates
  local _policies_json="$pkgdir/$_install_path/$_pkgname/distribution/policies.json"
  install -Dm644 /dev/stdin "$_policies_json" << END
{
  "policies": {
    "DisableAppUpdate": true
  }
}
END
}
