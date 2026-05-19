# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin
pkgver=26.3.27
pkgrel=1
pkgdesc='The best v2ray-core, with XTLS support'
url='https://github.com/XTLS/Xray-core'
license=('MPL2')
optdepends=('xray-assets-symlinks')
options=('!strip') # don't modify prebuilt binaries
provides=("${_name}")
conflicts=("${_name}")

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
	"${_name}-v${pkgver}-@ARCH@.zip::${url}/releases/download/v${pkgver}/Xray-linux-@SRCARCH@.zip"
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

sha256sums_aarch64=('4d30283ae614e3057f730f67cd088a42be6fdf91f8639d82cb69e48cde80413c'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_i686=('d1eeb0d9a9106eefd286fbb73595c2dfe1c48c56aa91ba1c9aefe04f188d0927'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64el=('7f660cb026ab9251bd70c30ecf383243d133eb098c57287bf3f4e0c01c66c898'
                     'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                     '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                     'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64le=('2f9ad6c4f35966b1e012c69d601a98bb8b63aba933d303ba6d7b5b67f2ab2acb'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_riscv64=('627ea5870b6fd05d95b7f4ceb5a54d7f2664dd075b30a7ac46ee9a6f9653d6f8'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64=('60be6b12dbfdd7e9ce915165ef337bfcde4cacce26ba2a27d34c4e6470d4ad7b'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mipsel=('fe1ded07a64fe0a406c6c1089f09b6c2999fc2309509ca4c98d93469c0cbf9df'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64=('40432515e6d98033b3934a38dc4f2dac1801e80e3da88c3d230310d17e79dca7'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_arm=('c7265ae13c63ca0241a037df4ef960ad37938c8a67d984cc08834b2cfdf5654b'
                'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_x86_64=('23cd9af937744d97776ee35ecad4972cf4b2109d1e0fe6be9930467608f7c8ae'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_armv7h=('c7265ae13c63ca0241a037df4ef960ad37938c8a67d984cc08834b2cfdf5654b'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_s390x=('a209bcea3df9b0dc1ef5938695679ba1308ad9678a671279d7b1b6c5ceec09c7'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips=('a562f2edbdabc0f1a17eee2226fa9f710e6b61c2d5e2bf3435157b5ce40b1c67'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
