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
pkgver=26.10.21
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

sha256sums_aarch64=('d1304946c486d98e6b886e9b931eaaaebb23835b30e217638037b7f2721d4e9c'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_i686=('dde802c3c932aa1b8cdc5010de81b54719ff5e334f7c4800354825ed6c9d68b6'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64el=('44e45c2fd113d6a96d63872717348b5c29a86fe15a6bd3abb3395f2d8b6ef7c2'
                     'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                     '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                     'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64le=('c72a434489ef4c0ffb61eeb8ef31a25f584de72dd9fc8943c00e3085d24ba6de'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_riscv64=('3045051037f5f543bd9e4787f331de9e8c83db0a072a26e49ef88512da5bfd48'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64=('e450be9ca747848fad4008bd1bf42ca2b03821b01022737fef286fb48e6acb53'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mipsel=('1e9953aecee4024d9da6427a42929817b53d1660f5122ec6b22629e11cab4012'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64=('b87d3fefa9add100dd9eab8504c1ce81a9f057dfe9dc906f28eb4fb5798833f5'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_arm=('89978508fa2ebb4a1e661f2c6ed51d241c4091b3cd17f4c65fdf20baae7dedac'
                'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_x86_64=('0eec3ed4163c273d8c8bf821f7d219e257921cf584aa3fb970715e458e631978'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_armv7h=('89978508fa2ebb4a1e661f2c6ed51d241c4091b3cd17f4c65fdf20baae7dedac'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_s390x=('12797bc3d865c7339f7722b088d1b0bdbdae179c2e50f41ea2566b0a331d5c6b'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips=('3de6ee6a5142fb1372334ad1411f61f1b0a3f9d622a748a6080a29dc007ba207'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
