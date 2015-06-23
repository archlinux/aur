# Contributor: Vojtech Kral <vojtech_kral^hk>

pkgname='libopencl'
pkgver=2.0
pkgrel=2
_appsdk_ver='3.0.0'

pkgdesc='AMD OpenCL library and ICD loader'
arch=('i686' 'x86_64')
url="http://developer.amd.com/tools-and-sdks/opencl-zone/amd-accelerated-parallel-processing-app-sdk/"
license=("custom")
install='install'

provides=('libcl')
conflicts=('libcl' 'nvidia-utils')

_agr_url='http://developer.amd.com/amd-license-agreement-appsdk/'

#Architecture resolution

[ "$CARCH" = 'x86_64' ] && _file='AMD-APP-SDK-v3.0-0.113.50-Beta-linux64.tar.bz2' \
                        || _file='AMD-APP-SDK-v3.0-0.113.50-Beta-linux32-1.tar.bz2'

[ "$CARCH" = 'x86_64' ] && _hash='0d806087e5fef7fdfb9372388afe2ff7b382041ba5a23160d58143166005f2d4' \
                        || _hash='0520a2fac0e945195419ec560e7d340cbcb2da3a3412cb2f38584263a7198d35'

_arch="${CARCH/i6/x}"
_bits="${_arch/x86/32}"
_bits="${_bits/32_/}"

_tarball="AMD-APP-SDK-${_appsdk_ver}-${CARCH}.tar.bz2"
_sfx="AMD-APP-SDK-v3.0-0.113.50-Beta-linux${_bits}.sh"
[ "$CARCH" = 'x86_64' ] && _offset=9512 || _offset=9513
_inner='inner.tar.bz2'

_wget()
{
	wget -c -t 3 --waitretry=3 -O - $@
}

prepare()
{
	local fbase nonce1 post_id nonce2 postdata1 postdata2

	echo 'To download AMD APP SDK you need to accept AMD APP SDK license agreement. (To view the license, visit AMD APP SDK website.)'   # IANAL
	read -p "Accept? [y/n] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		msg 'Downloading AMD APP SDK...'

		fbase=$(echo -n $_file | base64)

		echo -n '[nonce1] '
		_wget -nv "$url" > 'nonce1'
		nonce1=$(sed -n -e "/${fbase}/s/.*_nonce\" value=\"\([[:alnum:]]*\)\".*/\1/p;" 'nonce1')
		post_id=$(sed -n -e "/post_id/s/.*value=\"\([[:alnum:]]*\)\".*/\1/p;" 'nonce1' | head -n 1)

		echo -n '[nonce2] '
		postdata1="amd_developer_central_downloads_page_nonce=${nonce1}&_wp_http_referer=%2Ftools-and-sdks%2Fopencl-zone%2Famd-accelerated-parallel-processing-app-sdk%2F&f=${fbase/=/%3D}&post_id=${post_id}"
		nonce2=$(_wget -nv --post-data "${postdata1}" "${_agr_url}" | sed -n -e "/${fbase}/s/.*_nonce\" value=\"\([[:alnum:]]*\)\".*/\1/p;")

		echo -n '[tarball] '
		postdata2="amd_developer_central_nonce=${nonce2}&_wp_http_referer=%2Famd-license-agreement-appsdk%2F&f=${fbase/=/%3D}"
		_wget --post-data "${postdata2}" "${_agr_url}" -O "${_tarball}"

		msg "Validating ${_tarball} files with sha256sum ..."
		echo "${_hash} ${_tarball}" | sha256sum -c || exit 1

		msg "Extracting ${_tarball} ..."
		bsdtar -jxf "${_tarball}"
		dd ibs="${_offset}" skip=1 if="${_sfx}" of="${_inner}" 2> /dev/null
		bsdtar -jxf "${_inner}"
	else
		exit 1
	fi
}

package()
{
	#Install libOpenCL
	#I'm not very sure about so version, so I'm going to cover several cases...
	install -d -m 755 "${pkgdir}/usr/lib"
	install -m 755 "lib/${_arch}/libOpenCL.so.1" "${pkgdir}/usr/lib/libOpenCL.so"
	ln -s 'libOpenCL.so' "${pkgdir}/usr/lib/libOpenCL.so.1"
	ln -s 'libOpenCL.so' "${pkgdir}/usr/lib/libOpenCL.so.2"
	ln -s 'libOpenCL.so' "${pkgdir}/usr/lib/libOpenCL.so.2.0"
	ln -s 'libOpenCL.so' "${pkgdir}/usr/lib/libOpenCL.so.2.0.0"

	#Install license
	install -d -m 755 "${pkgdir}/usr/share/licenses/libopencl"
	install -m 644 'APPSDK-EULA-linux.txt' "${pkgdir}/usr/share/licenses/libopencl"
}
