# Maintainer: GianlucaHex <gianlucamastrolonardo10 at gmail dot com>

pkgname=mitos-editor-bin
_pkgname=mitos
_debrev=1
pkgver=0.1.1
pkgrel=1
pkgdesc='A fast and minimal modal text editor'
arch=('x86_64')
url='https://github.com/mitos-editor/mitos'
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
options=(!strip !debug)
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-${_debrev}_amd64.deb")
sha256sums=('5e37027f19c8b712a6b3284c42d84f93a6ec9acbdb0a74e6bae4d1afa16fb668')

build() {
  mkdir -p "$srcdir/deb/data"
  bsdtar -xf "${_pkgname}_${pkgver}-${_debrev}_amd64.deb" -C "$srcdir/deb"
  bsdtar -xf "$srcdir/deb/data.tar.xz" -C "$srcdir/deb/data"
}

check() {
  "$srcdir/deb/data/usr/lib/mitos/ms" --version | grep -q "^mitos $pkgver "
}

package() {
  local debdir="$srcdir/deb/data"

  install -Dm755 "$debdir/usr/bin/ms" "$pkgdir/usr/bin/ms"
  install -Dm755 "$debdir/usr/lib/mitos/ms" "$pkgdir/usr/lib/mitos/ms"
  cp -a "$debdir/usr/lib/mitos/runtime" "$pkgdir/usr/lib/mitos/"

  install -Dm644 "$debdir/usr/share/applications/Mitos.desktop" \
    "$pkgdir/usr/share/applications/Mitos.desktop"

  install -Dm644 "$debdir/usr/share/bash-completion/completions/ms" \
    "$pkgdir/usr/share/bash-completion/completions/ms"
  install -Dm644 "$debdir/usr/share/fish/vendor_completions.d/ms.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/ms.fish"
  install -Dm644 "$debdir/usr/share/zsh/vendor-completions/_ms" \
    "$pkgdir/usr/share/zsh/vendor-completions/_ms"

  install -Dm644 "$debdir/usr/share/doc/mitos/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$debdir/usr/share/doc/mitos/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$debdir/usr/share/doc/mitos/copyright" \
    "$pkgdir/usr/share/doc/$pkgname/copyright"
}
