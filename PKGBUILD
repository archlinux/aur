# Maintainer: envolution
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
pkgname="hardened-malloc-git"
pkgver=+r724+a7302add6
pkgdesc="Hardened allocator designed for modern systems."
url="https://github.com/GrapheneOS/hardened_malloc"
license=("MIT")
makedepends=("git")
conflicts=("hardened_malloc")
provides=("hardened_malloc")
arch=("x86_64")
pkgrel=1
source=('hardened_malloc::git+https://github.com/GrapheneOS/hardened_malloc#branch=main'
		'preload.sh')
sha256sums=('SKIP'
            'e6dbce7ac1d689fafbc94ffb17d8c4ae5271dd3580421828d35aac2c067b652d')

pkgver(){
  cd "$srcdir/hardened_malloc"
  _version=$(git tag --sort=refname --list | grep "^[0-9]+$" | grep "^[0-9]\{2,4\}$" | sort -nr | head -1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+${_short_commit_hash}"
}

build() {
	cd "${srcdir}/hardened_malloc"
	
	CFLAGS="" make
}

package() {
	cd "${srcdir}/hardened_malloc"
	
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/bin"
	
	install -D -m755 "out/libhardened_malloc.so" "$pkgdir/usr/lib"
	install -D -m755 "$srcdir/preload.sh" "$pkgdir/usr/bin/hardened-malloc-preload"
	install -D -m755 "calculate_waste.py" "$pkgdir/usr/bin/hardened-malloc-calculate-waste.py"
	
}
