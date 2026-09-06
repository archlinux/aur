# Maintainer: Kcocoa <kamforzn2@proton.me>

pkgname=cli-proxy-api-systemd-bin
pkgver=7.2.152
pkgrel=1
pkgdesc="Proxy server providing OpenAI, Gemini, Claude, and Codex compatible APIs (systemd config)"
arch=('x86_64')
url="https://github.com/router-for-me/CLIProxyAPI"
license=('MIT')
depends=('glibc' 'ca-certificates')
conflicts=('cli-proxy-api')
provides=('cli-proxy-api')
backup=('etc/cli-proxy-api/config.yaml')
install='cli-proxy-api.install'
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/CLIProxyAPI_${pkgver}_linux_amd64.tar.gz"
  'cli-proxy-api.service'
  'cli-proxy-api.sysusers'
  'cli-proxy-api.tmpfiles'
)
sha256sums=('0168181ea302c00d1ccae636eba70072d1ab88b271669ede796d3ed65d54bd8d'
            '76a8e4e87e78c696c5e59f786f35cf4e015dd0103802e4236b60ac9454bbbf05'
            '216ce81546d176c915838a42d555cd144b2b15fb8cd50dc17f14572a9e6e469a'
            '9903cf5950cdc24f23eee53890393ad2ab9ac6daaf8aedf59df30721ca6357be')

package() {
  install -Dm755 cli-proxy-api "$pkgdir/usr/bin/cli-proxy-api"

  install -dm2775 "$pkgdir/etc/cli-proxy-api"
  install -m660 config.example.yaml "$pkgdir/etc/cli-proxy-api/config.yaml"
  sed -i \
    -e 's|auth-dir: "~/.cli-proxy-api"|auth-dir: "/var/lib/cli-proxy-api/auths"|' \
    "$pkgdir/etc/cli-proxy-api/config.yaml"

  install -Dm644 "$srcdir/cli-proxy-api.service" \
    "$pkgdir/usr/lib/systemd/system/cli-proxy-api.service"
  install -Dm644 "$srcdir/cli-proxy-api.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/cli-proxy-api.conf"
  install -Dm644 "$srcdir/cli-proxy-api.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/cli-proxy-api.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
