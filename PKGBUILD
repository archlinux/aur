# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

# Please comment unwanted cmdpack tools in "_utils" section.

pkgbase='cmdpack'
groups="$pkgbase"
_utils=(
# Like below, add # at the beginning of unwanted tools' line.
#	'unwantedtool'
	'bin2iso'
	'bincomp'
	'brrrip'
	'byteshuf'
	'byteswap'
	'cdpatch'
	'ecm'
	'fakecrc'
	'hax65816'
	'id3point'
	'pecompat'
	'rels'
	'screamf'
	'subfile'
	'uips'
	'usfv'
	'vb2rip'
	'wordadd'
	'zerofill'
	'docs' # This is not a utility, it just adds docs and licenses.
	)
for _tool in ${_utils[@]}; do
	pkgname+=("$pkgbase-$_tool")
done
pkgver=1.03
pkgrel=4
pkgdesc="Collection of command line utilities, most for emulation or disk images.
	(${_utils[*]})"
arch=('i686' 'x86_64')
url="http://www.neillcorlett.com/$pkgbase/"
license=('GPL3')
source=(dummy://"${pkgbase}-${pkgver}-src.tar.gz")
md5sums=('79f62f20dc5ccb68d9a130e17798bb7f')

build() {
	cd $srcdir/$pkgbase-$pkgver-src/src/
	for _tool in "${_utils[@]}"; do
		if [[ "$_tool" == "ecm" ]]; then
			gcc $CFLAGS -Wall "$_tool.c" -s -o "bin2ecm"
		elif ! [[ "$_tool" == "docs" ]]; then
			gcc $CFLAGS -Wall "$_tool.c" -s -o "$_tool"
		fi
	done
}

for _tool in "${_utils[@]}"; do
	src_mkdir_eval='mkdir -p ./src/ > /dev/null 2>&1'
	src_ext_ctr_eval='if ! [[ -d "./src/$pkgbase-$pkgver-src/src/" ]]; then bsdtar -xf "'$source'" -C ./src/; fi > /dev/null 2>&1'
	pkg_des_c_eval="sed -n 's/\"$//g;s/^#define TITLE \"$_tool - //p' ./src/\$pkgbase-\$pkgver-src/src/$_tool.c"
	add_pkg_func="package_$pkgbase-$_tool() {
		cd \${srcdir%/*}/
		provides=('$_tool')
		pkgdesc="\`$src_mkdir_eval\`\`$src_ext_ctr_eval\`\`$pkg_des_c_eval\`"
		cd  \$srcdir/\${pkgbase}-\${pkgver}-src/
	"
	if [[ "$_tool" == "bin2iso" ]]; then
		eval "$add_pkg_func
		conflicts=('bin2iso')
		provides=('$pkgbase-$_tool')
		install -Dm0755 ./src/$_tool \${pkgdir}/usr/bin/$_tool
		}"
	elif [[ "$_tool" == "ecm" ]]; then
		eval "$add_pkg_func
		conflicts=('ecm-tools')
		provides=('ecm-tools')
		replaces=('ecm-tools')
		install -Dm0755 ./src/bin2ecm \${pkgdir}/usr/bin/bin2ecm
		ln \${pkgdir}/usr/bin/bin2ecm \${pkgdir}/usr/bin/ecm2bin
		}"
	elif [[ "$_tool" == "zerofill" ]]; then
		eval "$add_pkg_func
		conflicts=('ucommon')
		install -Dm0755 ./src/$_tool \${pkgdir}/usr/bin/$_tool
		}"
	elif [[ "$_tool" == "docs" ]]; then
		eval "package_$pkgbase-$_tool() {
			cd  \$srcdir/\${pkgbase}-\${pkgver}-src/
			pkgdesc='$pkgbase documents'
			install -Dm0644 ./doc/cmdpack.txt \${pkgdir}/usr/share/doc/\${pkgbase}/cmdpack.txt
			install -Dm0644 ./doc/gpl.txt \${pkgdir}/usr/share/licenses/\${pkgbase}/LICENSE
		}"
	else
		eval "$add_pkg_func
		install -Dm0755 ./src/$_tool \${pkgdir}/usr/bin/$_tool
		}"
	fi
done
