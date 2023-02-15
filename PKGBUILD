# Maintainer: Moritz Poldrack <moritz@poldrack.dev>
# Contributor: Gökberk Yaltıraklı <aur at gkbrk dot com>
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
	'aa374d17c4e704ec9adf696db547e6c8bdd4b13cacc4d0dbeb4010a687e3ad14db3ae8dfee1fd588ed004fcb21b871b8f2f967c38e93765750e32f31f3b2553b'
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
    export LDFLAGS="${LDFLAGS} -Wl,-z,relro,-z,now"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw -tags=notmuch"
    make PREFIX=/usr LIBEXECDIR=/usr/lib/aerc VERSION="${pkgver}" all
}

package () {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr LIBEXECDIR=/usr/lib/aerc DESTDIR=$pkgdir install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/aerc/"
}
