# Maintainer: Bian Jiaping <ssbianjp@gmail.com>

pkgname=sublime-text-dev-imfix2
pkgver=3.3083
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - dev build with input method support for CJK users"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/3"
license=('custom')
depends=('libpng' 'gtk2')
optdepends=('gksu: sudo-save support')
conflicts=('sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix')
provides=('sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix')
install=sublime-text-dev.install

source=('sublime_text_3.desktop' 'subl3' 'sublime_imfix.c')
source_x86_64=("http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2")
source_i686=("http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_${pkgver:2}_x32.tar.bz2")

sha256sums=('f355c6bec64e962a5735d0a7d1e11ac39b5b82aacaaf23b222c0bc202e15d866'
            'f0d3cc429aa79585fdd2f83046de5eecf48a474c07bbdb57a1655f98ee2d580c'
            '5903b47f7dfbf079987c566361c5735a002dcbf25d0f86de86b7dce424f36700'
           )
sha256sums_i686=('89e8e2bafa041c263d2c5ffd1b8ea3c36d9727c95a3f7a6603bdf1f6c4cc3165')
sha256sums_x86_64=('4565c7f607b69ca6efa1751c739a11d42aeaf66d15987fbb9595e97e3ece14ee')

build() {
  # build imfix library
  gcc -shared -o libsublime-imfix.so `pkg-config --libs --cflags gtk+-2.0` -fPIC sublime_imfix.c
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r "sublime_text_3" "${pkgdir}/opt/sublime_text_3"

  # Install imfix library
  install -Dm755 libsublime-imfix.so ${pkgdir}/opt/sublime_text_3/libsublime-imfix.so

  for res in 128x128 16x16 256x256 32x32 48x48; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    ln -s "/opt/sublime_text_3/Icon/${res}/sublime-text.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/sublime-text.png"
  done

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "sublime_text_3.desktop" "${pkgdir}/usr/share/applications/sublime_text_3.desktop"

  install -Dm755 subl3 "${pkgdir}/usr/bin/subl3"
}
