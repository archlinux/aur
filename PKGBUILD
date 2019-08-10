# Maintainer: Clar Fon <them@lightdark.xyz>
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='facette'
pkgver='0.5.1'
pkgrel='1'
pkgdesc='Facette is a software to display time series data from several various sources'
arch=('i686' 'x86_64')
url='http://facette.io/'
license=('BSD')
depends=('rrdtool')
makedepends=('pkg-config' 'go' 'nodejs' 'yarn' 'pandoc')
provides=('facette')
backup=('etc/facette/facette.yaml')
source=(
  "https://github.com/facette/facette/archive/$pkgver.tar.gz"
  'facette.sysusers'
  'facette.tmpfiles'
)
noextract=()
sha256sums=(
  'b206ef09b1333fd55b7db22f88d30e7833ce049691b69850c25c5a00bf493128'
  'ed3435a7069106c360dcf77cf4b4bd5df1d51ed8df4071ac8b8453de4cf1181d'
  '5e395e0a668b19739ffd41939c8e2258c2205e597d5ec55517d27aa117bdc222'
)
_prefix='/usr'

build() {
  mkdir -p "$srcdir/go"
  GOPATH="$srcdir/go" go get github.com/jteeuwen/go-bindata/...

  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "debian/patches/001_paths.patch"
  PATH="$PATH:$srcdir/go/bin" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=${pkgdir}/${_prefix} install

  # create target directory structure
  install -d -m755 ${pkgdir}/etc/facette
  install -d -m750 ${pkgdir}/var/{log,lib,cache}/facette

  # default config
  cp docs/examples/facette.yaml ${pkgdir}/etc/facette

  # copy systemd files
  install -D -m644 debian/facette.service $pkgdir/usr/lib/systemd/system/facette.service
  install -D -m644 ../facette.sysusers $pkgdir/usr/lib/sysusers.d/facette.conf
  install -D -m644 ../facette.tmpfiles $pkgdir/usr/lib/tmpfiles.d/facette.conf
}
