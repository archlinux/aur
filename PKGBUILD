# Maintainer: sulhan <ms at kilabit.info>
_pkgname=rescached
pkgname=rescached-git
pkgver=r121.b0c87cc
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64')
url="https://github.com/shuLhan/rescached"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'asciidoc')
provides=('rescached')
conflicts=('rescached')
backup=('etc/rescached/rescached.cfg')
source=(
  "$_pkgname::git+https://github.com/shuLhan/rescached.git"
	"libvos::git+https://github.com/shuLhan/libvos.git"
)
sha1sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
	cd "$srcdir/$_pkgname/src"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	git config submodule.libvos.url $srcdir/libvos
	git submodule update
	cd "src"
}

build() {
	cd "$srcdir/$_pkgname/src"
	echo ">>"
	echo ">> cleaning ..."
	echo ">>"
	make distclean
	echo ">>"
	echo ">> make ..."
	echo ">>"
	unset CXXFLAGS
	make || return 1
}

package() {
	cd "$srcdir/$_pkgname/src"

	make DESTDIR="$pkgdir/" install

  install -D -m644 $srcdir/$_pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
