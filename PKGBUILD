# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>
# Maintainer: xiota / aur.chaotic.cx

## useful links
# http://floorp.app/
# https://github.com/Floorp-Projects/Floorp

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=11.8.2
pkgrel=1
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
  '07a63f189beaafe731237afed0aac3e1cfd489e432841bd2a61daa42977fb273'
  '853ba77377f296d3bf52f191131883702dd96d38084f78ea5ddb29821ac253d1'
)

source_x86_64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-${arch}.tar.bz2")
source_aarch64=("https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-${pkgver}.linux-${arch}.tar.bz2")
sha256sums_x86_64=('408653fa59cbfcc0e11c4efcb57ea74084b87b618b0e1fa65562afd11b869042')
sha256sums_aarch64=('77e4b0fbe2b02ec562df2a3da7f80142d26d0b9a09c0a1c98fa8d6b1aaad3d3b')

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

  # Use system-provided dictionaries
  rm -rf "$pkgdir/$_install_path"/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/$_install_path/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/$_install_path/hyphenation"
}
