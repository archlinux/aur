# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=blackmagic-decklink-sdk
pkgver=10.8.6
pkgrel=1
pkgdesc="Blackmagic DeckLink SDK"
arch=('any')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
provides=('decklink-sdk')
conflicts=('decklink-sdk')
source=('req.json'
        'LICENSE')
sha256sums=('24938595a1f1e8ae6266e8f28c4d3e22386840c426833095e291da11cdf30f1d'
            'cc90e53ac2ef2442d2d0adfe9214119baa31ec080e75c3b087365efdbccc23df')
_srcfile="Blackmagic_DeckLink_SDK_${pkgver}.zip"
_downloadid="0eba1b0f7ffc437a8fdbab6b5e32cd4a"
_srcurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"
_expected_sha256sum="17027e45e09c2cebb14ef75c2f3f619c9b6e0e6f54505a64ac0c2c94b15affa7"

_exit_makepkg() {
	printf "%s\n" "error: failed to ${1} ${_srcfile}"
	exit 1
}

prepare() {
	# check if decklink sdk zip file was already downloaded
	if ! [ -f "../${_srcfile}" ] 
	then
	    # download decklink sdk zip file from website
	    msg2 "Downloading ${_srcfile} from website..."
	    curl \
	        -o "../${_srcfile}" \
	        "$(curl \
	            -s \
	            -d @req.json \
	            -H "Content-Type: application/json;charset=UTF-8" \
	            "$_srcurl" \
	          )" || _exit_makepkg "download"
	else
	    msg2 "Found ${_srcfile}"
	fi
	
	# check integrity of the decklink sdk zip file (file validation)
	msg2 "Validating ${_srcfile} with sha256sum..."
	local _real_sha256sum="$(openssl dgst -sha256 "../${_srcfile}" \
	                             || _exit_makepkg "calculate SHA256 of")"
	_real_sha256sum="${_real_sha256sum##* }"
	printf "%s" "       ${_srcfile} ... "
	if [ "$_expected_sha256sum" = "$_real_sha256sum" ] 
	then
	    printf "%s\n" "Passed"
	else
	    printf "%s\n" "FAILED"
	    exit 1
	fi
	
	# create symbolic link of decklink sdk zip file in $srcdir
	ln -sf "../${_srcfile}" "${srcdir}/${_srcfile}" || _exit_makepkg "create symbolic link of"
	
	# extract decklink sdk zip file
	msg2 "Extracting ${_srcfile} with bsdtar..."
	bsdtar -x -f "${_srcfile}" || _exit_makepkg "extract"
}

package() {
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	
	# includes
	cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}/Linux/include"
	install -D -m644 * "${pkgdir}"/usr/include
	
	# documentation
	cd "${srcdir}/Blackmagic DeckLink SDK ${pkgver}"
	install -D -m644 *.pdf "${pkgdir}/usr/share/doc/${pkgname}"
	
	# license
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
