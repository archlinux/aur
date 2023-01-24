# Maintainer: Gökberk Yaltıraklı <aur at gkbrk dot com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=aerc-git
_pkgname=aerc
pkgver=0.14.0.r24.g276c30f
pkgrel=1
pkgdesc='Email Client for your Terminal'
arch=('x86_64')
url='https://aerc-mail.org/'
license=('MIT')
depends=('notmuch')
makedepends=('go' 'git' 'scdoc')
optdepends=('w3m: html viewer support' 'dante: proxy support')
provides=('aerc')
conflicts=('aerc')
source=(
	"${_pkgname}::git+https://git.sr.ht/~rjarry/${_pkgname}"
	"makefile-fix.patch"
)
sha512sums=(
	'SKIP'
	'e8fe0511ecc5b80367a3580ce85d868a3008b8d2ca083b7f8293c28bb76c02f42828c17e59dad9c62f092243158b80e02301e569b5c51541fe97e99414daaea0'
)
options=('!buildflags')

pkgver () {
    cd "${srcdir}/${_pkgname}"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare () {
    cd "${srcdir}/${_pkgname}"
    git apply "${srcdir}/makefile-fix.patch"
}

build () {
    cd "${srcdir}/${_pkgname}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw -tags=notmuch"
    make PREFIX=/usr VERSION="${pkgver}" all
}

package () {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/aerc/"
}
