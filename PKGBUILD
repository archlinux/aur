# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=whosonfirst-sqlite-features-index
_pkgname="go-${pkgname}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Go package for indexing Who’s On First features in SQLite databases"
arch=('x86_64')
url='https://github.com/whosonfirst/go-whosonfirst-sqlite-features-index'
license=('BSD-3-Clause')
depends=('glibc' 'icu')
makedepends=('go')
checkdepends=('sqlite')
options=('!debug')

source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/whosonfirst/go-whosonfirst-sqlite-features-index/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '7f23fdfdff1b56f02f3c75e45c883875450d5c65289431b53ff980ef080f4a8703abfae2cd8e5c75b71c5879c32f7000e2262d9a5355de4773eef88dd3c1944d'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # shellcheck disable=SC2016  # Second expression is not meant to be expanded
  sed -i \
    -e 's/^\(LDFLAGS\).*/\1='"${LDFLAGS}"'/' \
    -e 's/\(-ldflags\)="\(\$(LDFLAGS)\)"/\1="-linkmode external -extldflags \\"\2\\""/' \
    Makefile
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  make cli
}

check() {
  cd "$(mktemp -d)"
  "${srcdir}/${_pkgname}-${pkgver}/bin/wof-sqlite-index-features" \
    -all -database-uri modernc://cwd/test.db \
    "${srcdir}/${_pkgname}-${pkgver}/fixtures"
  if [ "$(sqlite3 test.db 'SELECT name FROM spr')" != 'Montreal' ]; then
    echo >&2 'Unexpected test results:'
    sqlite3 test.db '.dump spr' >&2
    exit 1
  fi
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  echo >&2 'Packaging the executables'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    'bin/wof-sqlite-index-features'{,-mattn}

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
