# Maintainer: Elisamuel Resto <sam@samresto.dev>

# This must be built against the version of dovecot being used,
# otherwise it will fail to load and thus work.
# Specify the version of dovecot to be used here:
_dcpkgver=2.3.18
# Make sure to bump pkgrel if changing this.

pkgname=dovecot-fts-flatcurve
pkgver=r335.452ae0f
pkgrel=1
pkgdesc="Dovecot FTS Flatcurve plugin (Xapian)"
arch=('x86_64')
url="https://github.com/slusarz/dovecot-fts-flatcurve"
license=('LGPL2.1')
depends=("dovecot=${_dcpkgver}" 'icu' 'xapian-core')
install="$pkgname.install"
sha256sums=('SKIP')

source=("git+https://github.com/slusarz/$pkgname.git"
        "$pkgname.install")

sha256sums=('SKIP'
            '4bdbf8780b5c7ce2040a08f175195ec2cdab536407e0d3454fbd6f2eb1101cc0')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-dovecot=/usr/lib/dovecot

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
