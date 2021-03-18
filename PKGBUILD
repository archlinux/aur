# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-git
pkgver=6621.bda0a93c
pkgrel=1
pkgdesc="A GTK+ based diagram creation program (GIT VERSION)"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('libxslt' 'gtk2' 'python' 'poppler' 'graphene')
makedepends=('git' 'cmake' 'meson' 'intltool' 'dblatex' 'docbook-xsl')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git" poppler_fix.patch)
sha256sums=('SKIP'
            'e3e80a5770e91110a47f3da1eaeab8f692408899aead71ff7c3726369ef9fa4c')

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/poppler_fix.patch
}

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  meson --prefix /usr --buildtype=plain  . build 
  ninja -j1 -C build
}

package() {
  cd ${pkgname%-git}
  DESTDIR="${pkgdir}" ninja -C build install
}
