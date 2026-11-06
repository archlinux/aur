# Maintainer: rimehrab <contact@rimehrab.is-a.dev>

pkgname=lastwave-bin
_pkgname=lastwave
pkgver=2.0.1
pkgrel=1
pkgdesc='Next-Gen Lossless Music player with Algorithmic Smart Playlist Generator, Real-Time Synced Lyrics & Last.fm Scrobbler for Desktop.'
arch=('x86_64')
url='https://github.com/Clash-Projects/LastWave-Desktop'
license=('LicenseRef-unknown')
depends=(
  'ayatana-ido'
  'gtk3'
  'libayatana-appindicator'
  'libayatana-indicator'
  'libkeybinder3'
  'libsecret'
  'mpv'
  'webkit2gtk-4.1'
)
makedepends=('patchelf')
provides=("$_pkgname")
conflicts=("$_pkgname" 'lastwave-desktop')
options=('!strip' '!debug')
_deb="$_pkgname-$pkgver-$CARCH.deb"
source=("$_deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
noextract=("$_deb")
sha256sums=('833369c06a343d45e0db0cd3070d665c01ac30f0cc215dfeeae5e4330d382ac4')

package() {
  bsdtar -xOf "$_deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  chmod 644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  for f in "$pkgdir"/opt/lastwave/lib/*.so; do
    if readelf -d "$f" 2>/dev/null | grep -q '/home/runner'; then
      patchelf --set-rpath '$ORIGIN' "$f"
    fi
  done
}
