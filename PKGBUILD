# Maintainer:  koonix <me at koonix dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
pkgname=${_name}-bin

pkgrel=1
_version=v116.0.5845.92-2
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
	'42c98a1d44e99ec7a5d74583fdfee3a1dbf200aa260877f1177ef6d6bdd2d777'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_i686=(
	'd92c0e2bdb4aa3312f6f6ae267bf0d7e426a8d58da4d2db2a14b69d1cc2c8f8a'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mips64el=(
	'50ea96f6a3e0f19c372356c9bb7586577b364e9de6dbfe1e427c491934807d84'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mipsel=(
	'06cdc19554a1b865491400dabe31100a6de71f4ff5e4a1418e6f0c81f05c193b'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_x86_64=(
	'41aad5078ddfc402db63bb6647e0787a6f8df527f6882be71f04c9c983921dc1'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_armv7h=(
	'4ffeb7c152c97e9c6108a01d319a222e99e43e9aea071254a952d2af0baca698'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
