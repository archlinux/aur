# Maintainer: fortime <palfortime@gmail.com>

_pkgbase=fcitx5-osk
pkgbase=fcitx5-osk-git
pkgname=(
    fcitx5-osk-git
    fcitx5-osk-kwin-launcher-git
)
pkgver=0.1.0.r1.gbf29d04
pkgrel=1
pkgdesc='An onscreen keyboard working with fcitx5'
url='https://github.com/fortime/fcitx5-osk'
source=("git+https://github.com/fortime/fcitx5-osk")
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'git')
depends=('fcitx5' 'ttf-font-nerd')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgbase"
  # We use a patched iced_layershell, so we can't use --offline
  #cargo fetch --offline --target "$(rustc -vV | sed -n 's|host: ||p')"
  cargo fetch --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/$_pkgbase"

  cargo build --frozen --release
}

package_fcitx5-osk-git() {
  cd "$srcdir/$_pkgbase"

  name=fcitx5-osk

  install -Dm755 target/release/${name} "${pkgdir}/usr/bin/${name}"
  install -Dm755 target/release/${name}-key-helper "${pkgdir}/usr/bin/${name}-key-helper"
  install -Dm644 pkg/share/dbus-1/services/fyi.fortime.Fcitx5Osk.service "${pkgdir}/usr/share/dbus-1/services/fyi.fortime.Fcitx5Osk.service"
  install -Dm644 pkg/lib/systemd/system/${name}-key-helper.service "${pkgdir}/usr/lib/systemd/system/${name}-key-helper.service"
  install -Dm644 pkg/share/dbus-1/system.d/fyi.fortime.Fcitx5OskKeyHelper.conf "${pkgdir}/usr/share/dbus-1/system.d/fyi.fortime.Fcitx5OskKeyHelper.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${name}"
}

package_fcitx5-osk-kwin-launcher-git() {
  cd "$srcdir/$_pkgbase"

  name=fcitx5-osk-kwin-launcher

  install -Dm755 target/release/${name} "${pkgdir}/usr/bin/${name}"
  install -Dm644 pkg/share/applications/fcitx5-osk-kwin-launcher.desktop "${pkgdir}/usr/share/applications/fcitx5-osk-kwin-launcher.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${name}"
}
