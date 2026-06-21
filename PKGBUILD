# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgbase=rssguard
pkgbase="$_pkgbase-git"
pkgname=($_pkgbase-{,nowebengine-}git)
pkgver=5.1.2.r80.g537232ebf
pkgrel=1
pkgdesc='Simple, lightweight and easy-to-use RSS/ATOM feed aggregator developed using Qt'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/martinrotter/rssguard'
license=('GPL-3.0-only')
optdepends=('oxygen-icons: fallback icon theme')
makedepends=('git' 'cmake' 'go' 'qt6-base' 'qt6-tools' 'qt6-declarative' 'qt6-webengine' 'qt6-multimedia' 'qxmpp' 'mpv')
source=("git+${url}.git"
        git+https://codeberg.org/gumbo-parser/gumbo-parser
        git+https://github.com/martinrotter/qt-publicsuffix
        git+https://github.com/martinrotter/qtlinq)
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

pkgver() {
  cd ${_pkgbase}
  git describe --always | sed 's|-|.r|;s|-|.|'
}

prepare() {
  cd ${_pkgbase}
  git submodule init
  git submodule set-url src/librssguard/3rd-party/gumbo "$srcdir"/gumbo-parser
  git submodule set-url src/librssguard/3rd-party/qt-publicsuffix "$srcdir"/qt-publicsuffix
  git submodule set-url src/librssguard/3rd-party/qtlinq "$srcdir"/qtlinq
  git -c protocol.file.allow=always submodule update src/librssguard/3rd-party/gumbo src/librssguard/3rd-party/qt-publicsuffix src/librssguard/3rd-party/qtlinq
}

build() {
  rm -Rf build* && mkdir build{,-nowebengine}
  cd "${srcdir}"/build
  cmake "${srcdir}"/${_pkgbase}/ \
        -DCMAKE_BUILD_TYPE=debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_XMPP_PLUGIN=ON
  make
  cd "${srcdir}"/build-nowebengine
  cmake "${srcdir}"/$_pkgbase/ \
        -DCMAKE_BUILD_TYPE=debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_XMPP_PLUGIN=ON \
        -DWEB_ARTICLE_VIEWER_WEBENGINE=OFF
  make
}

package_rssguard-git() {
  depends=(qt6-webengine qt6-multimedia qxmpp mpv)
  provides=($_pkgbase)
  conflicts=($_pkgbase{,-nowebengine} rss-guard{,-git})
  cd build
  make DESTDIR="${pkgdir}" install
}

package_rssguard-nowebengine-git() {
  pkgdesc+='. Variant without Qt WebEngine support.'
  depends=(qt6-multimedia qxmpp mpv)
  provides=($_pkgbase-nowebengine)
  conflicts=($_pkgbase{,-nowebengine})
  cd build-nowebengine
  make DESTDIR="${pkgdir}" install
}
