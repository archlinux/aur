# Maintainer: a <a@tuxpa.in>
# Contributors: a

pkgname=gopaste-git
pkgver=0.0.21.r1
pkgrel=1
pkgdesc='go paste bin'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
url='https://gitlab.com/tuxpaint/gopaste'
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://gitlab.com/tuxpaint/${pkgname%-git}.git")
md5sums=('SKIP')
backup=(etc/gopaste/config.yml)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 gopaste -t "${pkgdir}"/usr/bin
  install -Dm644 config.yml -t "${pkgdir}"/etc/gopaste
  install -Dm644 readme.md -t "${pkgdir}"/usr/share/doc/gopaste
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/gopaste
  install -Dm644 contrib/systemd/gopaste.env -t "${pkgdir}"/etc/gopaste
  install -Dm644 contrib/systemd/gopaste.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 contrib/systemd/gopaste.sysusers "${pkgdir}"/usr/lib/sysusers.d/gopaste.conf
  install -Dm644 contrib/systemd/gopaste.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/gopaste.conf
}
