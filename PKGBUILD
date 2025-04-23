# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=yoctopuce
pkgver=2.1.5971
pkgrel=1
pkgdesc="C++ library for interfacing with Yoctopuce devices"
arch=($CARCH)
url="https://github.com/yoctopuce/yoctolib_cpp"
license=('LicenseRef-custom')
groups=('yoctopuce-libs')
depends=(
	gcc-libs
	glibc
	libusb
)
makedepends=(java-runtime)
provides=('libyocto.so' 'libyapi.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'LICENSE'
)
sha256sums=('3db852f49b74a60c92ef79528acc757a86a2874282dd9d78ca04878d73447e04'
            '2b22a5342677bd71e40e9fadab57146a8662ded89e97ac98b8726fb9a0e22e30')

build() {
	export CFLAGS+=" ${CPPFLAGS}"
	export CXXFLAGS+=" ${CPPFLAGS}"
	export LDFLAGS+=" ${LDFLAGS}"

	make -C "${srcdir}/yoctolib_cpp-$pkgver/Binaries"
}

package() {
	# 	local x86_64=64bits i686=32bits armv7h=armhf
	install -Dm644 ${srcdir}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "${srcdir}/yoctolib_cpp-$pkgver"
	# 	install -Dm644 "Binaries/linux/${CARCH}/"libyocto.so.* -t "$pkgdir/usr/lib/"
	# 	install -Dm644 "Binaries/linux/${CARCH}/yapi/"libyapi.so.* -t "$pkgdir/usr/lib/"
	declare -A libs
	libs=(
		["libyapi"]="Binaries/linux/${CARCH}/yapi"
		["libyocto"]="Binaries/linux/${CARCH}"
	)

	target_dir="/usr/lib"

	for lib in "${!libs[@]}"; do
		dir="${libs[$lib]}"

		full_version=$(ls "${dir}/${lib}.so."* | grep -oP '\d+(\.\d+)+')

		if [ -z "$full_version" ]; then
			echo "No found ${lib}"
			continue
		fi

		major_version=$(echo "$full_version" | cut -d '.' -f 1)

		install -Dm644 "${dir}/${lib}.so.${full_version}" "${pkgdir}/${target_dir}/${lib}.so.${full_version}"
		ln -sf "${target_dir}/${lib}.so.${full_version}" "${pkgdir}/${target_dir}/${lib}.so"
		ln -sf "${target_dir}/${lib}.so.${full_version}" "${pkgdir}/${target_dir}/${lib}.so.${major_version}"
	done

	install -Dm644 udev_conf/51-yoctopuce_group.rules -t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 Documentation/yoctolib-cpp* -t "$pkgdir/usr/share/doc/${pkgname}/"
}
