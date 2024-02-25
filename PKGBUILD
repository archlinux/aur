# Maintainer: éclairevoyant
# Contributor: Alexander Epaneshnikov <alex19ep at archlinux dot com>
# Contributor: libertylocked <libertylocked at disroot dot org>

_pkgname=bitwarden-cli
pkgname="$_pkgname-git"
pkgver=2024.2.2.r100.b37ba717122
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=(x86_64)
url='https://github.com/bitwarden/clients/tree/master/apps/cli'
license=(GPL3)
depends=(nodejs-lts-hydrogen)
makedepends=(git npm modclean)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("$_pkgname::git+https://github.com/bitwarden/clients.git")
b2sums=('SKIP')

prepare() {
	cd $_pkgname
	export npm_config_build_from_source=true
	export npm_config_cache="$srcdir/npm_cache"

	npm ci
}

pkgver() {
	cd $_pkgname
	git blame -s -L"/\"version\"/,+1" apps/cli/package.json | awk '{
		ver = gensub(/[^0-9.]/, "", "g", $4);
		"git rev-list --count "$1"..HEAD" | getline commit_count;
		print ver".r"commit_count"."$1
	}'
}

build() {
	cd $_pkgname/apps/cli
	export npm_config_cache="$srcdir/npm_cache"
	npm run dist:lin
	npm run clean
	node ./build/bw.js completion --shell zsh > _bw
}

package() {
	cd $_pkgname/apps/cli
	npm install --production -g --prefix "$pkgdir"/usr $(npm pack . | tail -1)

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"
	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# package zsh completions
	install -vDm644 _bw -t "${pkgdir}/usr/share/zsh/site-functions"

	# cleanup
	sed -e "s|${srcdir}|/|" -i "$pkgdir"/usr/lib/node_modules/@bitwarden/cli/package.json
	find "$pkgdir"/usr/lib/node_modules -name 'package.json' -exec sed -e "s|${srcdir}||" -i {} \;
	modclean --path "$pkgdir"/usr/lib -r -a "*.ts,.bin,.github,.vscode,bin.js" --ignore='license'
}
