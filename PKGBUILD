# Maintainer:  ghesy <ehsan at disroot dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin

pkgrel=1
_version=v1.7.5
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
	'21b8a35dd35ca3f5e54f48f8cdbfc4868fe102658f47e3bf7668b81f8510c173'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_i686=(
	'86dba0f1a1e13b36cdd90902ddf257f35e2d3db3b64641e8da65e26306968657'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64el=(
	'bcd1b1fe7375caa73cf33cac7d7b62a22f5e22d04d2b651257ef3961a3fcccd4'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64le=(
	'35e2c9d648539b7dacd21bcd1e7a686d595098d7cd6bafb0db1df2e651f5565d'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_riscv64=(
	'07bedd462d8ba0942296dbd7068da72a57e091a535ee5b8f7c25c8097fa69572'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64=(
	'807c93d833292923c5fc43049407de33840cb4d1e325079227ede9eccb615059'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mipsel=(
	'14d935dd582ad50b07c57a6a1189b1b536ea4721bab101dd7b5b575cac0e728a'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64=(
	'efe48688605626973f58e62ebb586b77401dcae47b00bedcff137d21445938e2'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_arm=(
	'596318d55e83dffda40f070c0f3c3450b5a693bd76aa4175b922104ce21343bb'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_x86_64=(
	'd621476ffb84d472717b03dd633d40ae6f1a0d8431f85ffcf44ff11224373453'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_armv7h=(
	'596318d55e83dffda40f070c0f3c3450b5a693bd76aa4175b922104ce21343bb'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_s390x=(
	'2ebe9ba54433a7e97b14b1731c813c17818fadf61159aad84734a16bc7949c79'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips=(
	'e4d139a55ae09e771c2ced64bf97a8561c88d81f01c15789e34ebd2782eb1d4f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
