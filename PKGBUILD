# Maintainer: Giovanni Harting

pkgname=zwavejs2mqtt
pkgver=4.5.0
pkgrel=1
pkgdesc="Zwave to Mqtt gateway and Control Panel Web UI."
arch=(x86_64)
url="https://github.com/zwave-js/zwavejs2mqtt"
license=('MIT')
depends=(nodejs)
makedepends=(yarn node-gyp)
backup=()
source=("https://github.com/zwave-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname.service")
b2sums=('e631e41d83dd89ac6cd11f9ed91af4fdb0412b5d0403f9f31ba8ae96462e4d3d02bac0506864435990b325a2a78bb08b7d9b005987fe98b7a93f20dddd63d81e'
        'd4a834bd7c8e4c832128f9f9c0ffb9d4409424402ba9c28a430a2d41d19cf780ba606c27b5f3b71f7640caa9883724647f2779cfa3cf2714564eb5e58b6144e2'
        '2324c50252e1005b1ec06bf73e9d05937472397f5fc533e7ab468d416bcb6b5d01b87055a41d3b3a5b44b24e02ca45fafb5f79085833988ec458ee72c1d8c31b'
        '88af5d6d6ed94f2946f3ed0ceefd16eb548009afce02abf1af399637226b61d810147f1f3ff395a569f9de82b54769299bb78482799b6395335b587e8b83a402')

build() {
  cd "$pkgname-$pkgver"
  yarn install
  yarn run build
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/share/webapps/$pkgname "$pkgdir"/etc/$pkgname/ "$pkgdir"/usr/bin
  cp -r {node_modules,bin,lib,dist/static} "$pkgdir"/usr/share/webapps/$pkgname
  cp -r config/* "$pkgdir"/etc/$pkgname/
  ln -s /usr/share/webapps/$pkgname/bin/www "$pkgdir"/usr/bin/$pkgname
  ln -s /etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/config
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}"/$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}
