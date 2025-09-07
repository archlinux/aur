# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=wakapi
pkgver=2.15.0
pkgrel=1
epoch=
pkgdesc='A minimalist, self-hosted WakaTime-compatible backend for coding statistics'
arch=('any')
url='https://github.com/muety/wakapi'
license=('MIT')
makedepends=('go')
provides=('wakapi')
source=(
  "https://github.com/muety/wakapi/archive/refs/tags/${pkgver}.tar.gz"
  'wakapi.service'
  'wakapi.sysusers'
  'wakapi.tmpfiles'
)
b2sums=(
  '708fbc62ddb6069aa143c7169264119263891ce80a6b3f2627d572e8f6f1f19fc21fedeed9b25a134e8596b307a4056139b91cf50c8817107b1367ec065c63cd'
  '6059694007393199684c8490805d90b4bd40f41c15743325f68aab703a8a4390da0df7cc2204a3ac4ad2c0a4965c35b932570ac5b0b89e80d2942df066ad8cdf'
  '1de59ad462234effb9bfb7e58a35d33c8b43eab26fc5bf0fab27ba427f7ed42f9fc54d03a1a546dcaa09061ab6fd986538db00ca072a295d10218aff81c33fcd'
  '6030b334cf0671fb6493dce169e3b9786411f2c5eb8057cd93669af03c77da95960cba20322c7235995eab5e635efc41724dbd55917debe6ec569caea28d2433'
)
backup=('etc/wakapi/config.yml')

build() {
  cd "wakapi-$pkgver"
  go build -o wakapi -v
}

check() {
  cd "wakapi-$pkgver"
  go test -v
}

package() {
  install -Dm644 wakapi.sysusers "$pkgdir/usr/lib/sysusers.d/wakapi.conf"
  install -Dm644 wakapi.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/wakapi.conf"
  install -Dm644 wakapi.service -t "$pkgdir/usr/lib/systemd/system"

  cd "wakapi-$pkgver"
  install -Dm755 wakapi -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/wakapi"
  install -Dm644 config.default.yml "$pkgdir/etc/wakapi/config.yml"
}
