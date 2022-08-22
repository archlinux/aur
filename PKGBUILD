# Maintainer: Martin Rys <rys.pw/contact>
pkgname=go-task-git
_pkgname=task
pkgver=3.14.1.r12.g97d4a94
pkgrel=4
pkgdesc="Task runner & Make alternative written in GO that runs taskfiles(Installs as go-task to avoid conflict with taskwarrior)"
arch=('any')
license=('MIT')
depends=()
url="https://github.com/go-task/task"
makedepends=('go' 'git')
provides=('go-task')

_goname="github.com/go-task/task"
source=("$_pkgname::git+https://github.com/go-task/task#branch=${BRANCH:-master}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$_pkgname"
	rm -rf "$srcdir/go/src"
	mkdir -p "$srcdir/go/src/$(dirname $_goname)"
	export GOPATH="$srcdir/go"
	cp -r "$srcdir/$_pkgname" "$srcdir/go/src/$_goname"
	cd "$srcdir/go/src/$_goname/"
	echo ":: Building binary"
	go install -v -gcflags "-trimpath $GOPATH/src" ./cmd/...
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
	# Avoid conflicts with community/task
	mv "${pkgdir}/usr/bin/task" "${pkgdir}/usr/bin/go-task"
	install -DT "$srcdir/${_pkgname}/completion/zsh/_task" "${pkgdir}/usr/share/zsh/site-functions/_go-task"

	# TODO I suppose fish and ps completion files would also be nice to installa
	install -DT "$srcdir/${_pkgname}/completion/bash/task.bash" "${pkgdir}/usr/share/bash-completion/completions/go-task"
}
