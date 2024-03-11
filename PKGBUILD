# Maintainer:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin

pkgrel=1
_version=v1.8.9
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
	'36cf68d48105d542aeb4f44e68c82a5deb896bb1339ff2fd7a373c024af5384f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_i686=(
	'692ce554fe100d904dc1976e7a99cc0fdc7be74f3e9c919f11a427a8ba93b716'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64el=(
	'b92317598b7ce8f32c4b9875f7d6e41c28884275c0ccfa2ab40a8c8d4da2425f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64le=(
	'14dcb259d9ffd28f0feafde99c52377a53d29564eef42065ade2f449e6bbda93'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_riscv64=(
	'e450081b4e605e47d40f04ccfd821241c32c1a7e41f445df8ea1a3620b90d16c'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64=(
	'db5975a8042274aec14c41051e4dca8abfad0f3b1e91ab91b9114839c2674596'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mipsel=(
	'73891f7b92892f6ac70548397ae37c1875e6c56301573f2ffef7c97bc86739f5'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64=(
	'87192951a0904f7c660a7ba35443d4d8f96bbc485d0b74cb28826634f04047b8'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_arm=(
	'af659af3cdeec84314e437176e55762ed85e7b87ebcd28de2d2a722c1f870ef7'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_x86_64=(
	'84cf993a859d459ebf1e684fa8f4a7d9cd235a439819661c69af8f447a49e5bd'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_armv7h=(
	'af659af3cdeec84314e437176e55762ed85e7b87ebcd28de2d2a722c1f870ef7'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_s390x=(
	'b25cd05dffad448bd7948f44c41fd69c52414b466a45a72a3e347f1b5ca9bc7b'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips=(
	'a46bea8f773bd075d52b8b149a1421772dbf444bbbd5c6d3cd79b0f6a65f29d8'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
