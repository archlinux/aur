# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=c43
pkgname=c47-git
pkgver=00.109.03.00b1.r288.g66cba98
pkgrel=1
pkgdesc="Emulator for the C47 pocket calculator"
arch=(x86_64)
url="https://47calc.com"
license=('GPL-3.0-or-later')
depends=('glibc' 'gtk3' 'hicolor-icon-theme' 'bash' 'python' 'cairo' 'libpulse' 'glib2' 'gmp')
makedepends=('meson' 'python-sphinx' 'doxygen' 'python-breathe' 'xlsxio' 'gendesk' 'icoutils' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("${_pkgname}::git+https://gitlab.com/rpncalculators/c43.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir"
	gendesk -n -f \
	--pkgname=${pkgname::-4} \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgname::-4}" \
	--icon=${pkgname::-4} \
	--terminal=false \
	--categories="Education;Office;Utilities"
}

build() {
	cd "$srcdir"
	arch-meson --buildtype=custom -DDECNUMBER_FASTMUL=true \
	${_pkgname} build

	meson compile -C build

	cd "$srcdir/${_pkgname}/docs/code"
	mkdir -p "$srcdir/${_pkgname}/build/docs"
	doxygen
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/${pkgname::-4}"
	cp -a ${_pkgname}/res "$pkgdir/usr/share/${pkgname::-4}/res"
	install -Dm755 build/src/${pkgname::-4}-gtk/${pkgname::-4} "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
	cat >> "$pkgdir/usr/bin/${pkgname::-4}" <<-EOF
#!/usr/bin/env sh
[[ ! -d "\$HOME/.config/${pkgname::-4}" ]] && mkdir -p "\$HOME/.config/${pkgname::-4}"
cd "\$HOME/.config/${pkgname::-4}" || exit
ln -s /usr/share/${pkgname::-4}/res ./
ln -s /usr/lib/${pkgname::-4}/${pkgname::-4} ${pkgname::-4}
./${pkgname::-4} "\$@"
wait
if [[ -d res ]]
then
rm res
fi
if [[ -f ${pkgname::-4} ]]
then
rm ${pkgname::-4}
fi
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}"

	install -Dm644 "$srcdir/c47.desktop" "$pkgdir/usr/share/applications/c47.desktop"
	cd "$srcdir/${_pkgname}/res"
	icotool -x "${pkgname::-4}.ico"
	_count=1
	for _size in {16,24,32,48,64,128,256};
	do
		case $_size in
			16|24|32|48|64)
				_depth=8
			;;
			128)
				_depth=24
			;;
			256)
				_depth=32
			;;
		esac

		install -Dm644 ${pkgname::-4}_${_count}_${_size}x${_size}x${_depth}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname::-4}.png"
		_count=$(($_count + 1))

	done
	install -dm755 "$pkgdir/usr/share/doc/"
	cp -a "$srcdir/${_pkgname}/build/docs/html" "$pkgdir/usr/share/doc/${pkgname::-4}"
}
