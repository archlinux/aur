# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase=f4pga-arch-defs
pkgbase="$_pkgbase-nightly-bin"
_builddate=20220523-230829
_commit=934b12d
pkgver="${_builddate%%-*}.$_commit"
pkgrel=1
pkgdesc="Documentation of various FPGA architectures - latest binary snapshot"
arch=(any)
url="https://github.com/SymbiFlow/$pkgbase"
license=('ISC')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
_old_pkgbase=symbiflow-arch-defs
_baseurl="https://storage.googleapis.com/$_old_pkgbase/artifacts/prod/foss-fpga-tools/$_old_pkgbase/continuous/install/$_builddate"
_devices=(xc7a50t xc7a100t xc7a200t xc7z010 xc7z020)
source=("https://raw.githubusercontent.com/SymbiFlow/$_pkgbase/$_commit/COPYING"
        '0001-Fix-PLLE2_BASE-techmap.patch'
        '0002-fix-make-utils-fix_xc7_carry.py-executable.patch'
        '0003-fix-xc7-synth.tcl-run-fix_xc7_carry.py-directly.patch'
        "$_baseurl/$_old_pkgbase-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_old_pkgbase-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            'f1a3dd4030fb4a8173bd57e72b29ea48c858cc9531ad4fec23d73ef607198f6f'
            '511bb5658955a8bb649aa45f13c949f35f4962e7f79f84b23a546d26bb309565'
            'ae5ab7d35dd9d30ca9bb6216ce4ec6f4726692e4fb5f30d4a54ddad758940a9d'
            '274d2022c630efb8f07f07bc4dde59551fbf2b145d3528849a1ee47adada9b10'
            '3e8a0e560534e20feda4a620a4b5d8d18091c088b4df8a128ea959f29253c842'
            '37c119e46957098b9e973b0b2a194723e11e6175a429fc5f514d2c708f7d6246'
            '54aa5bce9708c1d044ce9bb20a7111613364c2201a426ba2d228136e7c697d3c'
            'ef1ed6fa27ac37d1afff4e355b82fdff834d0fb6fda0fec0d303780099bb1ea8'
            'ce5b3f3aa4f7cfae31563958d0dffb7f34377e6d4b6289d31361a5ebf6b2da71')

pkgname=("$pkgbase-toolchain" "${_devices[@]/#/$pkgbase-device-}")

_extract_tarball() {
	install -dm755 "$pkgdir/usr"
	bsdtar -C "$pkgdir/usr" -xof "$_old_pkgbase-$1-$_commit.tar.xz"
	chmod -R g-ws "$pkgdir"

	install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package-toolchain() {
	pkgdesc="Supporting scripts and data for the F4PGA toolchain"
	depends=('vtr>8.0.0' 'yosys' 'yosys-f4pga-plugins' 'python' 'python-constraint' 'python-xc-fasm' 'prjxray-tools')
	optdepends=(
		'f4pga: toolchain binaries and python interface'
		"${_devices[@]/#/$pkgbase-device-}"
	)
	provides=("$_pkgbase-toolchain" "$_old_pkgbase-nightly-bin-toolchain")
	# conflicts with symbiflow-arch-defs-nightly-bin-toolchain instead of symbiflow-arch-defs-toolchain because f4pga provides the latter, and is actually compatible
	conflicts=("$_pkgbase-toolchain" "$_old_pkgbase-nightly-bin-toolchain")
	replaces=("$_old_pkgbase-nightly-bin-toolchain")

	_extract_tarball "install"

	rm "$pkgdir/usr/environment.yml"

	patch -d "$pkgdir/usr/share/symbiflow/techmaps/xc7_vpr/" -p3 < "$srcdir/0001-Fix-PLLE2_BASE-techmap.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/" -p2 < "$srcdir/0002-fix-make-utils-fix_xc7_carry.py-executable.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p4 < "$srcdir/0003-fix-xc7-synth.tcl-run-fix_xc7_carry.py-directly.patch"
}

eval "package_$pkgbase-toolchain() {
	$(declare -f "_package-toolchain")
	_package-toolchain
}"

for _device in "${_devices[@]}"; do
	eval "package_$pkgbase-device-$_device() {
		pkgdesc='F4PGA device definitions for $_device'
		provides=('$_pkgbase-device-$_device' '$_old_pkgbase-device-$_device')
		conflicts=('$_pkgbase-device-$_device' '$_old_pkgbase-device-$_device')
		replaces=('$_old_pkgbase-nightly-bin-device-$_device')

		_extract_tarball '${_device}_test'
	}"
done
