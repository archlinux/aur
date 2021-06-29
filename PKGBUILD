# Maintainer: Giovanni Harting

pkgname=zwavejs2mqtt
pkgver=5.2.0
pkgrel=2
pkgdesc="Zwave to Mqtt gateway and Control Panel Web UI."
arch=(x86_64)
url="https://github.com/zwave-js/zwavejs2mqtt"
license=('MIT')
depends=(nodejs)
makedepends=(yarn node-gyp)
backup=("etc/zwavejs2mqtt/app.ts")
source=("https://github.com/zwave-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname.service")
b2sums=('d9e6c8e0a9e473a2ebf2c7ce2509be0dcc3d7a1bc25a2ca54cdfc99af00c03cdeece603d046777827e94ef72901bd53b96d5ccd9d1d4589ababe2ad695b13008'
        'd4a834bd7c8e4c832128f9f9c0ffb9d4409424402ba9c28a430a2d41d19cf780ba606c27b5f3b71f7640caa9883724647f2779cfa3cf2714564eb5e58b6144e2'
        '2324c50252e1005b1ec06bf73e9d05937472397f5fc533e7ab468d416bcb6b5d01b87055a41d3b3a5b44b24e02ca45fafb5f79085833988ec458ee72c1d8c31b'
        '48f4a894227918086b7a55a1d20a94cff08088552c7d655a24cddd92e76e74e19cefd4cd7abeb744c0e254bef36cf9e79442dc56c2006ec6a6e94e005a0e906f')

build() {
  cd "$pkgname-$pkgver"
  yarn install
  yarn run build
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/share/webapps/$pkgname/dist/static "$pkgdir"/etc/$pkgname/ "$pkgdir"/var/lib/$pkgname
  cp -r {node_modules,bin,lib,server,app.ts} "$pkgdir"/usr/share/webapps/$pkgname
  cp -r dist/static/* "$pkgdir"/usr/share/webapps/$pkgname/dist/static
  cp -r config/* "$pkgdir"/etc/$pkgname/
  ln -s /etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/config
  ln -s /var/lib/$pkgname "$pkgdir"/usr/share/webapps/$pkgname/store
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "${srcdir}"/$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}
