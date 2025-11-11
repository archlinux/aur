# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=oauth2-proxy-bin
pkgver=7.13.0
pkgrel=1
pkgdesc="A reverse proxy and static file server that provides authentication using Providers (Google, Keycloak, GitHub and others) to validate accounts by email, domain or group."
arch=("x86_64")
url="https://github.com/oauth2-proxy/oauth2-proxy"
license=("MIT")
source=("$_pkgname::git+$_url.git#branch=$_branch")
source=("oauth2-proxy-${pkgver}.tar.gz::https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v${pkgver}/oauth2-proxy-v${pkgver}.linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/refs/heads/master/LICENSE"
        "oauth2-proxy.service::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/refs/heads/master/contrib/oauth2-proxy.service.example"
        "oauth2-proxy.cfg::https://raw.githubusercontent.com/oauth2-proxy/oauth2-proxy/refs/heads/master/contrib/oauth2-proxy.cfg.example")
provides=("oauth2-proxy")
conflicts=("oauth2-proxy")
backup=("etc/oauth2-proxy.cfg")

sha512sums=('904e108376ac97520cb7b71123c561efdaec8e5e1257603ece8a17894b78936ea8653c1028ce92324b95d7b4afe0ee2383501542cc39a00535f5e31b3cf1f27d'
            'e2f593cf01c162b5ea4a177dc69e8aaed9da5d98fcd8912944e352d4656468e73de28b039943ebd1996552dd1fa5bd4243b170ae22567e3b2523f47b2466ba9c'
            'eb61d30f5098c9c689df91c45194a85485de3794c0a976e9d4ddbd173a1718f573446e3d139800b8db6f931fbbce779913732382e09ecf849a0f073046eda350'
            'fb95bf4f0bb32289b2d27847fb8936fafad55f5fb87f0b7481c96f324ea697ac01a1cd33b19275674abac6558d4bcba9af2e8c4e623a35fe738e99938278da3f')
prepare() {
  sed -i -e 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' -e 's/www-data/http/' -e '/^#/d' "oauth2-proxy.service"
}
package() {
  install -Dm755 "${srcdir}/oauth2-proxy-v${pkgver}.linux-amd64/oauth2-proxy" "$pkgdir/usr/bin/oauth2-proxy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "oauth2-proxy.cfg" "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 "oauth2-proxy.service" "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
