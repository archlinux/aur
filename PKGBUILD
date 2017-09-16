# Maintainer: Bian Jiaping <ssbianjp@gmail.com>

pkgname=sublime-text-dev-imfix2
pkgver=3.3143
pkgrel=1
pkgdesc="Sophisticated text editor for code, html and prose - beta build with input method support for CJK users"
arch=('i686' 'x86_64')
url="http://www.sublimetext.com/3"
license=('custom')
depends=('libpng' 'gtk2')
optdepends=('gksu: sudo-save support')
conflicts=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix')
provides=('sublime-text' 'sublime-text-dev' 'sublime-text-nightly' 'sublime-text-dev-imfix')

source=('sublime_text_3.desktop' 'subl' 'sublime_imfix.c')
source_i686=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x32.tar.bz2")
source_x86_64=("https://download.sublimetext.com/sublime_text_3_build_${pkgver:2}_x64.tar.bz2")

sha256sums=('f355c6bec64e962a5735d0a7d1e11ac39b5b82aacaaf23b222c0bc202e15d866'
            'f0d3cc429aa79585fdd2f83046de5eecf48a474c07bbdb57a1655f98ee2d580c'
            '5903b47f7dfbf079987c566361c5735a002dcbf25d0f86de86b7dce424f36700'
           )
sha256sums_i686=('b1ecc4b70d66b9236b876f1913c4094b6dd51436e45c74883ba70a1939e9f735')
sha256sums_x86_64=('9ce120c4f28b239d3b3860ee672d9d87e1397a4c08ee6c4e62fd6e261a296519')

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
  install -Dm755 subl "${pkgdir}/usr/bin/subl"
}
