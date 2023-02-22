# Maintainer: yunielrc87 <yunielrc87[at]gmail[dot]com>
pkgname=bash-bats-support-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Supporting library for Bats test helpers"
arch=('any')
url="https://github.com/bats-core/bats-support"
license=('CCPL')
depends=('bash-bats')
install="$pkgname.install"
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f')

pkgver() {
  git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' | tail -n 1 | cut -d '/' -f 3 | sed 's/^v//'
}

check() {
  cd "bats-support-${pkgver}"
  echo "tests contains sudo invocation, will avoid to run them"
  #TEST_DEPS_DIR="/usr/lib/" bats test
}

package() {
  cd "bats-support-${pkgver}"

  for fn in *.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/${pkgname}/$(basename $fn)"
  done

  for fn in src/*.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/${pkgname}/src/$(basename $fn)"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
