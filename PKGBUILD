# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=wenger-pptpd

pkgver=1.4.1
pkgrel=1

pkgdesc="Poptop server from Wenger Binning"
arch=(x86_64)
url="http://poptop.sourceforge.net/"
license=('GPL')

source=(
  "$pkgname::git+https://git.code.sf.net/p/poptop/git#commit=b77d92c025992b246083142587f3c3b5f115832d"
  pptpd.service
  0001-Fixed-make-install-issue.patch
)

sha256sums=(
  'SKIP'
  'c9ba10acd0db041da079f1e3376b65f2f867b90b458a13ff228bfc76c05eb325'
  'SKIP'
)

conflicts=( "pptpd" )

makedepends=('git')
depends=('ppp')

backup=(etc/pptpd.conf)

build() {
  local _pppver=`pacman -Q ppp`
  _pppver=${_pppver%-*}
      _pppver=${_pppver#ppp }

  cd "$srcdir"/$pkgname
  sed -i "s|#define VERSION.*|#define VERSION \"${_pppver}\"|" plugins/patchlevel.h
  patch -p1 < "$srcdir/0001-Fixed-make-install-issue.patch"

  #
  autoreconf -i
  
  #
  ./configure \
    --prefix=/usr
  #
  make
}

package() {
  cd "$srcdir"/$pkgname
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/etc/
  echo -e "# Read man pptpd.conf, see samples in /usr/share/doc/pptpd\n# and write your pptpd configuration here" >"$pkgdir"/etc/pptpd.conf
  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  mkdir -p "$pkgdir"/usr/share/doc/pptpd
  cp -a samples "$pkgdir"/usr/share/doc/pptpd/
}
