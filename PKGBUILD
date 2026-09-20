# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-masky"
pkgver="0.2.1"
pkgrel=1
pkgdesc="Python library with CLI allowing to remotely dump domain user credentials via an ADCS without dumping the LSASS process memory"
arch=('any')
url="https://github.com/Z4kSec/masky"
license=('MIT')
depends=(
  'python>=3.9'
  'python-cryptography>=3.5'
  'python-colorama'
  'python-pyasn1'
  'python-asn1crypto'
  'impacket'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'python-argcomplete'
  'git'
)
source=("git+$url#commit=d0e16e9394fa3ed3a028ec078213288e78292de1") # Didn't tag latest release
b2sums=('7399d7b53c4a391687c4a6797e674c529471f8b5650da8a8922b6e92243bbeff8e8b587b31ab8ddd3ecfb4fd596ade71b276b95f71cae9d76eb27683b838f347')

prepare() {
  git -C masky clean -dfx
}

build() {
  cd masky
  python -m build -wnx
}

package() {
  cd masky
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 <(register-python-argcomplete -s bash masky) "$pkgdir/usr/share/bash-completion/completions/masky"
  install -Dm0644 <(register-python-argcomplete -s zsh masky) "$pkgdir/usr/share/zsh/site-functions/_masky"
  install -Dm0644 <(register-python-argcomplete -s fish masky) "$pkgdir/usr/share/fish/vendor_completions.d/masky.fish"
}

# vim: ts=2 sw=2 et:
