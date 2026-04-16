pkgname=actual-ai
pkgver=2.3.1
pkgrel=1
pkgdesc="Automatic classification of transactions for Actual Budget using AI (OpenAI, Anthropic, Gemini, Ollama)"
arch=('any')
url="https://github.com/sakowicz/actual-ai"
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm' 'typescript' 'node-gyp' 'python' 'git')
backup=('etc/actual-ai/actual-ai.env')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('304d5506ab6ac2ab85e49558f9d0199f1b7af2ce62e2982073ab5678cebd7033'
            '6febb119651336efcb8664a9677466cebadccd03cd783188866c8b889d981dbb'
            '2c8eea7b53a943d47caf6ccaf46a64dd42dea275b1f79e0277001480e48e1493'
            '9e9b35a86c0aa805fc75ba5d00513630bf1cc2079b727979a586cbc94b890ebf')

prepare() {
  cd "$pkgname-$pkgver"
  npm install
}

build() {
  cd "$pkgname-$pkgver"
  npm run build
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist node_modules package.json "$pkgdir/usr/lib/$pkgname/"

  install -Dm640 .env.example "$pkgdir/etc/actual-ai/actual-ai.env"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
