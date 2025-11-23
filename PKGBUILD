# Maintainer: Bronya <kotone[dot]olin1010[at]gmail[dot]com>

## options
: ${_install_path:=usr/lib}
: ${_wmclass:=floorp}

_pkgname="floorp"
pkgname="$_pkgname-bin"
pkgver=12.7.0
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
sha256sums_x86_64=('8e97cbac7090cc3734eb63ce23e69495a0080dc881c6123b1b3b18bc7b6def62')
sha256sums_aarch64=('d66d9d978902e22dc0c312e1f267e0f2537c8b0427857acb75532ef07b095c9d')

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
  local _magick_opts=(
    -define png:compression-filter=0
    -define png:compression-level=9
    -define png:compression-strategy=0
  )

  for i in 32 48 64 128; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    mkdir -pm755 "$_icon_dest"
    ln -sf "/usr/lib/floorp/browser/chrome/icons/default/default${i}.png" "$_icon_dest/$_pkgname.png"
  done

  for i in 256 512; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    mkdir -pm755 "$_icon_dest"
    magick "$_pkgname.png" -resize "${i}x${i}" "${_magick_opts[@]}" png8:"$_icon_dest/$_pkgname.png"
  done

  for i in '512x512@2'; do
    local _icon_dest="$pkgdir/usr/share/icons/hicolor/${i}/apps"
    mkdir -pm755 "$_icon_dest"
    magick "$_pkgname.png" "${_magick_opts[@]}" png8:"$_icon_dest/$_pkgname.png"
  done

  # launcher
  local _desktop=$(sed -e "s/@WMCLASS@/$_wmclass/" "$srcdir/$_pkgname.desktop")
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
