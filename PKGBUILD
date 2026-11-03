# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
# Contributor: networkjanitor <networkjanitor@xyooz.net>

_pkgname=input-overlay
pkgname="obs-plugin-$_pkgname-bin"
pkgver=5.1.3
pkgrel=1
groups=('obs-plugins')
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=("obs-studio>=33.0.0"
         "sdl2")
_arch=x86_64-linux-gnu
_source=("$_pkgname-$pkgver-$_arch.deb"
         "$_pkgname-$pkgver-presets.zip")
source=("${_source[@]/#/$url/releases/download/$pkgver/}")
noextract=("${_source[@]}")
sha256sums=('17aff8cbc99c5d16f1e6f788e9130ff5c3933f33c92cc5d65a82e3dd48931573'
            'ceba6953b519bb0e2ac23d538a47bbfe8609fe9544e2e59c0a4dbaa70021a074')

prepare() {
  mkdir -p data
  bsdtar xfO "${_source[0]}" --include "data.tar.gz" | bsdtar x - \
    --directory data

  mkdir -p presets
  bsdtar xf "${_source[1]}" --exclude "README.md" \
    --directory presets
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -r "data/usr/lib/$_arch/"{input-overlay,obs-plugins} \
    -t "$pkgdir/usr/lib"
  chmod +x "$pkgdir/usr/lib"/{input-overlay,obs-plugins}/*.so

  mkdir -p "$pkgdir/usr/share"
  cp -r data/usr/share/obs \
    -t "$pkgdir/usr/share"
  cp -r presets \
    -t "$pkgdir/usr/share/obs/obs-plugins/input-overlay"
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
