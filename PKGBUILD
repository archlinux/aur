# Maintainer: Pedro "EXtremeExploit" Montes Alcalde <pedro.montes.alcalde@gmail.com>

_pkgname="pepv"
pkgname="$_pkgname-git"
pkgver=r25.6490b5687
pkgrel=1
pkgdesc="Pacman local packages viewer"
arch=('x86_64')
url="https://github.com/EXtremeExploit/pepv"
license=('GPL-2.0-only')
makedepends=(
    git
    cmake
    imagemagick
    )
depends=(
    gtk3
    libalpm.so
)
provides=('pepv')
conflicts=('pepv')
source=(
	"$_pkgname"::"git+$url.git"
	"pepv.desktop"
	'tracy'::'git+https://github.com/wolfpld/tracy.git'
)
sha256sums=(
	'SKIP'
	'658f808a52330bebba2355a132a53a691a2e364c7f98c918e3eae73e292b40ef'
	'SKIP'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	(
		local -A _submodules=(
			['tracy']='external/tracy'
		)
		for key in ${!_submodules[@]} ; do
			git submodule init "${_submodules[${key}]}"
			git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
			git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
		done
	)
}

build() {
    cd "$srcdir/$_pkgname"
	mkdir -p build
    cd build
    cmake ..
    cmake --build . --config Release
}

package() {
    cd "$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/pepv"

    install -Dm755 "build/pepv" "$pkgdir/usr/bin/"
    install -Dm644 "pepv.ui" "$pkgdir/usr/share/pepv/"
    install -Dm644 "pepv.png" "$pkgdir/usr/share/pepv/"

    for size in 16 22 24 32 36 48 64 72 96 128 256 512 1024; do \
		mkdir -p $pkgdir/usr/share/icons/hicolor/"$size"x"$size"/apps ; \
		echo pepv.png -resize "$size"x$size $pkgdir/usr/share/icons/hicolor/"$size"x$size/apps/pepv.png ; \
		magick pepv.png -resize "$size"x$size $pkgdir/usr/share/icons/hicolor/"$size"x"$size"/apps/pepv.png ; \
	done

	install -Dm644 "$srcdir/pepv.desktop" "$pkgdir/usr/share/applications/pepv.desktop"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
