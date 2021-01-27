# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=symbiflow-arch-defs
pkgbase="$_pkgname-nightly-bin"
_buildnum=132
_builddate=20210127-000136
_commit=2af9ab85
pkgver="${_builddate%%-*}.$_buildnum.$_commit"
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
        "synth.tcl-disable-abc9.patch"
        "$_baseurl/$_pkgname-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_pkgname-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            'b6657ddbce1ba8ef0c24666223fefa758ced8619811608b9c4e89ce4904bb96f'
            '8102bbf8169e37e305f73515a3764d216daad725d20ad38f1e363990c9493b59'
            'e3133a27e74cade311489ad5a51936dedd7384621b9f3c6d53da4423ea8fac78'
            '9822a26f45ac0bfa556f1f3d550aad03225802740c21d0fa8c750c2358a76e04'
            '15ce5ca50ceb404b1878eb872162b4b833cfe1a101f9cf85a4da9359b7c841d2'
            'c18599d5116e3f0bbdc93002c159473a452e22af34b07bce12153b24519cb1fa'
            'd2dcbde1165394e87a14d4048a9b3bbe915706eef4e4cb4ce25c0b31d8c778e5'
            '2773fc806735bbc1187bcb2907ecff1a9368c591c63dafbdc7e4995eec72734c'
            'be046d960b688908269575918962d2797770b9c39e7fb876bda9a248668e6112'
            'b0817f795fdd62f096d64f0dd02c96ed1d8d72d949097fa13484fe271554a945')

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

	# https://github.com/SymbiFlow/symbiflow-arch-defs/issues/1973, needs patch adjustment
	[ ! -f "$pkgdir/usr/bin/symbiflow_write_xml_rr_graph" ]

	patch --no-backup-if-mismatch -d "$pkgdir/usr/bin/" -p1 < "$srcdir/wrappers.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/" -p1 < "$srcdir/fix_xc7_carry.py.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p1 < "$srcdir/synth.tcl.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p1 < "$srcdir/synth.tcl-disable-abc9.patch"

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
