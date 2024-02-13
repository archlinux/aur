# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect-git
pkgver=56.r11.g360ccd3
pkgrel=1
pkgdesc="GSConnect CLI"
arch=(any)
url="https://github.com/GSConnect/gnome-shell-extension-${pkgname%-git}"
license=(GPL-2.0-or-later OR MPL-2.0)
depends=(gobject-introspection-runtime gjs gvc-git libnautilus-extension python python-gobject)
makedepends=(appstream flake8 eslint git meson python-black)
optdepends=('ydotool: generic command-line automation tool'
            'wtype: xdotool type for wayland'
            'wl-clipboard: command-line copy/paste utilities for Wayland'
            'waybar: highly customizable Wayland bar'
            'python-pydbus: for fetch gsconnect status for waybar'
            'python-nautilus: Nautilus integration')
provides=(gnome-shell-extension-${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git
        ${pkgname%-git}-bash
        ${pkgname%-git}-waybar-module
        ${pkgname%-git}.service
        ${pkgname%-git}-status.py)
b2sums=('SKIP'
        '9465d8c74bf4b6faf41b3d644fbd659a0e517ffc9cf18aaf87e43f0bfc616ab38fd50a036efc96ba68b62f6cdd813f1d6ab04a31188cb885d5ac61f198a1f551'
        '5a5543e836b5dc4a848b2f5412a1cc3445626bbb53ebd4b5ca413e5f0efdb8cc4cffc24ec6ea62fa65635a1e3e03226ec30b3d5dc908722cd5b2d9509da06fe3'
        'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4'
        '6d4628a722840cbccef999d785e6b0f30286a9a88b0051e99e57fe129c68e9984a38bc923fdebdddc1ead6f319a221a095a1f2d24af1f1e110aeacfd740dc0a1')

pkgver() {
  git -C ${pkgname%-git} describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

package() {
  DESTDIR=${pkgdir} meson install -C build
  install -Dm644 ${pkgname%-git}-bash          -t ${pkgdir}/usr/share/doc/${pkgname%-git}/
  install -Dm644 ${pkgname%-git}-waybar-module -t ${pkgdir}/usr/share/doc/${pkgname%-git}/
  install -Dm644 ${pkgname%-git}-status.py     -t ${pkgdir}/usr/share/${pkgname%-git}/
  install -Dm644 ${pkgname%-git}.service       -t ${pkgdir}/usr/lib/systemd/user/
  install -d ${pkgdir}/usr/bin/
  ln -s /usr/share/gnome-shell/extensions/${pkgname%-git}@andyholmes.github.io/service/daemon.js ${pkgdir}/usr/bin/${pkgname%-git}
  ln -s /usr/share/gnome-shell/extensions/${pkgname%-git}@andyholmes.github.io/${pkgname%-git}-preferences ${pkgdir}/usr/bin/${pkgname%-git}-preferences
}
