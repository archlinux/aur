# Maintainer:  ghesy <ehsan at disroot dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
pkgname=${_name}-bin

pkgrel=5
_version=v109.0.5414.74-1
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
	'86daafc3336c39774c6fea25a58979b5117d8c391cbb05ca66da2ced6453f2c9'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_i686=(
	'ea31c2c479c1b2d918a70cd299861a1a3574f505dbdff1066b7dd4a6c491376f'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mips64el=(
	'0aabb88f6504be6bc2162305d2b21eb18a2f60bfa5dbb24f68aad05abf435d9d'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_mipsel=(
	'ece40ed3f33629b62878e7a689524c21a6fd68b8de236a913fb5b3d746156ea4'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_x86_64=(
	'13e564af952acf53263d38697a922b976bd6d05de47b59c87ba0974b37a89666'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
sha256sums_armv7h=(
	'96b08129444a6e8917f589744a6dab284ab4cda8f3ee2663e38098602fea4f6b'
	'd393b4d979ecc1be113122c2d7c59f2f53dcd751ff6dbf59fda3675f6d3e1d33'
	'8124ab508627d36a73167e30c1a7912489b6a08124e3ef71234b1fca2656cd3c'
)
