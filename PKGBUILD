# Maintainer:  ghesy <ehsan at disroot dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
pkgname=${_name}-bin

pkgrel=1
_version=v113.0.5672.62-2
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
	'862f408bb78acbb5db5b8bca8b8e4a3f6e32e3fee045906ebe73b0373b12fae3'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_i686=(
	'5807993f6530b5ac93b366ae8a66f7217e7922ab79bcb4569d95767074f4153e'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mips64el=(
	'70ac125104302e2d8ccfd0edcf7ebc4e3fd6e19b784bb70b7c43c6321e1b3ed6'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mipsel=(
	'e1f8dfcb045fb88f9ebd98a98efbdf9139642b595b603383b7d64180da3bf9ec'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_x86_64=(
	'e56f981f84534dfdfdb085cee6df571f55c9fae44badc2b7c140876ad44a2167'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_armv7h=(
	'cbf955c65178486585f951befee2f173e06931dae0e3202d3ec4229b64ac6a5d'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
