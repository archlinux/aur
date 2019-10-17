# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Dominic Finke <arch at realbig dot de>

## To install different language version adjust the following line.
## available: ast, bg, ca, ca-XR, ca-XV, cs, da, de, el, en-GB, en-US, es, eu, fi, fr, gd, gl, he, hi, hu, it, ja, km, ko, lt, nb, nl, pl, pt, pt-BR, ru, SDK, sk, sl, sr, sv, ta, th, tr, vi, zh-CN, zh-TW
_lang=en-US

pkgname=openoffice
_vmaj=4
_vmin=1.7
pkgver=$_vmaj.$_vmin
pkgrel=1
_path=opt/$pkgname$_vmaj
pkgdesc="Apache OpenOffice"
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('Apache')
depends=('freetype2'
         'glibc>=2.5'
         'gtk2>=2.10.4'
         'hicolor-icon-theme'
         'desktop-file-utils'
         'shared-mime-info')
optdepends=('apr-util: adds apr support'
            'java-environment: adds java support'
            'gconf: adds additional gnome support'
            'gstreamer0.10-base: some gstr-plugins to support multimedia content, e.g. in impress'
            'mesa: for the OGLTrans extension of impress'
            'mime-types: provides /etc/mime.types'
            'nss: adds support for signed files/macros'
            'openoffice-de-bin: adds additional German language pack'
            'python2: adds python support'
            'raptor1: adds rdf support'
            'sqlite: adds sqlite support')
conflicts=('openoffice-base-bin-unstable')
replaces=('openoffice-base-bin')
backup=("$_path/program/sofficerc")
options=(!strip docs)
_durl="http://apache.org/dist/$pkgname/$pkgver/binaries/$_lang/Apache_OpenOffice_${pkgver}_Linux_x86"
source_i686=("v$pkgver-i686::${_durl}_install-rpm_en-US.tar.gz")
source_x86_64=("v$pkgver-x86_64::${_durl}-64_install-rpm_en-US.tar.gz")
md5sums_i686=('650016711ab925eb0350c4d2fbbecd92')
md5sums_x86_64=('f71d8bbc7c1901e808e7c5d5e6eaa051')

_source_dirs=$_lang/RPMS

_find_rpms() {
    local dir file
    for dir in "${_source_dirs[@]}"; do
        dir=${srcdir:-src}/${dir}
        ( cd "${dir}" ) # check existing
        for file in $( find "${dir}" -type f -name '*.rpm' ); do
            if ! [[ $file == */desktop-integration/* && $file != *-freedesktop-menus-* ]] &&
                ! [[ $file == */jre-* ]]; then
                echo "${file}"
            elif type -p msg >/dev/null; then
                msg "Skipping ${file##*/}" >&2
            else
                echo "Skipping ${file##*/}" >&2
            fi
        done
    done
}

_ln_s_t() {
    local dir=$1 prefix=$2
    shift 2
    mkdir -p "$dir"
    local file
    for file in "${@}"; do
        readlink -v -e "${file}" >/dev/null # check existing
        ln -s -T /"${file}" "${dir}/${prefix}${file##*/}"
    done
}

package() {
    cd $pkgdir
    local file
        for file in $( _find_rpms ); do
        msg "Extracting ${file##*/}"
        bsdtar -xf "${file}"
    done
    msg2 "Completing package"
    # remove symlink to avoid conflict with libreoffice-common 3.5.2-1
    # (not used in the desktop files)
    [[ -h usr/bin/soffice ]] && rm -f usr/bin/soffice
    # add licenses (found by find pkg -ipath '*license*')
    _ln_s_t usr/share/licenses/${_pkgname} '' \
        $_path/program/LICENSE
    # Fix python shebang calls
    sed -i -re "1s;^#! *(/usr(/local)?)?/bin/(env +)?python(2[^ ]*)?( |$);#!/usr/bin/env python2 ;" $(
        find $_path/program/python-core-2.7.6/lib -type f -name '*.py'
	)
}
