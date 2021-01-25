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
        "fix_xc7_carry.py.patch"
        "synth.tcl.patch"
        "wrappers.patch"
        "$_baseurl/$_pkgname-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_pkgname-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            'b6657ddbce1ba8ef0c24666223fefa758ced8619811608b9c4e89ce4904bb96f'
            '8102bbf8169e37e305f73515a3764d216daad725d20ad38f1e363990c9493b59'
            'e3133a27e74cade311489ad5a51936dedd7384621b9f3c6d53da4423ea8fac78'
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
	chmod -R g-ws "$pkgdir"

	install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package-toolchain() {
	pkgdesc="Scripts to invoke the SymbiFlow toolchain"
	depends=('vtr>8.0.0' 'yosys' 'yosys-symbiflow-plugins' 'python' 'python-constraint' 'python-xc-fasm' 'prjxray')
	optdepends=("${_devices[@]/#/$pkgbase-device-}")
	provides=("$_pkgname-toolchain")
	conflicts=("$_pkgname-toolchain")

	_extract_tarball "install"

	rm "$pkgdir/usr/environment.yml"

	patch -d "$pkgdir/usr/bin/" -p1 < "$srcdir/wrappers.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/" -p1 < "$srcdir/fix_xc7_carry.py.patch"
	patch --fuzz=3 -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p1 < "$srcdir/synth.tcl.patch"

	sed -i "s#source \"[^\"]*/env\"#source /usr/lib/$_pkgname/env#" "$pkgdir"/usr/bin/*
	sed -i 's#SHARE_DIR_PATH=.*#SHARE_DIR_PATH=/usr/share/symbiflow/#' "$pkgdir/usr/bin/env"
	sed -i -E 's/^\s*VPR_OPTIONS=(".*")$/read -ra VPR_OPTIONS <<<\1/' "$pkgdir/usr/bin/vpr_common"

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
