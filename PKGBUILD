# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: MYT1 <myt1 @ QQ DOC com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
pkgname=you-get-git
pkgver=0.4.1743.20250427.2600
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="https://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python' 'python-dukpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pysocks: for socks proxy support')
conflicts=(you-get)
provides=(you-get)
source=("git+https://github.com/soimort/you-get.git")
md5sums=(SKIP)

_repo_name=you-get

pkgver() {
  cd "$srcdir/$_repo_name"
  _author_ver=$(git describe | sed -e 's/-.*//' -e 's/v//')
  _last_commit_date=$(git log -1 --pretty='%cd' --date=short | tr -d '-')
  _commit_count="$(git rev-list --count HEAD)"
  echo $_author_ver.$_last_commit_date.$_commit_count
}

build() {
  cd "$srcdir/$_repo_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_repo_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 contrib/completion/_you-get "$pkgdir"/usr/share/zsh/site-functions/_you-get
  install -Dm644 contrib/completion/you-get-completion.bash "$pkgdir"/usr/share/bash-completion/completions/you-get
  install -Dm644 contrib/completion/you-get.fish "$pkgdir"/usr/share/fish/vendor_completions.d/you-get.fish
}
