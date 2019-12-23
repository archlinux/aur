# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.4.2
pkgrel=4
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=('x86_64')
url="https://drobilla.net/software/ganv/"
license=('GPL3')
depends=('atk' 'cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'glibmm' 'graphviz' 'gtk2' 'gtkmm'
'libfreetype.so' 'pango')
makedepends=('waf')
provides=('libganv-1.so')
source=("https://download.drobilla.net/ganv-$pkgver.tar.bz2"
        "wscript::https://git.drobilla.net/cgit.cgi/ganv.git/plain/wscript?id=c4e5940f935b1ac4b152aa7a1311012791f073ae"
        "autowaf.py::https://git.drobilla.net/cgit.cgi/autowaf/plain/extras/autowaf.py?id=8280f9de69f93624896b8875caf039066cac0314")
sha512sums=('0609dea81cceb0c560286ad2f132f318c2d583af5163dcea4511155e78a022248dcb7ae535233493bdf906fb036422ebd4368d688123f3e1676c4e0398cbc6c2'
            'd51f80e38bc831b375db71f797758289c53ceb0fb13607fe0296e7bf57eb3bdc2869db1072e56fe95671dcc2e1d4d8df2e6efbff0e5aab6455e0c98ad2d629b2'
            '8b657954fc435b1c8768c877e9f5ffb5a8ef3cbfa1b63ad841f1ae1442da97b10557740b73f736bb57c05b0e85592b3f866ca1b456c66fbc9092e23bdcd58756')

prepare() {
  cd "$pkgname-$pkgver"
  # copy more current versions of custom waf scripts in place
  mkdir -pv tools
  cp -av ../autowaf.py tools/
  touch __init__.py
  # copy more current version of wscript in place
  cp -av ../wscript .
  # modify wscript to use current scripts and fix version
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/" \
      -i wscript
  sed -E "s|(GANV_VERSION       =) .+|\1 '${pkgver}'|" -i wscript
}

build() {
  cd "${pkgname}-${pkgver}"
  waf configure -v --prefix=/usr
  waf build -v
}

package() {
  cd "${pkgname}-${pkgver}"
  waf install -v --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
