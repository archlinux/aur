# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Moabeat <moabeat@berlin.de>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
# Contributor: Giorgio Azzinnaro <giorgio@azzinna.ro>

pkgname=icaclient
pkgver=25.08.10.111
pkgrel=1
pkgdesc="Citrix Workspace App (a.k.a. ICAClient, Citrix Receiver)"
arch=(x86_64 aarch64)
url='https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html'
license=(LicenseRef-Citrix)
depends=(alsa-lib curl gst-plugins-base-libs libc++ libc++abi
         libsecret libsoup libvorbis libxaw libxml2-legacy libxp
         openssl speex webkit2gtk)
conflicts=('bin32-citrix-client' 'citrix-client')
options=(!strip)
backup=("opt/Citrix/ICAClient/config/appsrv.ini" "opt/Citrix/ICAClient/config/wfclient.ini" "opt/Citrix/ICAClient/config/module.ini")
_dl_urls_="$(curl -sL "$url" | grep -F ".tar.gz?__gda__")"
_dl_urls="$(echo "$_dl_urls_" | grep -F "$pkgver.tar.gz?__gda__")"
_source64=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxx64-[^"]*)".*$|\1|p')"
_sourceaarch64=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxarm64-[^"]*)".*$|\1|p')"
source=('citrix-configmgr.desktop'
        'citrix-conncenter.desktop'
        'citrix-wfica.desktop'
        'citrix-workspace.desktop'
        'wfica.sh'
        'wfica_assoc.sh'
        'ctxcwalogd.service'
        'ctxusbd.service')
source_x86_64=("$pkgname-x64-$pkgver.tar.gz::$_source64")
source_aarch64=("$pkgname-arm64-$pkgver.tar.gz::$_sourceaarch64")
sha256sums=('643427b6e04fc47cd7d514af2c2349948d3b45f536c434ba8682dcb1d4314736'
            '446bfe50e5e1cb027415b264a090cede1468dfbdc8b55e5ce14e9289b6134119'
            '1dc6d6592fa08c44fb6a4efa0dc238e9e78352bb799ef2e1a92358b390868064'
            'cdfb3a2ef3bf6b0dd9d17c7a279735db23bc54420f34bfd43606830557a922fe'
            'fe0b92bb9bfa32010fe304da5427d9ca106e968bad0e62a5a569e3323a57443f'
            'a3bd74aaf19123cc550cde71b5870d7dacf9883b7e7a85c90e03b508426c16c4'
            '0e3a6c7cf7fa9eee7dcde7356e90ffa1cb312bffc0813a0bf123d2f918dc369d'
            '739da3fca95d07fc3076522acc6b6c1b12b988047bd2fb3c87e37231e49f2e1f')
sha256sums_x86_64=('6dddc2971051260be3256fb068a044df593d78f6a6fa7da91de4a3964be40d1a')
sha256sums_aarch64=('e6c603782849a621eb7a10efebad268d8fe60bc3c6875071f64d86a84c009e6b')
install=citrix-client.install

package() {
    cd "${srcdir}"
    ICAROOT=/opt/Citrix/ICAClient
    if [[ $CARCH == 'x86_64' ]]
    then
        ICADIR="$srcdir/linuxx64/linuxx64.cor"
        PKGINF="Ver.core.linuxx64"
   elif [[ $CARCH == 'aarch64' ]]
    then
        ICADIR="$srcdir/linuxarm64/linuxarm64.cor"
        PKGINF="Ver.core.linuxarm64"
    fi

    mkdir -p "${pkgdir}$ICAROOT"

    cd "$ICADIR"
    install -m755 -t "${pkgdir}$ICAROOT" \
            *.so *.DLL \
            adapter AuthManagerDaemon icasessionmgr NativeMessagingHost \
            PrimaryAuthManager ServiceRecord selfservice UtilDaemon wfica

    # copy common directories
    cp -rt "${pkgdir}$ICAROOT" aml clsync config gtk help icons keyboard keystore lib nls site usb util

    # copy x86_64 only directories
    if [[ $CARCH == 'x86_64' ]]
    then
        cp -rt "${pkgdir}$ICAROOT" bcr ceb
    fi

    # fix permissions
    chmod -R a+r "${pkgdir}$ICAROOT"

    # Install License
    install -m644 -D -t "${pkgdir}$ICAROOT" nls/en.UTF-8/eula.txt
    install -Dm644 nls/en.UTF-8/eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install Version
    install -m644 -D "${srcdir}/PkgId" "${pkgdir}$ICAROOT/pkginf/$PKGINF"

    # create /config/.server to enable user customization using ~/.ICACLient/ overrides. Thanks Tomek
    touch "${pkgdir}$ICAROOT/config/.server"

    # Install wrapper script
    install -m755 "${srcdir}/wfica.sh" "${pkgdir}$ICAROOT/wfica.sh"

    ln -s gst_play1.0 "${pkgdir}/$ICAROOT/util/gst_play"
    ln -s gst_read1.0 "${pkgdir}/$ICAROOT/util/gst_read"

    # Dirty Hack
    # wfica expects {module,wfclient,apssrv}.ini in $ICAROOT/config
    # sadly these configs differ slightly by locale
    lang=${LANG%%_*}
    lang=${lang:-'en'}
    [[ -d "${pkgdir}/$ICAROOT/nls/$lang" ]] || lang='en'
    cp "${pkgdir}$ICAROOT/nls/$lang/module.ini" "${pkgdir}/$ICAROOT/config/"
    cp "${pkgdir}$ICAROOT/nls/$lang/appsrv.template" "${pkgdir}/$ICAROOT/config/appsrv.ini"
    cp "${pkgdir}$ICAROOT/nls/$lang/wfclient.template" "${pkgdir}/$ICAROOT/config/wfclient.ini"

    sed -i \
        -e 's/Ceip=Enable/Ceip=Disable/' \
        -e 's/DisableHeartBeat=False/DisableHeartBeat=True/' \
        "${pkgdir}$ICAROOT/config/module.ini"
    cd "${srcdir}"
    # install freedesktop.org files
    install -Dm644 -t "$pkgdir"/usr/share/applications citrix-{configmgr,conncenter,workspace,wfica}.desktop
    # install scripts
    install -Dm755 -t "${pkgdir}$ICAROOT" wfica.sh wfica_assoc.sh

    chmod +x "${pkgdir}$ICAROOT"/util/{ctx_app_bind,ctxcwalogd,icalicense.sh,setlog}
    if [ $CARCH != 'aarch64' ]
    then
        chmod +x "${pkgdir}$ICAROOT"/util/HdxRtcEngine
    fi

    # install systemd unit files
    install -Dm755 -t "${pkgdir}/usr/lib/systemd/system" "ctxcwalogd.service"
    install -Dm755 -t "${pkgdir}/usr/lib/systemd/system" "ctxusbd.service"
}
