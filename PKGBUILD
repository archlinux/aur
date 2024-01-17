# Maintainer: Lari Tikkanen <lartza at outlook dot com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Dominic Finke <arch at realbig dot de>

## To install different language version adjust the following line.
## available: ast, bg, ca, ca-XR, ca-XV, cs, da, de, el, en-GB, en-US, es, eu, fi, fr, gd, gl, he, hi, hu, it, ja, km, ko, lt, nb, nl, pl, pt, pt-BR, ru, SDK, sk, sl, sr, sv, ta, th, tr, vi, zh-CN, zh-TW
_lang=en-US

pkgname=openoffice-bin
_vmaj=4
pkgver=$_vmaj.1.15
pkgrel=1
pkgdesc="The Free and Open Productivity Suite"
arch=('x86_64' 'i686')
url="https://www.openoffice.org"
license=('Apache')
depends=('freetype2'
         'glibc>=2.5'
         'gtk2>=2.10.4'
         'hicolor-icon-theme'
         'desktop-file-utils'
         'shared-mime-info'
         'libxcrypt-compat')
optdepends=('apr-util: adds apr support'
            'java-environment: adds java support'
            'gconf: adds additional gnome support'
            'gstreamer0.10-base: some gstr-plugins to support multimedia content, e.g. in impress'
            'mesa: for the OGLTrans extension of impress'
            'mime-types: provides /etc/mime.types'
            'nss: adds support for signed files/macros'
            'python2: adds python support'
            'raptor1: adds rdf support'
            'sqlite: adds sqlite support')
conflicts=('openoffice-base-bin-unstable')
replaces=('openoffice-base-bin' 'openoffice')
backup=("opt/openoffice$_vmaj/program/sofficerc")
options=(!strip docs)
source_x86_64=("https://downloads.apache.org/openoffice/$pkgver/binaries/$_lang/Apache_OpenOffice_${pkgver}_Linux_x86-64_install-rpm_$_lang.tar.gz")
source_i686=("https://downloads.apache.org/openoffice/$pkgver/binaries/$_lang/Apache_OpenOffice_${pkgver}_Linux_x86_install-rpm_$_lang.tar.gz")
sha256sums_x86_64=('6cbfc129c0e908ed0cb6acfc6a112879f79a1b5e7f3fe476e835e71b81f61073')
sha256sums_i686=('338163ab9105ecfb2bc847e43902bcdc4a9a2826ecbbda2f5e85bb5b909949d2')

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
                echo "Skipping ${file##*/}" >&2
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
        echo "Extracting ${file##*/}"
        bsdtar -xf "${file}"
    done
    echo "Completing package"
    # remove symlink to avoid conflict with libreoffice-common 3.5.2-1
    # (not used in the desktop files)
    [[ -h usr/bin/soffice ]] && rm -f usr/bin/soffice
    # add licenses (found by find pkg -ipath '*license*')
    _ln_s_t usr/share/licenses/${pkgname} '' \
        opt/openoffice$_vmaj/program/LICENSE
    # Fix python shebang calls
    sed -i -re "1s;^#! *(/usr(/local)?)?/bin/(env +)?python(2[^ ]*)?( |$);#!/usr/bin/env python2 ;" $(
        find opt/openoffice$_vmaj/program/python-core-2.7.18/lib -type f -name '*.py'
	)
}
