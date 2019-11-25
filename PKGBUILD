# Maintainer: Pascal Mehnert <gargoil@posteo.de>

pkgname=nvimpager-git
pkgver=0.6.r16.g0f75843
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.3.0' 'bash')
makedepends=('curl' 'git' 'pandoc')
conflicts=('nvimpager')
provides=('nvimpager')
source=('git+https://github.com/lucc/nvimpager.git')
sha256sums=('SKIP')

pkgver() {
	cd nvimpager/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

package() {
	cd nvimpager/

	make PREFIX="/usr" DESTDIR="${pkgdir}" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
