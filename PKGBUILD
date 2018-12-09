
# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

_pkgname=slic3r-prusa3d
pkgname=${_pkgname}
pkgver=1.41.2
pkgrel=1
pkgdesc="Updated Slic3r by Prusa3D with many bugfixes and new features"
arch=('i686' 'x86_64')
url="http://www.prusa3d.com/"
license=('AGPL3')
depends=('boost-libs' 'curl' 'glew' 'intel-tbb' 'nlopt' 'perl' 'perl-class-accessor' 'perl-libwww' 'perl-encode-locale'
         'perl-moo' 'perl-opengl' 'perl-sub-quote' 'perl-wx-glcanvas')
makedepends=('boost' 'cmake' 'eigen' 'expat' 'git' 'gtest' 'leatherman' 'perl-alien-wxwidgets' 'perl-devel-checklib' 'perl-extutils-cppguess'
             'perl-extutils-typemaps-default' 'perl-module-build-withxspp' 'qhull')
checkdepends=('perl-io-stringy' 'perl-local-lib')
optdepends=('perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-net-bonjour: support for autodiscovery of printers on network (octoprint)'
            'perl-class-xsaccessor: creating faster accessor methods')
source=("git+https://github.com/prusa3d/Slic3r.git#tag=version_${pkgver}"
        "Move-Slic3r-data-to-usr-share-slic3r.patch"
        "https://raw.githubusercontent.com/PointCloudLibrary/pcl/79c184cc4dbe82d296bb37390064e4a0149234ec/cmake/Modules/FindQhull.cmake"
        'slic3r.desktop')
md5sums=('SKIP'
         'aceb830f2fbe12ef5659e73164ea733b'
         '60163025c9bd3d80f2d51a9566f1deab'
         '1941c1ede2f03774ffb77f68a7c33572')

prepare() {
  cd "${srcdir}/Slic3r"
  patch -p1 -i "$srcdir/Move-Slic3r-data-to-usr-share-slic3r.patch"
  mkdir -p build
}

build() {
  cd "${srcdir}/Slic3r"
  
  # Moved this here from prepare(). Because prepare() runs before pkgver() we always set the wrong version.
  sed -i "s/define SLIC3R_VERSION .*/define SLIC3R_VERSION \"$pkgver\"/" xs/src/libslic3r/libslic3r.h

  cd build
  cmake -DSLIC3R_STATIC=0 \
        -DSLIC3R_PROFILE=0 \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        ..
  sed -i "s|$srcdir/Slic3r|../..|g" xs/main.xs
  make
}

check() {
  cd "${srcdir}/Slic3r/build"
  sed -i 's/\/usr\/bin\/prove/prove/g' CTestTestfile.cmake
  sed -i 's/"\/usr\/bin\/perl"//g' CTestTestfile.cmake
  ctest -V
}

package () {
  cd "$srcdir/Slic3r/build"
  make DESTDIR="$pkgdir" install

  cd "${srcdir}/Slic3r"

  # ZSH autocompletion
  install -Dm 0644 "utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  # Resources
  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -R resources/* "$pkgdir/usr/share/${_pkgname}/"

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/slic3r.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Desktop icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{128x128,192x192}/apps/
  ln -s "/usr/share/${_pkgname}/icons/Slic3r_128px.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/${_pkgname}/icons/Slic3r_192px.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}
