# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgbase=symbiflow-arch-defs
pkgbase="$_pkgbase-nightly-bin"
_buildnum=190
_builddate=20210318-000555
_commit=9669b55e
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
            '26cdf26b9adabd375b426d83d170a2376fbc8a9ad1d5c7a97f559646c341bc80'
            'badf095978ca0d828972a7b487b235e3f6970bdb43a0b3c710abaa261cd5f10a'
            '9822a26f45ac0bfa556f1f3d550aad03225802740c21d0fa8c750c2358a76e04'
            'f8608ba6c899d8439644a1dd92467d5acca3101ec9f217748fd1d8fe6762f20e'
            'aa7499752dbe33361e28ff7b3c9f8ea05209734449f7d960f177414c1e355243'
            'ebc9ee4710bd3ff46b7f62dc71ca88aea155573ca7a8e0f85bf37c8afcafbda9'
            '37a080e733f012ab64442584251a573ebfda77d1de85fbc78172677faecc34b6'
            'fafdf226645265aa53e1c725906e914a90f89bc7508685031a13b3eb4a932dd6'
            '374446a45756363d026d92d945176eab8fc70cf1941c46df545d9285d2fa8b68')

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
