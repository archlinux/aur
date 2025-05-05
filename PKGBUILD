# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: hbdee <hbdee.arch@gmail.com>

_pkgname=hydrogen
pkgname="$_pkgname-git"
pkgver=1.2.4.r56.g546aae389
pkgrel=1
pkgdesc='An advanced drum machine (git version)'
arch=(x86_64)
license=(GPL-2.0-or-later)
groups=(pro-audio)
url='https://github.com/hydrogen-music/hydrogen'
depends=(gcc-libs glibc hicolor-icon-theme qt5-base qt5-xmlpatterns)
makedepends=(git alsa-lib cmake itstool jack ladspa libarchive liblo
             liblrdf libpulse libsndfile libxml2 portaudio portmidi
             python qt5-tools docbook-xml docbook-sgml docbook-utils
             docbook-xsl poxml xmlto)
checkdepends=(cppunit)
optdepends=('new-session-manager: for session management')
source=($_pkgname::'git+https://github.com/hydrogen-music/hydrogen.git#branch=releases/1.2'
        'hydrogen-docs::git+https://github.com/hydrogen-music/documentation.git'
        'fix_dtd_version.patch')
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
sha256sums=('SKIP'
            'SKIP'
            'd619092c335ee5aed8cd419d9c9cf63cb9c668ff944ec9a05eaa41ec2e2882e1')

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
  git -c protocol.file.allow=always submodule update

  # update docbook dtd version
  patch -Np1 -r - -i "$srcdir"/fix_dtd_version.patch || true
  # fix mininimum CMAke version
  sed -i -e 's/VERSION 2.6/VERSION 3.10/' cmake/sscanf/CMakeLists.txt
  sed -i -e 's/VERSION 2.6/VERSION 3.10/' cmake/rtclock/CMakeLists.txt
}

build() {
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
    -B $_pkgname-build \
    -S $_pkgname
  cmake --build $_pkgname-build
  # build html manual & tutorial
  cd $_pkgname/data/doc
  echo "Making manual..."
  make -j1
}

check() {
  ctest --test-dir $_pkgname-build --output-on-failure
}

package() {
  depends+=(libarchive.so libasound.so liblo.so libjack.so liblrdf.so
            liblo.so libportaudio.so libportmidi.so libpulse.so
            libsndfile.so)
  DESTDIR="$pkgdir" cmake --install $_pkgname-build

  # install docs
  cd $_pkgname
  install -vDm644 AUTHORS CHANGELOG.md DEVELOPERS INSTALL.md README.md \
      -t "$pkgdir"/usr/share/doc/$pkgname
  # install html manual & tutorial
  cd data/doc
  install -Dm644 *.html -t "$pkgdir"/usr/share/$_pkgname/data/doc
  install -Dm644 img/*.png -t "$pkgdir"/usr/share/$_pkgname/data/doc/img
  install -Dm644 img/admonitions/*.svg -t "$pkgdir"/usr/share/$_pkgname/data/doc/img/admonitions
  install -Dm644 img_tutorial/*.png -t "$pkgdir"/usr/share/$_pkgname/data/doc/img_tutorial
}

# vim:set ts=2 sw=2 et:
