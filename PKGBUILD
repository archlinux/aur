# Maintainer:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
pkgname=${_name}-bin

pkgrel=1
_version=v121.0.6167.71-1
pkgver=${_version//-/_}
pkgver=${pkgver#v}

pkgdesc='Camouflage network traffic with strong censorship resistence and low detectability'
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
	'94a76e1cc28e7a55bc6c5694cf941649dd260e9dd7d8ddec986dd0cb41073c1c'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_i686=(
	'430e4d403bd209f2c97a4e397cab431f2f815ae01ccd546c97455b0e78021b15'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mips64el=(
	'171a35d1f2801558ddc17f692ceebae2cfa3b818f4cac7f400f53eed3cff2c4b'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mipsel=(
	'3f57fe191e1834dd035138a9a9c936efb49565a808cd44f19e10dd5dc01334e6'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_x86_64=(
	'a91a1ce57143d6daae6851b8efed7c140a24bbe7699aa54fd63b494aab51413a'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_armv7h=(
	'855f4525fc79bcd66385cb3e31576292c828840aa89a5f651b5448657d8ed0b1'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
