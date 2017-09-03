# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

_pkgname=slic3r-prusa3d
pkgname=${_pkgname}-git
pkgver=1.37.0.r39.g247070cd
pkgrel=2
pkgdesc="Updated Slic3r by Prusa3D with many bugfixes and new features"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="http://www.prusa3d.com/"
license=('AGPL3')
depends=('boost-libs' 'perl' 'perl-class-accessor' 'perl-libwww' 'perl-encode-locale'
         'perl-moo' 'perl-opengl' 'perl-wx-glcanvas')
makedepends=('boost' 'git' 'perl-alien-wxwidgets' 'perl-devel-checklib' 'perl-extutils-cppguess'
             'perl-extutils-typemaps-default' 'perl-module-build-withxspp')
checkdepends=('perl-io-stringy' 'perl-local-lib')
optdepends=('perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-net-bonjour: support for autodiscovery of printers on network (octoprint)'
            'perl-class-xsaccessor: creating faster accessor methods')
conflicts=('slic3r-prusa3d')
source=("git+https://github.com/prusa3d/Slic3r.git"
        "Move-Slic3r-data-to-usr-share-slic3r.patch"
        'slic3r.desktop')
md5sums=('SKIP'
         'a8f234adc154ad4c59ab03f8acc78eed'
         '1941c1ede2f03774ffb77f68a7c33572')

prepare() {
  cd "${srcdir}/Slic3r"
  patch -p1 -i "$srcdir/Move-Slic3r-data-to-usr-share-slic3r.patch"
  mkdir -p build
}

pkgver() {
  cd "${srcdir}/Slic3r"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

build() {
  cd "${srcdir}/Slic3r"
  
  # Moved this here from prepare(). Because prepare() runs before pkgver() we always set the wrong version.
  sed -i "s/define SLIC3R_VERSION .*/define SLIC3R_VERSION \"$pkgver\"/" xs/src/libslic3r/libslic3r.h
  
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        ..
  make
}

check() {
  cd "${srcdir}/Slic3r/build"
  ctest -V
}

package () {
  cd "$srcdir/Slic3r/build"
  make DESTDIR="$pkgdir" install

  cd "${srcdir}/Slic3r"

  # ZSH autocompletion
  install -Dm 0644 "utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/slic3r.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Desktop icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{128x128,192x192}/apps/
  ln -s "/usr/share/${_pkgname}/Slic3r_128px.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/${_pkgname}/Slic3r_192px.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
}

