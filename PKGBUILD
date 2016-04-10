# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.26.0
pkgrel=1
pkgdesc='A low-level configuration system'
arch=('x86_64')
url='http://live.gnome.org/dconf'
license=('LGPL2.1')
depends=('dconf' 'lib32-glib2')
makedepends=('docbook-xsl' 'gcc-multilib' 'intltool' 'python' 'vala')
install='dconf.install'
source=("http://download.gnome.org/sources/dconf/${pkgver%.*}/dconf-${pkgver}.tar.xz")
sha256sums=('8683292eb31a3fae31e561f0a4220d8569b0f6d882e9958b68373f9043d658c9')

prepare() {
  cd dconf-${pkgver}

  sed 's/ editor//g' -i Makefile.in
}

build() {
  cd dconf-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/dconf' \
    --disable-editor \
    --disable-gtk-doc-html \
    --disable-man
  make
}

package() {
  cd dconf-${pkgver}

  make completiondir='/usr/share/bash-completion/completions' DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
