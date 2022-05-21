pkgbase="md-git"
pkgname="md-git"
pkgver=1.18
pkgrel=1
pkgdesc="Simple MarkDown Reader"

arch=("any")

makedepends=("git" "binutils" "make" "gcc" "gzip")
depends=("glibc" "libadvo")

license=("MIT")

url="https://github.com/Noah-Arcouette/md.git"

provides=("md")
conflicts=("md")

giturl="https://raw.githubusercontent.com/Noah-Arcouette/md/master/"

source=(
	"git+${url}"
)

sha256sums=(
	"SKIP"
)


pkgver () {
	cd "md"
	printf "${pkgver}.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "md"

	echo "1: Default"
	echo "2: Desert"
	echo "3: Doxy"
	echo "4: Moon"
	echo "5: TTY-Support ( Designed to work with TTY Session users )"
	echo "6: Wolf"

	printf "Please Pick a Style?(1) "

	read -r style_id

	if [ -z "$style_id" ] || [ "$style_id" = "1" ]
	then
		Style=default
	elif [ "$style_id" = "2" ]
	then
		Style=desert
	elif [ "$style_id" = "3" ]
	then
		Style=doxy
	elif [ "$style_id" = "4" ]
	then
		Style=moon
	elif [ "$style_id" = "5" ]
	then
		Style=tty-support
	elif [ "$style_id" = "6" ]
	then
		Style=wolf
	else
		echo "Error: $style_id is not an option"
		exit 1
	fi

	make mk
	make build STYLE=$Style
}

package() {
	cd "md"

	# setup dirs
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/doc/md/"
	mkdir -p "${pkgdir}/usr/share/man/man1/"

	# make binary root owned and executable
	chown root:root ${srcdir}/md/bin/md
	chmod a+x ${srcdir}/md/bin/md

	# copy docs
	cp ${srcdir}/md/doc/* ${pkgdir}/usr/doc/md/
	cp "${srcdir}/md/face" "${pkgdir}/usr/doc/md/face"
	cp "${srcdir}/md/md.1.gz" "${pkgdir}/usr/share/man/man1/"

	# copy binary
	mv "${srcdir}/md/bin/md" "${pkgdir}/usr/bin"
}
