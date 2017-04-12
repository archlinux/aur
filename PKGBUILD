# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=pingo
pkgver=0.79g
pkgrel=1
pkgdesc="An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (uses wine)"
arch=('i686' 'x86_64')
url="http://css-ig.net/pingo/"
license=('unknown')
depends=('wine')
options=('!strip')
source=("https://raw.githubusercontent.com/bermond/shellutils/master/image/${pkgname}")
sha256sums=('454d976b5b8fdf146f19228ddec5e532f22eabe68d825ac44a153584db2646e9')
_expected_sha256sum="e421bbeb32468bf72ce73fb3b53be5b327553f00a866778aa6c32234b5e9267e"
_srcfile="pingo-${pkgver}.zip"
_srcurl="https://css-ig.net/downloads/${pkgname}.zip"

_exit_makepkg() {
	printf "%s\n" "error: failed to ${1} ${_srcfile}"
	exit 1
}

prepare() {
	# check if pingo zip file was already downloaded
	if ! [ -f "../${_srcfile}" ] 
	then
	    # download pingo zip file from website
	    msg2 "Downloading ${_srcfile} from website..."
	    curl \
	        -o "../${_srcfile}" \
	        -H 'Host: css-ig.net' \
	        -H 'Upgrade-Insecure-Requests: 1' \
	        -H "User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
	                        AppleWebKit/537.36 (KHTML, like Gecko) \
	                        Chrome/57.0.2987.98 \
	                        Safari/537.36" \
	        -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
	        -H 'Referer: https://css-ig.net/pingo.php' \
	        -H 'Accept-Language: en-US,en;q=0.8' \
	        -H 'Cookie: HttpOnly; startBAK=R3415749199; HttpOnly; start=R3918429717' \
	        --compressed \
	        "$_srcurl" || _exit_makepkg "download"
	else
	    msg2 "Found ${_srcfile}.zip"
	fi
	
	# check the pingo zip file integrity (file validation)
	msg2 "Validating ${_srcfile} with sha256sum..."
	local _real_sha256sum="$(openssl dgst -sha256 "../${_srcfile}" \
	                             || _exit_makepkg "calculate SHA256 of")"
	_real_sha256sum="${_real_sha256sum##* }"
	printf "%s" "     ${_srcfile} ... "
	if [ "$_expected_sha256sum" = "$_real_sha256sum" ] 
	then
	    printf "%s\n" "Passed"
	else
	    printf "%s\n" "FAILED"
	    exit 1
	fi
	
	# create symbolic link of pingo zip file in $srcdir
	ln -sf "../${_srcfile}" "${srcdir}/${_srcfile}" || _exit_makepkg "create symbolic link of"
	
	# extract pingo zip file
	mkdir -p "${pkgname}-${pkgver}"
	cd       "${pkgname}-${pkgver}"
	bsdtar -x -f ../"${_srcfile}" || _exit_makepkg "extract"
}

package() {
	install -D -m755 "$pkgname"                            "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "$pkgname"-"${pkgver}/${pkgname}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
}
