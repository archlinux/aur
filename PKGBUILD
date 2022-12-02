# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-git
pkgver=0.7.1.r31.g73401a3
pkgrel=1
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/martanne/vis#vis-a-vim-like-text-editor'
depends=('acl' 'libacl.so' 'bash' 'ncurses' 'libncursesw.so' 'libtermkey'
         'libtermkey.so' 'lua' 'lua-lpeg' 'tre' 'file')
optdepends=('wl-clipboard: wayland clipboard support'
            'xclip: X11 clipboard support'
            'xsel: X11 clipboard support')
makedepends=('git')
checkdepends=('vim')
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
backup=('etc/vis/visrc.lua')
source=('git+https://github.com/martanne/vis.git'
        'git+https://github.com/martanne/vis-test.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd vis/

  git config --file=.gitmodules submodule.test.url ../vis-test/
  git update-index --assume-unchanged .gitmodules
  git submodule init
  git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd vis/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
  cd vis/

  ./configure \
    --prefix=/usr

  make
}

check() {
  cd vis/

  make -C test/
}

package() {
  cd vis/

  make DESTDIR="${pkgdir}" install

  install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua

  install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
}

