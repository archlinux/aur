# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase=symbiflow-arch-defs
pkgbase="$_pkgbase-nightly-bin"
_buildnum=200
_builddate=20210324-020513
_commit=1c7a3d1e
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
        "0001-Fix-PLLE2_BASE-techmap.patch"
        "$_baseurl/$_pkgbase-install-$_commit.tar.xz")
for _d in "${_devices[@]}"; do
	source+=("$_baseurl/$_pkgbase-${_d}_test-$_commit.tar.xz")
done
noextract=("${source[@]##*/}")
sha256sums=('0726ddf229165179fe21da0c97884eeddf88be32dcfc13abf9b2eced0dbafad6'
            'b6657ddbce1ba8ef0c24666223fefa758ced8619811608b9c4e89ce4904bb96f'
            '26cdf26b9adabd375b426d83d170a2376fbc8a9ad1d5c7a97f559646c341bc80'
            'badf095978ca0d828972a7b487b235e3f6970bdb43a0b3c710abaa261cd5f10a'
            '9822a26f45ac0bfa556f1f3d550aad03225802740c21d0fa8c750c2358a76e04'
            'b030be41442550e87e75b1cda575ed52e5334314c5e19219870e77c0edaaa8c9'
            '095d6660d4da4869b11c38a69725a7252b1a31fe0f108c025d4d1a710dceb676'
            'f3982ada4e7d6eb01e2fa0f26060ecb25b1eda4bd3a4c5e7d136d77e9aff30d5'
            'e646c7f89cd1ad883cc662529ea88d2ef2559c4ca356b42d5b0c03bbf62d8039'
            'a35be25b4dd752b1ca0f8a0cfb915034673d9c208b350cb20afe94b28abe42c7'
            'd6d11b66ddcb66fc2a0697a814e0a9f4f92a5587ec0c4dd3ecd6a2f2e289cb29'
            'af0f04c538f2772b99c67b227a5057b7dcb5041ebb2dfe72d939fb32be45226c')

pkgname=("$pkgbase-toolchain" "${_devices[@]/#/$pkgbase-device-}")

_extract_tarball() {
	install -dm755 "$pkgdir/usr"
	bsdtar -C "$pkgdir/usr" -xof "$_pkgbase-$1-$_commit.tar.xz"
	chmod -R g-ws "$pkgdir"

	install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package-toolchain() {
	pkgdesc="Scripts to invoke the SymbiFlow toolchain"
	depends=('vtr>8.0.0' 'yosys' 'yosys-symbiflow-plugins' 'python' 'python-constraint' 'python-xc-fasm' 'prjxray-tools')
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
	patch -d "$pkgdir/usr/share/symbiflow/techmaps/xc7_vpr/" -p3 < "$srcdir/0001-Fix-PLLE2_BASE-techmap.patch"

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
