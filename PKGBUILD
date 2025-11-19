# Maintainer: 0xbbuddha <killian@archimedeos.org>

pkgname=bashhound-git
_pkgname=${pkgname%-git}
pkgver=r6.f5500dd
pkgrel=1
pkgdesc="Active Directory data collector for BloodHound written in Bash"
arch=('any')
url="https://github.com/0xbbuddha/BashHound"
license=('MIT')
depends=('bash' 'openssl' 'jq' 'vim' 'zip' 'coreutils')
makedepends=('git')
provides=('bashhound')
conflicts=('bashhound')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    
    sed -i 's|^SCRIPT_DIR=.*|SCRIPT_DIR="/usr/lib/bashhound"|' bashhound    
    sed -i 's|^LIB_DIR=.*|LIB_DIR="/usr/lib/bashhound/lib"|' lib/collectors.sh
    sed -i 's|^LIB_DIR=.*|LIB_DIR="/usr/lib/bashhound/lib"|' lib/ldap.sh
}

package() {
    cd "$srcdir/${_pkgname}"
    
    install -Dm755 bashhound "$pkgdir/usr/bin/bashhound"
    
    install -Dm644 lib/acl_parser.sh "$pkgdir/usr/lib/bashhound/lib/acl_parser.sh"
    install -Dm644 lib/asn1.sh "$pkgdir/usr/lib/bashhound/lib/asn1.sh"
    install -Dm644 lib/collectors.sh "$pkgdir/usr/lib/bashhound/lib/collectors.sh"
    install -Dm644 lib/export.sh "$pkgdir/usr/lib/bashhound/lib/export.sh"
    install -Dm644 lib/ldap_parser.sh "$pkgdir/usr/lib/bashhound/lib/ldap_parser.sh"
    install -Dm644 lib/ldap.sh "$pkgdir/usr/lib/bashhound/lib/ldap.sh"
    
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
