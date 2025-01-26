# Maintainer: Brian Rago <ragobrianp at gmail dot com>

pkgname=ats-postiats-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r453.c0cda56c
pkgrel=1
pkgdesc="A language that unifies implementation with specification (release branch)"
arch=('x86_64')
url="https://www.cs.bu.edu/~hwxi/atslangweb/"
license=('GPL-3.0-only')
depends=('bash' 'glibc')
optdepends=('python: atscc2py3'
			'gmp: multiprecision arithmetic')
makedepends=('git' 'gcc') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ats-postiats::git+git://git.code.sf.net/p/ats2-lang/code'
        'ats-postiats.patch')
sha256sums=('SKIP'
            '335ba8c3d67165f0f0f33d8eeeb4479a3b57b9d26662d59f6d7023ef00b51d7b')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make -j1
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make -j1 DESTDIR="$pkgdir" install
}
