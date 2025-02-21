# Maintainer: Baorui Xi <i@izm.im>

pkgname='openvpn-auth-oauth2'
_name='auth-oauth2'
pkgver='1.22.7'
pkgrel='2'
pkgdesc='A plugin/management interface client for OpenVPN server to handle an OIDC based single sign-on (SSO) auth flows'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/jkroepke/openvpn-auth-oauth2'
license=('MIT')
depends=('openvpn')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" "config.yaml" "openvpn-auth-oauth2.service" "openvpn-auth-oauth2.env" "openvpn-auth-oauth2.conf" "package.patch")
sha256sums=('d14af4d68bbebe41611efe47127c1d44a61b51498c0cdec662cc35bf97c38ee9'
            '3e8906b94c9586a55670dec373ed72fba405cbde0296db0a95aa2fa5728f4724'
            '9ecd0f74d0292120937d39411a3a829ec7983f7c96022f971b5e173affbd666c'
            'de967f8fd8bacc904e5de610ebd1c5c54420634e3c52c500ef27c51bd605d41c'
            'ebb2844776c99523342f1e5fb1de707e8e6b104b474e26574dd2d8944af8af78'
            '4a181a11b13732118d59319eac3a8e922b5f967d6ed7df677abcaf544e5e3791')
makedepends=('go')

prepare() {
    patch -d $pkgname-$pkgver -Np1 -i ../package.patch
}

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    install -Dm755 "$pkgname-$pkgver/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm640 "config.yaml" "$pkgdir/etc/openvpn-auth-oauth2/config.yaml"
    install -Dm644 "openvpn-auth-oauth2.service" "$pkgdir/usr/lib/systemd/system/openvpn-auth-oauth2.service"
    install -Dm644 "openvpn-auth-oauth2.env" "$pkgdir/etc/sysconfig/openvpn-auth-oauth2"
    install -Dm644 "openvpn-auth-oauth2.conf" "$pkgdir/usr/lib/sysusers.d/openvpn-auth-oauth2.conf"
}
