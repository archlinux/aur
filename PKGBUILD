# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=symbiflow-arch-defs
pkgbase="$_pkgname-nightly-bin"
_buildnum=125
_builddate=20210122-000052
_commit=bff52005
pkgver="${_builddate%%-*}.$_commit"
pkgrel=1
pkgdesc="Documentation of various FPGA architectures - latest binary snapshot"
arch=(any)
url="https://github.com/SymbiFlow/symbiflow-arch-defs"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
_baseurl="https://storage.googleapis.com/$_pkgname/artifacts/prod/foss-fpga-tools/$_pkgname/continuous/install/$_buildnum/$_builddate"
_devices=(xc7a50t xc7a100t xc7a200t xc7z010 xc7z020)
source=("https://raw.githubusercontent.com/SymbiFlow/$_pkgname/$_commit/COPYING"
        "$_baseurl/$_pkgname-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_pkgname-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            '6cdb158efca060706cb25f8f3610316a1a1f263cca74d84463736c00790d6d6d'
            'dd2d5cb4ec59cc08a8f63a12ba4d8d76d046add90baac2f46bd8c74bf91c4d4f'
            '3f6e8c158e447c2bdaac6a7fc7b45557935ed1644a973d87213ff6faef1ff1b5'
            '5b325e5b9d7483aa050e50aa417817c0e668a97cac1b8ac145a2d0510b086edb'
            '7dd3ba9e665bf46374a3810e527150851f42a4b8f3dd8dd188fb4e74990b8e5f'
            'e20c7271d76da44e30ec2945e6b7b8103526193ae752cf28b02a9eca2994624e')

pkgname=("$pkgbase-toolchain" "${_devices[@]/#/$pkgbase-device-}")

_extract_tarball() {
	install -dm755 "$pkgdir/usr"
	bsdtar -C "$pkgdir/usr" -xof "$_pkgname-$1-$_commit.tar.xz"
	chmod -R g-s "$pkgdir"

	install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package-toolchain() {
	pkgdesc="Scripts to invoke the SymbiFlow toolchain"
	depends=('vtr' 'yosys' 'yosys-symbiflow-plugins' 'python')
	optdepends=("${_devices[@]/#/$pkgbase-device-}")
	provides=("$_pkgname-toolchain")
	conflicts=("$_pkgname-toolchain")

	_extract_tarball "install"

	rm "$pkgdir/usr/environment.yml"

	sed -i "s#source \${MYPATH}/env#source /usr/lib/$_pkgname/env#" "$pkgdir"/usr/bin/*

	install -dm755 "$pkgdir/usr/lib/$_pkgname"
	chmod a-x "$pkgdir/usr/bin/env" "$pkgdir/usr/bin/vpr_common"
	mv "$pkgdir/usr/bin/env" "$pkgdir/usr/bin/vpr_common" "$pkgdir/usr/lib/$_pkgname"
}

eval "package_$pkgbase-toolchain() {
	$(declare -f "_package-toolchain")
	_package-toolchain
}"

for _device in "${_devices[@]}"; do
	eval "package_$pkgbase-device-$_device() {
		pkgdesc='SymbiFlow device definitions for $_device'
		provides=('$_pkgname-device-$_device')
		conflicts=('$_pkgname-device-$_device')

		_extract_tarball '${_device}_test'
	}"
done
