# Maintainer:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin

pkgrel=1
_version=v1.8.4
pkgver=${_version//-/_}
pkgver=${pkgver#v}

pkgdesc='The best v2ray-core, with XTLS support'
url='https://github.com/XTLS/Xray-core'
license=('MPL2')

depends=('xray-assets-symlinks')
options=('!strip') # don't modify prebuilt binaries
provides=("${_name}")
conflicts=("${_name}")

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
	"${_name}-${_version}-@ARCH@.zip::${url}/releases/download/${_version}/Xray-linux-@SRCARCH@.zip"
	config.json
	xray.service.tmpl
	xray-sysusers.conf
)

# architectures and their counterparts used in the source URL
declare -Ag _archmap=(
#	[ARCH]=SRCARCH
	['i686']='32'
	['x86_64']='64'
	['arm']='arm32-v7a'
	['armv7h']='arm32-v7a'
	['aarch64']='arm64-v8a'
	['mips']='mips32'
	['mipsel']='mips32le'
	['mips64']='mips64'
	['mips64el']='mips64le'
	['ppc64']='ppc64'
	['ppc64le']='ppc64le'
	['riscv64']='riscv64'
	['s390x']='s390x'
)

# config file's path
_config="/etc/xray/config.json"
backup=("${_config#/}")

# generate systemd services from the template
prepare()
{
	# regular service
	TMPL_CONFIG_FILE_PATH="${_config}" \
		_envsubst xray.service.tmpl xray.service

	# multi-instance service (http://0pointer.net/blog/projects/instances.html)
	TMPL_CONFIG_FILE_PATH="${_config%/*}/%i.${_config##*.}" \
		_envsubst xray.service.tmpl xray@.service
}

package()
{
	install -Dm644 xray.service  -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 xray@.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 xray-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/xray.conf"

	install -Dm644 config.json   "${pkgdir}${_config}"
	install -Dm755 xray          "${pkgdir}/usr/bin/xray"
	install -Dm644 README.md     "${pkgdir}/usr/share/doc/xray/USAGE.txt"
	install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
	'be6b28548551d9fd357b147f74b163dfc14408e7f75cbf4ba788995dabc33d75'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_i686=(
	'da7b07d2cc241da7f5d9951732b0746b3733e8aafbf5bfdee5bc76c993ca0aae'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64el=(
	'b4c1bd85c31606b727e1933b912ed6ff540e752bc4b682a199314e14de0604dc'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64le=(
	'49a6afde35b7c95edf2703d16569e93dba9102a953f86eba496776cb6819edfb'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_riscv64=(
	'2c7685821185c231ea100fe09c0823e1cb0ff1d47a52c521c78fb15facf68203'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64=(
	'9669eeca90030b9010567257b957b9d92e725236608eabfd5af45e5385cf7868'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mipsel=(
	'c69964ff6da638ee6645f6f381e8aa2ea6c9a1be8148299fda14c6c7c0d8c844'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64=(
	'9e532dda28d6632a281313cbfed882321a1bd0a68644f1414a853449410ea439'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_arm=(
	'09e4544546b4e2abaa4cfcc517ea858bc2dd7ce6cdb253026d5434b701cef485'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_x86_64=(
	'2a855f610008a598b88424435aefaee1df2c1b0fa1296d4f8f60080b528c9971'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_armv7h=(
	'09e4544546b4e2abaa4cfcc517ea858bc2dd7ce6cdb253026d5434b701cef485'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_s390x=(
	'6ebe8c448b1a183dc584f92ff66c482c7bc332c88f9fd77cbefc1c8f77887613'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips=(
	'3a010e929b9f1b07490e12649ebb5478c56e5d7a6e8cff265425004dec038fba'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
