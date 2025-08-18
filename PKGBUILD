# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## links
# https://floorp.app/
# https://github.com/Floorp-Projects/Floorp

## options
: ${_install_path:=usr/lib}

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=12.0.17
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://floorp.app/"
license=('MPL-2.0')
arch=('x86_64')

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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

source=(
  "$_pkgname-$pkgver-linux-amd64.tar.xz"::"https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/floorp-linux-amd64.tar.xz"
  "floorp.desktop"
  "floorp.png"
)

sha256sums=(
  'e857328dfaa69b9ae5faa64aaba14517b19e212ee2b727f0e8683e04a16437f5'
  '00ac63fe0331de13e418b5d6552bda95cb3a00267feccf07afa49600e810f65a'
  '71f1bee3ae03473884d7c202b4dfb260f8d68470d6c79695d1208fb944b6f5c8'
)

package() {
  depends=(
    'alsa-lib'
    'gtk3'
  )

  # app
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a "$_pkgname"/* "$pkgdir/$_install_path/$_pkgname/"

  # symlink duplicate
  ln -sf "$_pkgname" "$pkgdir/$_install_path/$_pkgname/${_pkgname}-bin"

  # icons
  for i in 32 48 64 128 256 512; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    mkdir -pm755 "$_icon_dest"
    magick "$_pkgname.png" \
      -resize "${i}x${i}" \
      -define png:compression-filter=0 \
      -define png:compression-level=9 \
      -define png:compression-strategy=0 \
      png8:"$_icon_dest/$_pkgname.png"
    chmod 644 "$_icon_dest/$_pkgname.png"
  done

  # launcher
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
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

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
