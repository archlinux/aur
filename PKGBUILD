# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname='git-machete'
pkgver=3.29.2
pkgrel=1
pkgdesc="Probably the sharpest git repository organizer & rebase/merge workflow automation tool you've ever seen"
arch=('any')
url='https://github.com/VirtusLab/git-machete'
license=('MIT')
depends=('git' 'python')
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('bash: bash completion'
            'fish: fish completion'
            'zsh: zsh completion')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirtusLab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9b94cbfc762fe9d5b7ebf4747a83b4eebae2b351e9442a0274f41c233fbf0103')

prepare() {
  cd "$srcdir/$pkgname-${pkgver}"
  # Only install git_machete as a Python package
  sed -i "s/packages=.*,$/packages=['git_machete'],/" setup.py
}

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-${pkgver}"
  # https://github.com/VirtusLab/git-machete/issues/1331
  GITHUB_TOKEN='' pytest  -m 'not completion_e2e' -k 'not test_is_equivalent_tree_or_patch_reachable_with_squash_merge_and_commits_in_between'
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  # Install the package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install bash, zsh and fish completions
  install -Dm644 "completion/git-machete.completion.bash" "$pkgdir/usr/share/bash-completion/completions/git-machete"
  install -Dm644 "completion/git-machete.completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_git-machete"
  install -Dm644 "completion/git-machete.fish" "$pkgdir//usr/share/fish/vendor_completions.d/git-machete.fish"

  # Add the license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Add the man page
  install -Dm 644 "docs/man/git-machete.1" "$pkgdir/usr/share/man/man1/git-machete.1"
}
