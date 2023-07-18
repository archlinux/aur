# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname='git-machete'
pkgver=3.17.8
pkgrel=1
pkgdesc="Probably the sharpest git repository organizer & rebase/merge workflow automation tool you've ever seen"
arch=('any')
url='https://github.com/VirtusLab/git-machete'
license=('MIT')
depends=('git' 'python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirtusLab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d9840bb5e7e46f699217d27af79a670bbd12a79155afc99696ddb5d2d87d0973')

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-${pkgver}"
  GITHUB_TOKEN='' pytest
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  # Install the package
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Install bash and zsh completions
  install -Dm644 "completion/git-machete.completion.bash" "$pkgdir/usr/share/bash-completion/completions/git-machete"
  install -Dm644 "completion/git-machete.completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_git-machete"

  # Install the license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
