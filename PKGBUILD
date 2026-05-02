# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=c43
pkgbase=c47
pkgname=(c47 r47)
pkgver=00.109.03.02b0
pkgrel=1
pkgdesc="Emulator for the C47 pocket calculator"
arch=(x86_64)
url="https://47calc.com"
license=('GPL-3.0-or-later')
depends=('glibc' 'gtk3' 'hicolor-icon-theme' 'bash' 'python' 'cairo' 'libpulse' 'glib2' 'gmp')
makedepends=('meson' 'python-sphinx' 'doxygen' 'python-breathe' 'xlsxio' 'gendesk' 'icoutils' 'git')
source=("https://gitlab.com/rpncalculators/c43/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1326062c0a150f7c1d3d3d5cb034e3c554e50239b9a2bdaa307b9e00425d3c0b')

prepare() {
	cd "$srcdir"
	gendesk -n -f \
	--pkgname=${pkgbase} \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgbase}" \
	--icon=${pkgbase} \
	--terminal=false \
	--categories="Education;Office;Utilities;Science;Math"
	gendesk -n -f \
	--pkgname=${pkgbase/c/r} \
	--pkgdesc="${pkgdesc/C/R}" \
	--exec="${pkgbase/c/r}" \
	--icon="${pkgbase/c/r}" \
	--terminal=false \
	--categories="Education;Office;Utilities;Science;Math"
}

build() {
	cd "$srcdir"
	arch-meson --buildtype=custom -DDECNUMBER_FASTMUL=true \
	${_pkgname}-${pkgver} build

	meson compile -C build

	cd "$srcdir/${_pkgname}-${pkgver}/docs/code"
	mkdir -p "$srcdir/${_pkgname}-${pkgver}/build/docs"
	doxygen
}

package_c47() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -a ${_pkgname}-${pkgver}/res "$pkgdir/usr/share/$pkgname/res"
	install -Dm755 build/src/${pkgname}-gtk/${pkgname} "$pkgdir/usr/lib/$pkgname/$pkgname"
	cat >> "$pkgdir/usr/bin/$pkgname" <<-EOF
#!/usr/bin/env sh
[[ ! -d "\$HOME/.config/${pkgname}" ]] && mkdir -p "\$HOME/.config/${pkgname}"
cd "\$HOME/.config/${pkgname}" || exit
ln -s /usr/share/${pkgname}/res ./
ln -s /usr/lib/${pkgname}/${pkgname} ${pkgname}
./${pkgname} "\$@"
wait
if [[ -d res ]]
then
rm res
fi
if [[ -f c47 ]]
then
rm ${pkgname}
fi
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$srcdir/c47.desktop" "$pkgdir/usr/share/applications/c47.desktop"
	cd "$srcdir/${_pkgname}-${pkgver}/res"
	icotool -x "${pkgname}.ico"
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

		install -Dm644 ${pkgname}_${_count}_${_size}x${_size}x${_depth}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
		_count=$(($_count + 1))

	done
	install -dm755 "$pkgdir/usr/share/doc/"
	cp -a "$srcdir/${_pkgname}-${pkgver}/build/docs/html" "$pkgdir/usr/share/doc/${pkgname}"
}
package_r47() {
	pkgdesc="${pkgdesc/C/R}"
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -a ${_pkgname}-${pkgver}/res "$pkgdir/usr/share/$pkgname/res"
	install -Dm755 build/src/${pkgname/r/c}-gtk/${pkgname} "$pkgdir/usr/lib/$pkgname/$pkgname"
	cat >> "$pkgdir/usr/bin/$pkgname" <<-EOF
#!/usr/bin/env sh
[[ ! -d "\$HOME/.config/${pkgname}" ]] && mkdir -p "\$HOME/.config/${pkgname}"
cd "\$HOME/.config/${pkgname}" || exit
ln -s /usr/share/${pkgname}/res ./
ln -s /usr/lib/${pkgname}/${pkgname} ${pkgname}
./${pkgname} "\$@"
wait
if [[ -d res ]]
then
rm res
fi
if [[ -f r47 ]]
then
rm ${pkgname}
fi
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$srcdir/r47.desktop" "$pkgdir/usr/share/applications/r47.desktop"
	cd "$srcdir/${_pkgname}-${pkgver}/res"
	icotool -x "${pkgname}.ico"
	_count=1
	for _size in {16,24,32,48,64,128,256};
	do
		case $_size in
			16|24|32|48|64)
				_depth=8
			;;
			128|256)
				_depth=32
			;;
		esac

		install -Dm644 ${pkgname}_${_count}_${_size}x${_size}x${_depth}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
		_count=$(($_count + 1))

	done
	install -dm755 "$pkgdir/usr/share/doc/"
	cp -a "$srcdir/${_pkgname}-${pkgver}/build/docs/html" "$pkgdir/usr/share/doc/${pkgname}"
}
