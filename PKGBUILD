# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on s3backer-git PKGBUILD by: DuckSoft <realducksoft@gmail.com>

pkgname='s3backer-nbd-git'
pkgver=2.1.1.r5.gb3db142
pkgrel=1
pkgdesc="FUSE-based single file backing store via Amazon S3 (with NBD support)"
arch=('x86_64')
provides=('s3backer')
conflicts=('s3backer')
url="https://github.com/archiecobbs/s3backer"
license=('GPL')
depends=('fuse2' 'curl' 'expat' 'openssl' 'zlib' 'nbdkit' 'nbd')
source=("$pkgname::git+https://github.com/archiecobbs/s3backer" "${pkgname%%-git}.tmpfiles")
sha512sums=('SKIP'
            '6b40732b4ff869af195b260fd14ced0af07787d0400ada41fde39249a280a1074079f2517c160d936fb13f2676fa138a27fbc15eff21d517b3a866d4a6f85406')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  set -e
  . ./cleanup.sh
  mkdir m4
  autoreconf -iv
  ./configure --prefix="/usr" NBDKIT_PLUGINDIR="/usr/lib/nbdkit/plugins/"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" install

  pushd "${pkgdir}" >/dev/null
  rmdir -p "run/${pkgname%%-git}"
  popd >/dev/null
  install -Dm644 "$srcdir"/"${pkgname%%-git}".tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/"${pkgname%%-git}".conf
}
