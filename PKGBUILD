# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase=symbiflow-arch-defs
pkgbase="$_pkgbase-nightly-bin"
_buildnum=142
_builddate=20210203-000107
_commit=4f62d7ae
pkgver="${_builddate%%-*}.$_buildnum.$_commit"
pkgrel=1
pkgdesc="Documentation of various FPGA architectures - latest binary snapshot"
arch=(any)
url="https://github.com/SymbiFlow/symbiflow-arch-defs"
license=('ISC')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
_baseurl="https://storage.googleapis.com/$_pkgbase/artifacts/prod/foss-fpga-tools/$_pkgbase/continuous/install/$_buildnum/$_builddate"
_devices=(xc7a50t xc7a100t xc7a200t xc7z010 xc7z020)
source=("https://raw.githubusercontent.com/SymbiFlow/$_pkgbase/$_commit/COPYING"
        "fix_xc7_carry.py.patch"
        "synth.tcl.patch"
        "wrappers.patch"
        "synth.tcl-disable-abc9.patch"
        "$_baseurl/$_pkgbase-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_pkgbase-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            'b6657ddbce1ba8ef0c24666223fefa758ced8619811608b9c4e89ce4904bb96f'
            '8102bbf8169e37e305f73515a3764d216daad725d20ad38f1e363990c9493b59'
            'fe688bb3b9264990106376551c902da84f8e63f5ad16ade474abd2a755a4d3e9'
            '9822a26f45ac0bfa556f1f3d550aad03225802740c21d0fa8c750c2358a76e04'
            'd06710aa18fddc8ffafdb97d5c9955ad17ae510bc00bb662b6d3048502c08d76'
            'd7952d3295de3a1ce23afec5992bc4a8b0e167b79ce661e4f3a0f7f02e0320ff'
            '531a19369dd442287d919f8cdcf552ac308da4d80358bca9ea259e9c0ccfd302'
            '5bf1e6053244f467e6124d33cb760843b47a3c6903b6275295f676731bb5a516'
            'f38916e81ba0046b7c4c6bcbda4a2b820c4e611755ea56d10847df04b5bff475'
            '481eaa727cab89409b130d61ae2e277cba71703279dcb0a13576c4b684fc2d80')

pkgname=("$pkgbase-toolchain" "${_devices[@]/#/$pkgbase-device-}")

_extract_tarball() {
	install -dm755 "$pkgdir/usr"
	bsdtar -C "$pkgdir/usr" -xof "$_pkgbase-$1-$_commit.tar.xz"
	chmod -R g-ws "$pkgdir"

	install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package-toolchain() {
	pkgdesc="Scripts to invoke the SymbiFlow toolchain"
	depends=('vtr>8.0.0' 'yosys' 'yosys-symbiflow-plugins' 'python' 'python-constraint' 'python-xc-fasm' 'prjxray')
	optdepends=("${_devices[@]/#/$pkgbase-device-}")
	provides=("$_pkgbase-toolchain")
	conflicts=("$_pkgbase-toolchain")

	_extract_tarball "install"

	rm "$pkgdir/usr/environment.yml"

	# https://github.com/SymbiFlow/symbiflow-arch-defs/issues/1973, needs patch adjustment
	[ ! -f "$pkgdir/usr/bin/symbiflow_write_xml_rr_graph" ]

	patch --no-backup-if-mismatch -d "$pkgdir/usr/bin/" -p1 < "$srcdir/wrappers.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/" -p1 < "$srcdir/fix_xc7_carry.py.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p1 < "$srcdir/synth.tcl.patch"
	patch -d "$pkgdir/usr/share/symbiflow/scripts/xc7/" -p1 < "$srcdir/synth.tcl-disable-abc9.patch"

	sed -i "s#source \"[^\"]*/env\"#source /usr/lib/$_pkgbase/env#" "$pkgdir"/usr/bin/*
	sed -i 's#SHARE_DIR_PATH=.*#SHARE_DIR_PATH=/usr/share/symbiflow/#' "$pkgdir/usr/bin/env"
	sed -i -E 's/^\s*VPR_OPTIONS=(".*")$/read -ra VPR_OPTIONS <<<\1/' "$pkgdir/usr/bin/vpr_common"

	install -dm755 "$pkgdir/usr/lib/$_pkgbase"
	chmod a-x "$pkgdir/usr/bin/env" "$pkgdir/usr/bin/vpr_common"
	mv "$pkgdir/usr/bin/env" "$pkgdir/usr/bin/vpr_common" "$pkgdir/usr/lib/$_pkgbase"
}

eval "package_$pkgbase-toolchain() {
	$(declare -f "_package-toolchain")
	_package-toolchain
}"

for _device in "${_devices[@]}"; do
	eval "package_$pkgbase-device-$_device() {
		pkgdesc='SymbiFlow device definitions for $_device'
		provides=('$_pkgbase-device-$_device')
		conflicts=('$_pkgbase-device-$_device')

		_extract_tarball '${_device}_test'
	}"
done
