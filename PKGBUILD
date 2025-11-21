# Maintainer: 0xbbuddha <killian@archimedeos.org>

pkgname=bashhound-ce-git
_pkgname=${pkgname%-git}
pkgver=r2.b2e044d
pkgrel=1
pkgdesc="Active Directory data collector for BloodHound written in Bash"
arch=('any')
url="https://github.com/0xbbuddha/BashHound-CE"
license=('MIT')
depends=('bash' 'openssl' 'jq' 'vim' 'zip' 'coreutils')
makedepends=('git')
provides=('bashhound-git')
conflicts=('bashhound-git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    
    sed -i 's|^SCRIPT_DIR=.*|SCRIPT_DIR="/usr/lib/bashhound-ce"|' bashhound-ce    
    sed -i 's|^LIB_DIR=.*|LIB_DIR="/usr/lib/bashhound-ce/lib"|' lib/collectors.sh
    sed -i 's|^LIB_DIR=.*|LIB_DIR="/usr/lib/bashhound-ce/lib"|' lib/ldap.sh
}

package() {
    cd "$srcdir/${_pkgname}"
    
    install -Dm755 bashhound-ce "$pkgdir/usr/bin/bashhound-ce"
    
    install -Dm644 lib/acl_parser.sh "$pkgdir/usr/lib/bashhound-ce/lib/acl_parser.sh"
    install -Dm644 lib/asn1.sh "$pkgdir/usr/lib/bashhound-ce/lib/asn1.sh"
    install -Dm644 lib/collectors.sh "$pkgdir/usr/lib/bashhound-ce/lib/collectors.sh"
    install -Dm644 lib/export_ce.sh "$pkgdir/usr/lib/bashhound-ce/lib/export_ce.sh"
    install -Dm644 lib/ldap_parser.sh "$pkgdir/usr/lib/bashhound-ce/lib/ldap_parser.sh"
    install -Dm644 lib/ldap.sh "$pkgdir/usr/lib/bashhound-ce/lib/ldap.sh"
    
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
