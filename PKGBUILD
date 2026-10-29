# Maintainer: Kohlbern Jary <kohlbern@gmail.com>
# Your computer should have a little guy in it.
pkgbase=gremlincore
pkgname=('gremlincore' 'meatbag')
pkgver=0.1.0
pkgrel=1
arch=('any')
url="https://github.com/KohlJary/gremlincore"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgbase"
  python -m build --wheel --no-isolation
}

_site() {
  python -c 'import site; print(site.getsitepackages()[0])'
}

package_gremlincore() {
  pkgdesc="The runtime for an agent that lives in your computer: queue, ledgers, wake, TUI, init. It drafts; you send."
  depends=('python' 'python-textual' 'python-rich')
  optdepends=('claude-code: what `gremlin talk` runs the agent on today'
              'meatbag: build a persona from your own AI chat exports')
  cd "$pkgbase"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # meatbag is its own package.
  rm -rf "$pkgdir$(_site)/meatbag" "$pkgdir/usr/bin/meatbag"
  # init's templates (a wheel doesn't carry them); init.templates_dir() looks here.
  install -d "$pkgdir/usr/share/gremlincore"
  cp -r --no-preserve=ownership templates "$pkgdir/usr/share/gremlincore/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_meatbag() {
  pkgdesc="Your AI chat exports in, a persona/ out. Extraction for gremlincore homes."
  depends=('gremlincore')
  cd "$pkgbase"
  local site; site="$(_site)"
  python -m installer --destdir="$srcdir/whole" dist/*.whl
  install -d "$pkgdir$site"
  cp -r "$srcdir/whole$site/meatbag" "$pkgdir$site/"
  install -Dm755 "$srcdir/whole/usr/bin/meatbag" "$pkgdir/usr/bin/meatbag"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
