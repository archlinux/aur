# Maintainer: Arnaud Dovi <mr.dovi@gmail.com
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
# Contributor: Giorgio Azzinnaro <giorgio@azzinna.ro>

pkgver=24.2.0.65
pkgname=icaclient-beta
pkgrel=2
arch=('x86_64' 'armv7h')
license=('custom:Citrix')
depends=('alsa-lib' 'curl' 'gst-plugins-base-libs' 'gtk2' 'libc++' 'libc++abi' 'libidn11'
         'libjpeg6-turbo' 'libpng12' 'libsecret' 'libsoup' 'libvorbis' 'libxaw' 'libxp'
         'openssl' 'speex' 'webkit2gtk')
optdepends=('xerces-c: gtk2 configuration manager'
            'webkit2gtk: gtk2 selfservice/storefront ui'
            'libc++: for HDXTeams'
            'libappindicator-gtk3: observed since 2308')
conflicts=('bin32-citrix-client' 'citrix-client' 'icaclient')
options=(!strip)
backup=("opt/Citrix/ICAClient/config/appsrv.ini" "opt/Citrix/ICAClient/config/wfclient.ini" "opt/Citrix/ICAClient/config/module.ini")
_artefactid=icaclient
source=('citrix-configmgr.desktop'
        'citrix-conncenter.desktop'
        'citrix-wfica.desktop'
        'citrix-workspace.desktop'
        'wfica.sh'
        'wfica_assoc.sh')
sha256sums=('643427b6e04fc47cd7d514af2c2349948d3b45f536c434ba8682dcb1d4314736'
            '446bfe50e5e1cb027415b264a090cede1468dfbdc8b55e5ce14e9289b6134119'
            '1dc6d6592fa08c44fb6a4efa0dc238e9e78352bb799ef2e1a92358b390868064'
            'cdfb3a2ef3bf6b0dd9d17c7a279735db23bc54420f34bfd43606830557a922fe'
            'fe0b92bb9bfa32010fe304da5427d9ca106e968bad0e62a5a569e3323a57443f'
            'a3bd74aaf19123cc550cde71b5870d7dacf9883b7e7a85c90e03b508426c16c4')
install=citrix-client.install

