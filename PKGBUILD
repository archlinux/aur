# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=whosonfirst-sqlite-features-index
_pkgname="go-${pkgname}"
pkgver=2.2.1
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
  '15fa3a0a1c0780ecdc9b90337b65653f3c3196a4e189b1225c2014398d933aadccc2a9e5e739b5b0dc5d128c83cf650f840b7222cb7beab0bded66599a11d7ac'
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
