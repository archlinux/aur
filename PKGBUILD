# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-alpha.27.0.3
pkgver=1.0.0.alpha.27.0.3
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk4' 'graphviz' 'carla' 'fluidsynth' 'vamp-plugin-sdk' 'guile' 'libaudec' 'xxhash' 'libcyaml' 'libadwaita' 'reproc' 'libbacktrace' 'rubberband' 'gtksourceview5' 'fftw' 'sratom' 'serd' 'portaudio')
makedepends=('meson' 'cmake' 'guile' 'ruby-sass' 'help2man')
conflicts=('zrythm-git')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc})
sha256sums=('3a857d63283ed547be62e2478b2dc2c8aaf308979a9f731cc48e254a9bba2ac4'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

prepare() {
  cd "$pkgname-$_pkgver"

  rm -r subprojects
}

build() {
  cd "$pkgname-$_pkgver"
  meson build --buildtype=release --prefix=/usr \
    -Dcheck_updates=false \
    -Dmanpage=true -Dtests=true -Dportaudio=enabled
  ninja -C build
}

#check() {
#  cd "$pkgname-$_pkgver"
#  ninja -C build test
#}

package() {
  cd "$pkgname-$_pkgver"
  install -vDm 644 AUTHORS CONTRIBUTING.md \
    CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  DESTDIR="${pkgdir}/" ninja -C build install
}