pkgver() {
    _url="https://www.citrix.com/downloads/workspace-app/betas-and-tech-previews/workspace-app-tp-for-linux.html"
    _body="$(curl -sL "${_url}")"
    _pkgver="$(grep -oP "(?<=linuxx64-)\d+\.\d+\.\d+\.\d+(?=\.tar\.gz\?__gda__)" <<< "${_body}")" || true
    if [[ -n "${_pkgver}" ]]; then
        _dl_urls="$(grep -F ".tar.gz?__gda__" <<< "${_body}")"
        _type="Technology Preview"
    else
        _url="https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html"
        _body="$(curl -sL "${_url}")"
        _pkgver="$(grep -oP "(?<=linuxx64-)\d+\.\d+\.\d+\.\d+(?=\.tar\.gz\?__gda__)" <<< "${_body}")"
        _dl_urls="$(grep -F ".tar.gz?__gda__" <<< "${_body}")"
        if [[ -n "${_pkgver}" ]]; then
            _type="Release"
        fi
    fi

    if [[ -n "${_pkgver}" ]]; then
        if [[ "$1" == "init" ]]; then
            _s64=https:"$(sed -En 's|^.*rel="(//.*/linuxx64-[^"]*)".*$|\1|p' <<< "${_dl_urls}")"
            _sarmhf=https:"$(sed -En 's|^.*rel="(//.*/linuxarmhf-[^"]*)".*$|\1|p' <<< "${_dl_urls}")"
            printf "%s %s %s %s" "${_s64}" "${_sarmhf}" "${_type}" "${_url}"
        else
            printf "%s" "${_pkgver}"
        fi
    else
        printf "FATAL ERROR : version nout found, report to package author"
        exit 1
    fi
}
read -r _source64 _sourcearmhf _pkgtype _url <<< $(pkgver init)
source_x86_64=("$_artefactid-x64.tar.gz::$_source64")
source_armv7h=("$_artefactid-armhf.tar.gz::$_sourcearmhf")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
pkgdesc="Citrix Workspace App (a.k.a. ICAClient, Citrix Receiver) [$_pkgtype]"
url="$_url"

package() {
    cd "${srcdir}"
    ICAROOT=/opt/Citrix/ICAClient
    if [[ $CARCH == 'x86_64' ]]
    then
        ICADIR="$srcdir/linuxx64/linuxx64.cor"
        PKGINF="Ver.core.linuxx64"
    elif [[ $CARCH == 'armv7h' ]]
    then
        ICADIR="$srcdir/linuxarmhf/linuxarmhf.cor"
        PKGINF="Ver.core.linuxarmhf"
    fi

    # Creating the package base
    install -d "${pkgdir}"/{opt,usr/bin}
    install -d "${pkgdir}$ICAROOT"

    cd "$ICADIR"
    install -m755 -t "${pkgdir}$ICAROOT" \
            *.so *.DLL \
            adapter AuthManagerDaemon icasessionmgr NativeMessagingHost \
            PrimaryAuthManager ServiceRecord selfservice UtilDaemon wfica

    # TODO To rewrite exclusive not inclusive?
    # copy directories
    #cp -rt "${pkgdir}$ICAROOT" PKCS#11 aml bcr ceb clsync config desktop gtk help icons keyboard keystore lib nls site usb util
    for dir in */; do for file in $(find $dir -type f); do install -Dm755 "$file" "${pkgdir}/$ICAROOT/$file"; done done
    # Install License
    install -Dm644 -t "${pkgdir}$ICAROOT" nls/en.UTF-8/eula.txt

    # Install Version
    install -Dm644 "${srcdir}/PkgId" "${pkgdir}$ICAROOT/pkginf/$PKGINF"

    # create /config/.server to enable user customization using ~/.ICACLient/ overrides. Thanks Tomek
    touch "${pkgdir}$ICAROOT/config/.server"

    # Install wrapper script
    install -m755 "${srcdir}/wfica.sh" "${pkgdir}$ICAROOT/wfica.sh"

    # Setting up /usr/bin launchers
    ln -s gst_play1.0 "${pkgdir}/$ICAROOT/util/gst_play"
    ln -s gst_read1.0 "${pkgdir}/$ICAROOT/util/gst_read"
    ln -s /opt/Citrix/ICAClient/wfica "$pkgdir"/usr/bin/wfica
    ln -s /opt/Citrix/ICAClient/selfservice "$pkgdir"/usr/bin/selfservice
    ln -s /opt/Citrix/ICAClient/util/storebrowse "$pkgdir"/usr/bin/storebrowse
    ln -s /opt/Citrix/ICAClient/util/setlog "$pkgdir"/usr/bin/setlog
    ln -s /opt/Citrix/ICAClient/util/ctxcwalogd "$pkgdir"/usr/bin/ctxcwalogd
    ln -s /opt/Citrix/ICAClient/util/ctx_rehash "$pkgdir"/usr/bin/ctx_rehash
    ln -s /opt/Citrix/ICAClient/util/conncenter "$pkgdir"/usr/bin/conncenter
    ln -s /opt/Citrix/ICAClient/util/configmgr "$pkgdir"/usr/bin/configmgr
    ln -s /opt/Citrix/ICAClient/util/gst_play "$pkgdir"/usr/bin/gst_play
    ln -s /opt/Citrix/ICAClient/util/gst_read "$pkgdir"/usr/bin/gst_read

    # User configurations
    lang=${LANG%%_*}
    [[ -d "${pkgdir}/$ICAROOT/nls/$lang" ]] || lang='en'
    cp "${pkgdir}$ICAROOT/nls/$lang/module.ini" "${pkgdir}/$ICAROOT/config/"
    cp "${pkgdir}$ICAROOT/nls/$lang/appsrv.template" "${pkgdir}/$ICAROOT/config/appsrv.ini"
    cp "${pkgdir}$ICAROOT/nls/$lang/wfclient.template" "${pkgdir}/$ICAROOT/config/wfclient.ini"

    # install freedesktop.org files
    cd "${srcdir}"
    install -Dm644 -t "$pkgdir"/usr/share/applications citrix-{configmgr,conncenter,workspace,wfica}.desktop

    # install scripts
    install -Dm755 -t "${pkgdir}$ICAROOT" wfica.sh wfica_assoc.sh
    chmod +x "${pkgdir}$ICAROOT"/util/{HdxRtcEngine,ctx_app_bind,ctxcwalogd,icalicense.sh,setlog}
}
