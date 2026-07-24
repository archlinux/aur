# Maintainer: Răzvan <aurstuff@razv.xyz>
pkgname=naji-cli
pkgver=1.7.1
pkgrel=1
pkgdesc="CLI client for judge.nitro-ai.org"
arch=('any')
url="https://github.com/MihneaTeodorStoica/nitro-ai-judge-cli"
license=('custom:unknown')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'docker: required for naji play commands'
  'docker-compose: required for docker compose support used by play commands'
)
source=("$pkgname::git+https://github.com/MihneaTeodorStoica/nitro-ai-judge-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m unittest discover -v
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  if [[ -x "$pkgdir/usr/bin/$pkgname" && ! -e "$pkgdir/usr/bin/naji" ]]; then
    mv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/naji"
  fi
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
