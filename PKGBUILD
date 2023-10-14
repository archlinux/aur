# Maintainer:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
pkgname=${_name}-bin

pkgrel=1
_version=v118.0.5993.65-1
pkgver=${_version//-/_}
pkgver=${pkgver#v}

pkgdesc='Camouflage network traffic with strong censorship resistence and low detectablility'
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')

provides=("${_name}")
conflicts=("${_name}")
depends=('gcc-libs')
options=('!strip') # don't modify prebuilt binaries

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
	"${_name}-${_version}-@ARCH@.tar.xz::${url}/releases/download/${_version}/naiveproxy-${_version}-linux-@SRCARCH@.tar.xz"
	naiveproxy.service.tmpl
	naiveproxy-sysusers.conf
)

# architectures and their counterparts used in the source URL
declare -Ag _archmap=(
#	[ARCH]=SRCARCH
	['x86_64']='x64'
	['i686']='x86'
	['aarch64']='arm64'
	['armv7h']='arm'
	['mips64el']='mips64el'
	['mipsel']='mipsel'
)

# config file's path
_config="/etc/naiveproxy/config.json"
backup=("${_config#/}")

# generate systemd services from the template
prepare()
{
	# regular service
	TMPL_CONFIG_FILE_PATH="${_config}" \
		_envsubst naiveproxy.service.tmpl naiveproxy.service

	# multi-instance service (http://0pointer.net/blog/projects/instances.html)
	TMPL_CONFIG_FILE_PATH="${_config%/*}/%i.${_config##*.}" \
		_envsubst naiveproxy.service.tmpl naiveproxy@.service
}

package()
{
	install -Dm644 naiveproxy.service  -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 naiveproxy@.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 naiveproxy-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/naiveproxy.conf"

	cd "naiveproxy-${_version}-linux-${_archmap[$CARCH]}"

	install -Dm644 config.json     "${pkgdir}${_config}"
	install -Dm755 naive           "${pkgdir}/usr/bin/naiveproxy"
	install -Dm644 USAGE.txt       "${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt"
	install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# boilerplate for generating the "arch=()" and "source_<arch>=()" arrays
arch=("${!_archmap[@]}")
for _a in "${!_archmap[@]}"; do
	_sa=${_archmap[$_a]}
	_s=("${_source[@]//@ARCH@/$_a}")
	_s=("${_s[@]//@SRCARCH@/$_sa}")
	declare -ag "source_${_a}="'("${_s[@]}")'
done

# wrapper function for envsubst
_envsubst()
{
	local in=$1 out=$2 vars=("${!TMPL_@}")
	envsubst "${vars[*]/#/'$'}" < "$in" > "$out"
	grep -q '\${\?TMPL_[A-Z_]\+' "$out" && {
		echo "error: template file has unsubstituted references: '$in'" >&2
		rm "$out"
		return 1
	} ||:
}

sha256sums_aarch64=(
	'a1f267b3f22f16d5f76cb20ebd93df519843f02ef5e60040af9acc3e7ec8ac1e'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_i686=(
	'c1d9919563da7b1c0c135d42b2f4f811b8406e756a781e2c2005e8011265f3dd'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mips64el=(
	'891774f3611eed0fdd7da05415aacd195770bcfbe8674884c4abae976a48044e'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mipsel=(
	'f81fed6885f8f05c2f078aeb5cbcf964e421ee5ecb8b99608971e88d330e67c8'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_x86_64=(
	'b7f25743f6423f8c4547d6d18554a8c130644d621387e2876942e54751f575b6'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_armv7h=(
	'4f2870226c96a8085ea4295ddfb706a93d75f2ba892c461da3ddb62eb24d09e6'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
