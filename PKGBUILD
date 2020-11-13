# Maintainer: Danny Grove <dgrove@hashbang.sh>
pkgname=mtls
pkgver=0.14.4
pkgrel=2
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
makedepends=("python-setuptools" "python-setuptools-scm")
source=("https://pypi.io/packages/source/m/mtls/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('1831b617ff780071bbbd3f74a843490d69f1bbb0e490e8249c67733f033b3662'
            'SKIP')
validpgpkeys=('C92FE5A3FBD58DD3EC5AA26BB10116B8193F2DBD') # Danny Grove <dgrove@hashbang.sh>

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  _MTLS_COMPLETE=source_zsh python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.zsh || true
  _MTLS_COMPLETE=source_bash python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.bash || true
  _MTLS_COMPLETE=source_fish python -c 'import sys;from mtls.cli import cli;sys.argv[0]="mtls";cli()' > completion.fish || true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/mtls"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/mtls.fish"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_mtls"
}
