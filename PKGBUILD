# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
pkgver=69
pkgrel=2
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
source=("git+https://github.com/aunetx/blur-my-shell.git#tag=v$pkgver"
        'gnome49.patch')
sha256sums=('64103381d0063b3c95918f55a31af5b4725968a067f3dab34fea32c8615da943'
            '5ed2fb6995cec024fac667c12a769d5b11d9f8ac657def4895c647fd64cc99b5')

prepare() {
  cd blur-my-shell

  # GNOME 49
  # https://github.com/aunetx/blur-my-shell/pull/791
  patch -Np1 -i ../gnome49.patch
}

build() {
  cd blur-my-shell
  make
}

package() {
  cd blur-my-shell
   _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
