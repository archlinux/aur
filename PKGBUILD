# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>
# Contributor: vchuravy (download  execution)

pkgname="amd-adl-sdk"
pkgver=9.0
pkgrel=1
pkgdesc="API to access display driver functionality for AMD graphics cards."
arch=('i686' 'x86_64')
url="http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
license=('AMD-ADL')
depends=('catalyst-utils' 'gcc')
install=${pkgname}.install
options=('!strip')

_source=("ADL_SDK9.zip")
_sha256sums=('7a0d304e9198d3eae1f98989f9eb06bb83db487802748957490626af15827878')



prepare() {
    warning "Installing this package means that you have red, understood and ACCEPTED"
    warning "the license agreement posted at http://developer.amd.com/amd-license-agreement/"
    warning ""
    warning "will sleep 5 sec to make sure you red it :P"
    sleep 5
    warning "Download will take not much time and echo some random letters, prepare yourself"
    
    # Original script from https://github.com/gregvw/amd_sdk/

    # Location from which get nonce and file name from
    URL="http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
#     URLDOWN="http://developer.amd.com/amd-license-agreement-appsdk/"
    URLDOWN="http://developer.amd.com/amd-license-agreement/"

    NONCE1_STRING='name="amd_developer_central_downloads_page_nonce"'
    FILE_STRING='name="f"'
    POSTID_STRING='name="post_id"'
    NONCE2_STRING='name="amd_developer_central_nonce"'

#     FORM=`wget -qO - $URL | sed -n '/download-1/,/64-bit/p'`
    FORM=`wget -qO - $URL | sed -n '/download-1/,/${_source}/p'`

    # Get nonce from form
    NONCE1=`echo $FORM | awk -F ${NONCE1_STRING} '{print $2}'`
    NONCE1=`echo $NONCE1 | awk -F'"' '{print $2}'`
    echo $NONCE1

    # get the postid
    POSTID=`echo $FORM | awk -F ${POSTID_STRING} '{print $2}'`
    POSTID=`echo $POSTID | awk -F'"' '{print $2}'`
    echo $POSTID

    # get file name
    FILE=`echo $FORM | awk -F ${FILE_STRING} '{print $2}'`
    FILE=`echo $FILE | awk -F'"' '{print $2}'`
    echo $FILE

    FORM=`wget -qO - $URLDOWN --post-data "amd_developer_central_downloads_page_nonce=${NONCE1}&f=${FILE}&post_id=${POSTID}"`

    NONCE2=`echo $FORM | awk -F ${NONCE2_STRING} '{print $2}'`
    NONCE2=`echo $NONCE2 | awk -F'"' '{print $2}'`
    echo $NONCE2

    wget --content-disposition --trust-server-names $URLDOWN --post-data "amd_developer_central_nonce=${NONCE2}&f=${FILE}" -O ${_source};

        msg "Validating ${_source} files with sha256sum ..."
        echo "${_sha256sums} ${srcdir}/${_source}" | sha256sum -c || exit 1
        
        cd ${srcdir}/
        unzip ${_source}

        sed -i -e '/include/a \#include <wchar.h>' ${srcdir}/include/adl_structures.h
        sed -i -e '/include/a \#include <stdbool.h>' ${srcdir}/include/adl_sdk.h
}

build() {
    cd ${srcdir}/adlutil
    gcc main.c -o adlutil -DLINUX -ldl -I ../include/
}

package() {
    install -m755 -d ${pkgdir}/usr/bin
    install -m755 ${srcdir}/adlutil/adlutil ${pkgdir}/usr/bin

    install -m755 -d ${pkgdir}/usr/include/ADL
    install -m644 ${srcdir}/include/* ${pkgdir}/usr/include/ADL

    install -m755 -d ${pkgdir}/usr/share/doc/ADL
    mv -v ${srcdir}/Public-Documents ${srcdir}/Sample ${srcdir}/Sample-Managed ${srcdir}/ADL_SDK.html ${pkgdir}/usr/share/doc/ADL
}