# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=agent-pwa-notifications
pkgver=1.6.0
pkgrel=1
pkgdesc="CLI for a self-hosted Agent PWA Notifications hub: connect an agent, mint a sign-in link, send updates and questions"
arch=('any')
url="https://github.com/Qu4tro/agent-pwa-notifications"
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm')
provides=('agent-notify-pwa')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qu4tro/agent-pwa-notifications/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d11aee71333ef9020ff0ae54a7ee04f2c9a1c721df2bdd76ef4854c06684cd57')

# The tarball is the whole hub repository; only cli/ is packaged. The CLI has
# one runtime dependency (qrcode-terminal) and no build step.
build() {
  cd "$pkgname-$pkgver/cli"
  npm install --omit=dev --no-audit --no-fund --no-package-lock
}

package() {
  cd "$pkgname-$pkgver"

  local _dest="$pkgdir/usr/lib/$pkgname"
  install -dm755 "$_dest"
  cp -r cli/bin.mjs cli/lib cli/package.json cli/node_modules "$_dest/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/bin.mjs" "$pkgdir/usr/bin/agent-notify-pwa"

  # npm leaves the build user as the owner and hands out random directory
  # permissions. See https://bugs.archlinux.org/task/63396
  chmod 755 "$_dest/bin.mjs"
  find "$_dest" -type d -exec chmod 755 {} +
  find "$_dest" -type f -perm /022 -exec chmod go-w {} +
  chown -R root:root "$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 cli/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
