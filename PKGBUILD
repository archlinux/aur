pkgname=nsdiff
pkgver=1.82
pkgrel=2
pkgdesc="Create an 'nsupdate' script from DNS zone file differences"
url="https://dotat.at/prog/nsdiff/"
license=(CC0-1.0)
arch=(any)
depends=(
  bind          # named-compilezone
  bind-tools    # dig, nsupdate
  perl
)
provides=(
  nspatch=$pkgver
  nsvi=$pkgver
  perl-dns-nsdiff=$pkgver
)
options=(!emptydirs)
source=("https://dotat.at/prog/nsdiff/DNS-nsdiff-$pkgver.tar.gz"
        0001-nsvi-forward-g-to-nsupdate.patch
        0002-nsvi-g-documentation.patch
        0003-nsdiff-only-bump-the-serial-number-when-required.patch)
sha256sums=('9e37c68be73179a5e52f946c472930c1401b27fbd3a5bde9199070fd6926d418'
            'ddf92ddace522ee1410a71b8f88a8d058c0886c6804155aa83c13ce1d4c55ad7'
            'a65c042dcace11a03de1018e885754038ace824e1601547390c32dcb31dd40de'
            'cac4a4d84020bd9bc1b03bcfb4eba91fe82ac6b3968751d00c848019393fad18')
#_commit=f2979fd03bbede624709700dfb65b26d94a0f2f2 # 1.81
#source=("git+https://github.com/fanf2/nsdiff.git#commit=$_commit")
#source=("git+https://git.uis.cam.ac.uk/x/uis/ipreg/nsdiff.git=$_commit")
#sha256sums=('SKIP')

prepare() {
  cd DNS-nsdiff-$pkgver
  patch -Np1 < ../0001-nsvi-forward-g-to-nsupdate.patch
  patch -Np1 < ../0002-nsvi-g-documentation.patch
  patch -Np1 < ../0003-nsdiff-only-bump-the-serial-number-when-required.patch
}

build() {
  cd DNS-nsdiff-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd DNS-nsdiff-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
