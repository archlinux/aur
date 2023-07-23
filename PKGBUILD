# Maintainer: Sieve Lau <sievelau@gmail.com>
# Contributor: Sherlock-Holo <sherlockya@gmail.com> 
pkgname=dns-over-https-git
pkgver=r346.32f3ad7
pkgrel=1
pkgdesc="Client and server software to query DNS over HTTPS, using Google DNS-over-HTTPS protocol"
url="https://github.com/m13253/dns-over-https"
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/m13253/dns-over-https"
        "dns-over-https.patch")
backup=('etc/dns-over-https/doh-client.conf'
        'etc/dns-over-https/doh-server.conf')
md5sums=('SKIP'
         '085b6f2ffbc847204a09d119b51dcaab')

pkgver(){
        cd $srcdir/${pkgname%-git}
        ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
        )
}

prepare(){
        cd "$srcdir/${pkgname%-git}"
        git apply "$srcdir/${pkgname%-git}.patch"
}

build(){
        cd "$srcdir/${pkgname%-git}"
        make
}

package(){
        cd "$srcdir/${pkgname%-git}"
        make DESTDIR="$pkgdir/" install
}
