# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## options
: ${_install_path:=usr/lib}
: ${_wmclass:=floorp}

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=12.3.3
pkgrel=1
pkgdesc="Firefox-based web browser focused on performance and customizability"
url="https://github.com/Floorp-Projects/Floorp"
license=('MPL-2.0')
arch=('x86_64' 'aarch64')

makedepends=(
  'imagemagick'
)
optdepends=(
  'ffmpeg4.4: h.264 video'
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
  "floorp.desktop"
  "floorp.png"
)
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.xz"::"$url/releases/download/v${pkgver}/floorp-linux-x86_64.tar.xz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.xz"::"$url/releases/download/v${pkgver}/floorp-linux-aarch64.tar.xz")

sha256sums=(
  '8b38d000950cddd5fa0e1598540590af21f1aae1d30212fb11197c8526662604'
  '71f1bee3ae03473884d7c202b4dfb260f8d68470d6c79695d1208fb944b6f5c8'
)
sha256sums_x86_64=('9bcbfadbae583cdd8a45ab3735fa08e0f613151645fc8ae5ee716cbb6140b76c')
sha256sums_aarch64=('ad2a957493f2ad9aea294ca0322c6b744f6c1188fbefbd772c0a5c0e65832456')

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
  local _desktop=$(< "$_pkgname.desktop")
  _desktop=${_desktop//@WMCLASS@/$_wmclass}
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<< "$_desktop"

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
