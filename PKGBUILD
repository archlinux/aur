# Maintainer: zxcloli666 <156155219+zxcloli666@users.noreply.github.com>

# CI (aur-publish.yml) rewrites pkgver/pkgrel/sha256sums_* with ^-anchored sed:
# keep those four assignments one-line and at column 0.
pkgname=soundcloud-bin
pkgver=8.4.10
pkgrel=1
pkgdesc="🎵🎵🎵 THE BEST SOUNDCLOUD DESKTOP APP FOR WINDOWS, LINUX & MACOS | AI WAVE | NO ADS | NO CAPTCHA | NO RESTRICTIONS"
arch=('x86_64' 'aarch64')
url="https://github.com/zxcloli666/SoundCloud-Desktop"
license=('MIT')
depends=('gtk3' 'libappindicator' 'webkit2gtk-4.1')
provides=("soundcloud-desktop=${pkgver}")
conflicts=('soundcloud-desktop')
options=('!strip' '!debug')

_app='soundcloud-desktop'

source=("LICENSE::${url}/raw/${pkgver}/LICENSE"
        "${_app}.desktop")
sha256sums=('3bed3331b7048bac17cf50e249d560ccc9508c970da8d7b9283bf4f2e633a91d'
            '123e9a1e84eec9b29106ee83de9f5d24be17659468731babe22cf1faeb89bb3b')

source_x86_64=("soundcloud-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_amd64.deb")
sha256sums_x86_64=('917d3b55b533833a31a84a9e06697565942bfa7bcfdee36822beb26f852bb97c')

source_aarch64=("soundcloud-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/soundcloud-desktop_${pkgver}_arm64.deb")
sha256sums_aarch64=('a0d1a355f632eebb71cc6864146f42383ecfca9559513468e97904f441e270e3')

noextract=("soundcloud-${pkgver}-x86_64.deb"
           "soundcloud-${pkgver}-aarch64.deb")

prepare() {
  # makepkg only wipes $srcdir with -C, so drop the previous unpack ourselves.
  rm -rf "$srcdir/usr" "$srcdir/control.tar.gz" "$srcdir/data.tar.gz" "$srcdir/debian-binary"
  bsdtar -xOf "soundcloud-${pkgver}-${CARCH}.deb" 'data.tar*' | bsdtar -xf - -C "$srcdir"
}

package() {
  install -Dm755 "$srcdir/usr/bin/${_app}" "$pkgdir/usr/bin/${_app}"

  local _icon
  while IFS= read -r -d '' _icon; do
    install -Dm644 "$_icon" "$pkgdir/${_icon#"$srcdir"/}"
  done < <(find "$srcdir/usr/share/icons" -type f -print0)

  install -Dm644 "$srcdir/${_app}.desktop" "$pkgdir/usr/share/applications/${_app}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
