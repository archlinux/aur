# Maintainer: Kiril Zyapkov <kiril.zyapkov@gmail.com>
pkgname=mos-git
pkgver=20170814.3586_761f3601
pkgrel=1
pkgdesc="Mongoose-OS build tool"
arch=('i686' 'x86_64')
license=('GPL')
url="https://mongoose-os.com/software.html"
depends=('libftdi-compat' 'libusb')
makedepends=(
	'go'
	'git'
	'govendor'
)

source=(git+https://github.com/cesanta/mongoose-os.git#branch=master)

md5sums=('SKIP')

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/mongoose-os"
	# echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)

	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
	# cd "$srcdir/mongoose-os/mos"
	#
	rm -rf "$srcdir/.go/src"
	mkdir -p "$srcdir/.go/src"
	export GOPATH="$srcdir/.go"
	mv "$srcdir/mongoose-os" "$srcdir/.go/src/cesanta.com"
	cd "$srcdir/.go/src/cesanta.com"
	sed -i 's,/usr/bin/env python,/usr/bin/env python2,g' "${srcdir}/.go/src/cesanta.com/common/tools/fw_meta.py"
	govendor sync
	make -C mos install
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
