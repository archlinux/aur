# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zulip-desktop-git
_pkgname=zulip-desktop
pkgver=4.0.0+r19+gdae7089
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model (git)'
arch=(i686 x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss)
makedepends=(git npm python2)
provides=(zulip-desktop)
conflicts=(zulip-desktop)
source=(git+https://github.com/zulip/$_pkgname
        $_pkgname.desktop)
sha512sums=('SKIP'
            '7696a6874d17957f99452452723ae1a6b32b6814b018361a71ed1fe0191e1c6da6f3ad693e2e279615e74f687c380ff2f6dab8b69fcd82476e8f33b56a6b4cb5')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd $_pkgname
  npm i
  npm run pack
}

package() {
  cd $_pkgname

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/$_pkgname
  ln -s /usr/lib/$_pkgname/zulip "$pkgdir"/usr/bin

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname

  install -Dm 644 ../$_pkgname.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png
  done
}
