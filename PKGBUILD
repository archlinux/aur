# Maintainer: Giovanni Harting

pkgname=zwavejs2mqtt-git
pkgver=v5.10.0.r0.3538a6e1
pkgrel=1
pkgdesc="Zwave to Mqtt gateway and Control Panel Web UI."
arch=('any')
url="https://github.com/zwave-js/zwavejs2mqtt"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(nodejs)
makedepends=(yarn node-gyp git)
backup=("etc/zwavejs2mqtt/app.ts")
source=("git+https://github.com/zwave-js/zwavejs2mqtt.git"
	"${pkgname%-git}.sysusers"
	"${pkgname%-git}.tmpfiles"
	"${pkgname%-git}.service")
b2sums=('SKIP'
        'd4a834bd7c8e4c832128f9f9c0ffb9d4409424402ba9c28a430a2d41d19cf780ba606c27b5f3b71f7640caa9883724647f2779cfa3cf2714564eb5e58b6144e2'
        '2324c50252e1005b1ec06bf73e9d05937472397f5fc533e7ab468d416bcb6b5d01b87055a41d3b3a5b44b24e02ca45fafb5f79085833988ec458ee72c1d8c31b'
        '0e7238f3858a9ce4b21e2c3493079648adbe1885ed32d1ae666b8a79f5b4c6c0d59c572a81159fc75c8db6a2a8f716b221a7ea857866462bb2d2a4b537c93ae7')

pkgver() {
        cd "$srcdir/${pkgname%-git}"

        printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  #cd "$pkgname-$pkgver"
  yarn install
  yarn run build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  #cd "$pkgname-$pkgver"

  install -d "$pkgdir"/usr/share/webapps/${pkgname%-git}/dist/static "$pkgdir"/etc/${pkgname%-git}/
  cp -r {node_modules,bin,lib,server,app.ts,views} "$pkgdir"/usr/share/webapps/${pkgname%-git}
  cp -r dist/static/* "$pkgdir"/usr/share/webapps/${pkgname%-git}/dist/static
  cp -r config/* "$pkgdir"/etc/${pkgname%-git}/
  ln -s /etc/${pkgname%-git}/ "$pkgdir"/usr/share/webapps/${pkgname%-git}/config
  ln -s /var/lib/${pkgname%-git} "$pkgdir"/usr/share/webapps/${pkgname%-git}/store
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "${srcdir}"/${pkgname%-git}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname%-git}.conf
  install -Dm644 "${srcdir}"/${pkgname%-git}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname%-git}.conf
  install -Dm644 "${srcdir}"/${pkgname%-git}.service -t "${pkgdir}"/usr/lib/systemd/system/
}
