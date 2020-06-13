# Maintainer: somini <dev@somini.xyz>
_pkgname=git-identity
pkgname=$_pkgname-git
pkgver=latest
pkgrel=4
pkgdesc="Manage your identity in Git"
arch=('any')
url="https://github.com/madx/git-identity"
license=('custom:WTFPL')
depends=('git')
makedepends=('git' 'bash-completion')
# checkdepends=()
optdepends=('zsh: for zsh completion')
provides=('git-identity')
conflicts=('git-identity')
source=("$pkgname::git+https://github.com/madx/git-identity.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$pkgname"
	install -D git-identity -t "$pkgdir/usr/bin"

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Completions
	install -Dm644 git-identity.bash-completion "$pkgdir$(pkg-config --variable=completionsdir bash-completion)/git-identity"
	install -Dm644 git-identity.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_git-identity"
}
