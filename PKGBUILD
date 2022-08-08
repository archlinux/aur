# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: hbdee <hbdee.arch@gmail.com>

_pkgname=hydrogen
pkgname="$_pkgname-git"
pkgver=1.1.1.r1064.ga219c3092
pkgrel=1
pkgdesc='An advanced drum machine (git version)'
arch=(x86_64)
license=(GPL)
groups=(pro-audio)
url="https://github.com/hydrogen-music/hydrogen"
depends=(gcc-libs glibc hicolor-icon-theme qt5-base qt5-xmlpatterns)
makedepends=(git alsa-lib cmake itstool jack ladspa libarchive liblo
             liblrdf libpulse libsndfile libxml2 portaudio portmidi
             python qt5-tools docbook-xml docbook-sgml docbook-utils
             docbook-xsl poxml xmlto)
optdepends=('new-session-manager: for session management')
source=($_pkgname::'git+https://github.com/hydrogen-music/hydrogen.git'
        'hydrogen-docs::git+https://github.com/hydrogen-music/documentation.git'
        'fix_dtd_version.patch')
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
md5sums=('SKIP'
         'SKIP'
         'dac93731dd33285ebd129eae60161337')

pkgver() {
  cd $_pkgname

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  # link docs sources
  git submodule init
  git config submodule.doc.url "$srcdir"/hydrogen-docs
  git submodule update

  # update docbook dtd version
  patch -Np1 -r - -i "$srcdir"/fix_dtd_version.patch || true
}

build() {
  cd $_pkgname

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DWANT_CPPUNIT=OFF \
    -DWANT_DEBUG=OFF \
    -DWANT_LASH=OFF \
    -DWANT_LRDF=ON \
    -DWANT_PORTAUDIO=ON \
    -DWANT_PORTMIDI=ON \
    -DWANT_PULSEAUDIO=ON \
    -Wno-dev \
    -B build \
    -S .
  make VERBOSE=1 -C build
  # build html manual & tutorial
  cd data/doc
  msg2 "Making manual..."
  make -j1
  # update translations
  cd ../i18n
  msg2 "Updating translations..."
  ./updateTranslations.sh
}

package() {
  depends+=(libarchive.so libasound.so liblo.so libjack.so liblrdf.so
            liblo.so libportaudio.so libportmidi.so libpulse.so
            libsndfile.so)
  cd $_pkgname

  make DESTDIR="$pkgdir" -C build install

  # install docs
  install -vDm644 ChangeLog DEVELOPERS INSTALL.md README.txt \
      -t "$pkgdir"/usr/share/doc/$pkgname
  # install html manual & tutorial
  cd data/doc
  install -Dm644 *.html -t "$pkgdir"/usr/share/$_pkgname/data/doc
  install -Dm644 *.ods -t "$pkgdir"/usr/share/$_pkgname/data/doc
  install -Dm644 img/*.png -t "$pkgdir"/usr/share/$_pkgname/data/doc/img
  install -Dm644 img/admonitions/*.svg -t "$pkgdir"/usr/share/$_pkgname/data/doc/img/admonitions
  install -Dm644 img_tutorial/*.png -t "$pkgdir"/usr/share/$_pkgname/data/doc/img_tutorial
}

# vim:set ts=2 sw=2 et:
