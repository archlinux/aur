# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
# Contributor: networkjanitor <networkjanitor@xyooz.net>

_pkgname=input-overlay
pkgname="obs-plugin-$_pkgname-bin"
pkgver=5.0.6
pkgrel=1
groups=('obs-plugins')
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=("obs-studio>=28.0.0"
         "sdl2")
_arch=x86_64-linux-gnu
_source=("$_pkgname-$pkgver-$_arch.deb"
         "$_pkgname-$pkgver-presets.zip")
source=("${_source[@]/#/$url/releases/download/$pkgver/}")
noextract=("${_source[@]}")
sha256sums=('5b03c9212e87a4219eb603149f0c255fe106accc81216afd0f1ffbab7c9d03d0'
            '75bfa7b3c83de494816bf67c7f407ae5d95557ca0052d5dda38a09cbb2b94b83')

prepare() {
  mkdir -p data
  bsdtar xfO "${_source[0]}" --include "data.tar.gz" | bsdtar x \
    --directory data

  mkdir -p presets
  # They put a ZIP in a ZIP!  Wow!
  bsdtar xfO "${_source[1]}" | bsdtar x --exclude "README.md" \
    --directory presets
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  mv {"data/usr/lib/$_arch","$pkgdir/usr/lib"}/obs-plugins
  chmod +x "$pkgdir/usr/lib/obs-plugins/$_pkgname.so"

  mkdir -p "$pkgdir/usr/share"
  mv {"data/usr/share","$pkgdir/usr/share"}/obs

  mv {,"$pkgdir/usr/share/obs/obs-plugins/input-overlay/"}presets
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
