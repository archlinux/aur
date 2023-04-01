# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=non-daw
pkgname=(non-mixer non-timeline)
pkgver=1.3.0
pkgrel=5
pkgdesc="Non DAW"
arch=(x86_64)
url="https://non.tuxfamily.org/"
license=(GPL3)
groups=(
  non-daw
  pro-audio
)
makedepends=(
  jack
  ladspa
  liblo
  liblrdf
  libsndfile
  libxpm
  ntk
  waf
)
source=(https://github.com/linuxaudio/non/archive/${pkgname[0]}-v$pkgver/non-${pkgname[0]}-v$pkgver.tar.gz)
sha512sums=('6be7075a1c55fa52ae573c60983cbd237819f8ec521730b3949b0d460c63a23805db7a9f5d54410b5808c61ecdd6ec9dc891868ae8f9467042621379633b119e')
b2sums=('3116892847c41b097aa48af4bb96a2580e53fa879793992c07d0086841f4d1e8c13e0b390e0ae1854ab5da58a8fee8f6d7b9338a94fc4367250b5d69efa2f23e')

prepare() {
  sed -e 's/python2/python/' -i non-${pkgname[0]}-v$pkgver/timeline/bin/import-ardour-session
  mv -v non-${pkgname[0]}-v$pkgver ${pkgname[0]}-$pkgver
  cp -av ${pkgname[0]}-$pkgver ${pkgname[1]}-$pkgver
}

build() {
  export LINKFLAGS="$LDFLAGS"
  (
    cd ${pkgname[0]}-$pkgver
    waf configure --prefix=/usr --project=mixer --disable-native-cpu-optimization
    waf build -vv
  )
  (
    cd ${pkgname[1]}-$pkgver
    waf configure --prefix=/usr --project=timeline --disable-native-cpu-optimization
    waf build -vv
  )
}

package_non-mixer() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Mixer"
  depends=(
    gcc-libs
    glibc
    hicolor-icon-theme
    jack libjack.so
    liblo liblo.so
    liblrdf liblrdf.so
    ntk libntk.so libntk_images.so
  )

  cd $pkgname-$pkgver
  waf --destdir="$pkgdir" install -vv
}

package_non-timeline() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Timeline arranger"
  depends=(
    cairo
    gcc-libs
    glibc
    hicolor-icon-theme
    jack libjack.so
    liblo liblo.so
    libsndfile libsndfile.so
    ntk libntk.so libntk_images.so
  )
  optdepends=('python: For import-ardour-session')

  cd $pkgname-$pkgver
  waf --destdir="$pkgdir" install -vv
  # the wscript installs import-ardour-session to a wrong location:
  # https://github.com/original-male/non/issues/256
  mv -v "$pkgdir/usr/bin/bin/import-ardour-session" "$pkgdir/usr/bin/import-ardour-session"
  rmdir -v "$pkgdir/usr/bin/bin"
}
