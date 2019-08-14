# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zulip-desktop-git
pkgver=4.0.0+r2+gf8d93cf
pkgrel=1
pkgdesc='Real-time team chat based on the email threading model (git)'
arch=(i686 x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss)
makedepends=(git npm python2 typescript)
provides=(zulip-desktop)
conflicts=(zulip-desktop zulip-desktop-bin)
source=(git+https://github.com/zulip/${pkgname/-git/}
        zulip.desktop)
sha512sums=('SKIP'
            '7696a6874d17957f99452452723ae1a6b32b6814b018361a71ed1fe0191e1c6da6f3ad693e2e279615e74f687c380ff2f6dab8b69fcd82476e8f33b56a6b4cb5')

pkgver() {
  cd ${pkgname/-git/}
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd ${pkgname/-git/}
  npm i
  npm run pack
}

package() {
  cd ${pkgname/-git/}

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a dist/linux-unpacked "$pkgdir"/usr/lib/${pkgname/-git/}
  ln -s /usr/lib/${pkgname/-git/}/zulip "$pkgdir"/usr/bin

  install -Dm 644 ../zulip.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 24 32 48 64 96 128 256 512; do
    install -Dm 644 build/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zulip.png
  done

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/zulip-desktop
}
