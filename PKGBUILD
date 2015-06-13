# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

_pkgname=wps-office
_pkgver=9.1.0.4961~a18p1
_srcurl="http://kdl.cc.ksosoft.com/wps-community/download/a18"
_common_dirs=(./etc ./usr ./opt/kingsoft/wps-office/office6/{addins,cfgs,data,dicts,mui,res,skins})

pkgbase=wpsforlinux
pkgname=('wpsoffice-common'
         'wpsoffice')
pkgver=${_pkgver/\~/_}
pkgrel=1
arch=('any')
groups=('wpsforlinux')
license=('custom:Kingsoft')
url='http://wps-community.org/'
conflicts=('wps-office' 'kingsoft-office')
options=(!emptydirs !strip)

[[ "$CARCH" = "i686" ]] && _archext=i386 || _archext=amd64
source=("${_srcurl}/${_pkgname}_${_pkgver}_${_archext}.deb" 'wps-office.xml' 'check_data.sh')
sha1sums=('8c593dd34baf0e481378ed696334e3d7f853906a'
          'dfa2ae8b74ac763d6d7e1d28e33dcb289bca9112'
          '1819bae14fa888f92c29c9fd01b59246f53e6937')
[[ "$CARCH" = "i686" ]] && sha1sums[0]='753d1843ec6cfd1fb6144c175cd31afc788c3224'

#PKGEXT='.pkg.tar' ##reduce the time of compression

_etMT="MimeType=application\/wps-office.et;application\/wps-office.ett;application\/vnd.ms-excel;\
application\/vnd.openxmlformats-officedocument.spreadsheetml.template;\
application\/vnd.openxmlformats-officedocument.spreadsheetml.sheet;\
text\/csv;"
_wppMT="MimeType=application\/wps-office.dps;application\/wps-office.dpt;application\/vnd.ms-powerpoint;\
application\/vnd.openxmlformats-officedocument.presentationml.presentation;\
application\/vnd.openxmlformats-officedocument.presentationml.slideshow;\
application\/vnd.openxmlformats-officedocument.presentationml.template;"
_wpsMT="MimeType=application\/wps-office.wps;application\/wps-office.wpt;\
application\/msword;application\/msword-template;application\/rtf;\
application\/vnd.openxmlformats-officedocument.wordprocessingml.template;\
application\/vnd.openxmlformats-officedocument.wordprocessingml.document;"

package_wpsoffice-common() {
    arch=('any')
    pkgdesc="Common files and license for WPS office."

    cd "$srcdir"
    # _common_dirs
    tar xv -C "${pkgdir}" -f data.tar.xz ${_common_dirs[@]}

    msg2 "editing mime files: wps-office-{et,wpp,wps}.xml ..."
    rm $pkgdir/usr/share/mime/packages/wps-office-{wps,wpp,et}.xml
    install -Dm644 wps-office.xml $pkgdir/usr/share/mime/packages/wps-office.xml

    msg2 "editing desktop files: wps-office-{et,wpp,wps}.desktop, with shared-mime-info ..."
    #_et
    sed -i "s/^MimeType.*$/$_etMT/" $pkgdir/usr/share/applications/wps-office-et.desktop
    #_wpp
    sed -i "s/^MimeType.*$/$_wppMT/" $pkgdir/usr/share/applications/wps-office-wpp.desktop
    #_wps
    sed -i "s/^MimeType.*$/$_wpsMT/" $pkgdir/usr/share/applications/wps-office-wps.desktop
    cd $pkgdir/usr/share/applications/
    if grep -r -I -l $'^\xEF\xBB\xBF' *.desktop 2>&1 >/dev/null; then
        msg2 "Remove BOM (Byte-order mark) in utf-8 .desktop files ..."
        sed -i 's/^\xEF\xBB\xBF//;' *.desktop
    fi

    # license
    install -Dm644 "$pkgdir/opt/kingsoft/wps-office/office6/mui/default/EULA.txt" \
        "$pkgdir/usr/share/licenses/${_pkgname}/EULA.txt"
}

package_wpsoffice() {
    arch=('i686' 'x86_64')
    pkgdesc='WPS Office, including Writer, Presentation and Spreadsheets, is a powerful office productivity suite. (no fonts)'
    depends=('fontconfig' 'libpng12' 'glib2' 'libsm' 'libxext' 'libxrender' 'libxml2' 'desktop-file-utils' 'shared-mime-info' 'xdg-utils' "wpsoffice-common=${pkgver}")
    optdepends=('cups: for printing support'
                'pango: for complex (right-to-left) text support')
    install=wpsoffice.install 
    
    cd "${srcdir}"
    tar xv -C "${pkgdir}" -f data.tar.xz ${_common_dirs[@]/\.\//--exclude=\.\/}
}
