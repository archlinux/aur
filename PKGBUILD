# Maintainer: Clar Fon <them@lightdark.xyz>
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='facette'
pkgver='0.5.0'
pkgrel='2'
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
  'latest.patch'
)
noextract=()
sha256sums=(
  '3d54db16127b50a55df7677aa3395524d5f53a2fe57b5616e6dc2c8db71b0316'
  'ed3435a7069106c360dcf77cf4b4bd5df1d51ed8df4071ac8b8453de4cf1181d'
  '5e395e0a668b19739ffd41939c8e2258c2205e597d5ec55517d27aa117bdc222'
  '5302d6ebcdbafe7b090dff42edf7eec9b579da6018623d8583914614c5b0db82'
)
_prefix='/usr'

build() {
  mkdir -p "$srcdir/go"
  GOPATH="$srcdir/go" go get github.com/jteeuwen/go-bindata/...

  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/latest.patch"
  patch -p1 < "debian/patches/001_paths.patch"
  PATH="$PATH:$srcdir/go/bin" make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=${pkgdir}/${_prefix} install

  # create target directory structure
  install -d -m755 ${pkgdir}/{etc,var/{lib,cache}}/facette
  install -d -m750 ${pkgdir}/var/log/facette

  # default config
  cp docs/examples/facette.yaml ${pkgdir}/etc/facette

  # copy systemd files
  install -D -m644 debian/facette.service $pkgdir/usr/lib/systemd/system/facette.service
  install -D -m644 ../facette.sysusers $pkgdir/usr/lib/sysusers.d/facette.conf
  install -D -m644 ../facette.tmpfiles $pkgdir/usr/lib/tmpfiles.d/facette.conf
}
