# Maintainer: K900 <me@0upti.me>

pkgname=yamu-git
pkgver=r59.64a2912
pkgrel=1
pkgdesc='Extension host for YaMu.'
arch=('x86_64')
url='https://gitlab.com/K900/yamu'
license=('Apache')
depends=('dbus')
makedepends=('rust' 'python')

source=("git+https://gitlab.com/K900/yamu.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd yamu/host
  cargo build --release
}

package() {
  cd yamu/host
  install -Dm755 target/release/yamu_host "${pkgdir}/usr/bin/yamu-host"

  install_manifest() {
    path="${pkgdir}/$1"
    target="$2"
    mkdir -p "${path}"
    python gen_manifest.py "${target}" > "${path}/yamu.json"
  }

  install_manifest /usr/lib/mozilla/native-messaging-hosts firefox
  install_manifest /etc/chromium/native-messaging-hosts chrome
  install_manifest /etc/opt/chrome/native-messaging-hosts chrome
}

