# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=cst
pkgname=imx-code-signing-tool
pkgver=3.3.1
pkgrel=1
epoch=
pkgdesc="code signing tool for i.MX platforms"
arch=('x86_64')
url="https://www.nxp.com/webapp/Download?colCode=IMX_CST_TOOL_NEW"
license=('BSD')
groups=()
depends=('python' 'python-cryptography')
makedepends=('byacc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("local://$_pkgname-$pkgver.tgz"
	"position_independent.patch")
noextract=()
sha256sums=('8b7e44e3e126f814f5caf8a634646fe64021405302ca59ff02f5c8f3b9a5abb9'
            '1e86d87a0960269b58e5bd8b6d9b4e1249ecb95152fe36eda43f298f42822e84')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"

	# shebang has to be the first line, *above* the copyrights
	sed -e '1 s^.*^#!/usr/bin/python3^' -i code/ahab_signature_block_parser/parse_sig_blk.py
	sed -e '1 s^.*^#!/bin/bash^' -i code/hab_srktool_scripts/createSRK*

	# undo 3.3.1 changes which break the script for no good reason
	patch -p1 -i $srcdir/position_independent.patch
}

build() {
	cd "$_pkgname-$pkgver"

	OSTYPE=linux64 make -C code/cst/code/obj.linux64 build ENCRYPTION=yes
	make -C code/hab_csf_parser
}

package() {
	cd "$_pkgname-$pkgver"

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp -a LICENSE.bsd3 $pkgdir/usr/share/licenses/$pkgname

	mkdir -p $pkgdir/usr/share/doc/$pkgname/pki_scripts
	cp -a code/ahab_signature_block_parser $pkgdir/usr/share/doc/$pkgname/
	cp -a code/hab_srktool_scripts $pkgdir/usr/share/doc/$pkgname/
	cp -a docs/*.pdf $pkgdir/usr/share/doc/$pkgname/
	cp -a keys/*.sh $pkgdir/usr/share/doc/$pkgname/pki_scripts/

	mkdir -p $pkgdir/usr/bin
	cp -a code/cst/code/obj.linux64/{cst,srktool} $pkgdir/usr/bin/
}
