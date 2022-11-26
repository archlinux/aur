# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: alex korobtsov <korobcoff@gmail.com>
# Contributor: Alexander Bantyev <balsoft@yandex.ru>

pkgname=qomp
pkgver=1.5
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player"
arch=(i686 x86_64)
url="https://github.com/qomp/qomp"
license=(GPL2)
depends=(taglib qt5-base qt5-x11extras
         qt5-multimedia qt5-xmlpatterns
         gstreamer libcue gst-plugins-good)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
makedepends=(git cmake qt5-tools)
source=("git+https://github.com/qomp/qomp.git#tag=${pkgver}"
        "qomp-translations::git+https://github.com/qomp/translations.git"
        "qomp-themes::git+https://github.com/qomp/themes.git"
        "git+https://github.com/wadealer/qt-google-analytics.git"
        "git+https://github.com/wadealer/SingleApplication")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/qomp"

  git submodule init
  git config submodule.translations.url "${srcdir}/qomp-translations"
  git config submodule.themes.url "${srcdir}/qomp-themes"
  git config submodule.ga.url "${srcdir}/qt-google-analytics"
  git config submodule.src/singleapplication.url "${srcdir}/SingleApplication"
  git config submodule.android_openssl.update none
  git -c protocol.file.allow=always submodule update

  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/qomp/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/qomp/build"
  make DESTDIR="$pkgdir/"  install
}
