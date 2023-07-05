# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls
pkgver=0.17.0
pkgrel=1
pkgdesc="A short-lived certificate tool based on the Zero Trust network model"
url="https://github.com/drgrove/mtls-cli"
license=("Apache")
arch=("any")
depends=("nss"
         "python-click"
         "python-cryptography"
         "python-gnupg"
         "python-pyopenssl"
         "python-requests"
         "python-urllib3")
makedepends=("python-setuptools" "python-setuptools-scm" "python-build" "python-installer")
source=("https://github.com/drGrove/mtls-cli/releases/download/v${pkgver}/mtls-${pkgver}.tar.gz"{,.asc})
sha256sums=('f432008694b778caec659a66f8bcb399b62da6e525ade8861529b586a0fb9886'
            'SKIP')
validpgpkeys=('C92FE5A3FBD58DD3EC5AA26BB10116B8193F2DBD') # Danny Grove <dgrove@hashbang.sh>

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build
  _MTLS_COMPLETE=zsh_source python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.zsh || true
  _MTLS_COMPLETE=bash_source python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.bash || true
  _MTLS_COMPLETE=fish_source python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.fish || true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" --no-compile-bytecode dist/$pkgname-$pkgver-py3-none-any.whl
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/mtls"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/mtls.fish"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_mtls"
}
