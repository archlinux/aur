# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Moabeat <moabeat@berlin.de>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
# Contributor: Giorgio Azzinnaro <giorgio@azzinna.ro>

pkgname=icaclient
pkgver=23.9.0.24
pkgrel=1
pkgdesc="Citrix Workspace App (a.k.a. ICAClient, Citrix Receiver)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html'
license=('custom:Citrix')
depends=('alsa-lib' 'curl' 'gst-plugins-base-libs' 'gtk2' 'libc++' 'libc++abi' 'libidn11'
         'libjpeg6-turbo' 'libpng12' 'libsecret' 'libsoup' 'libvorbis' 'libxaw' 'libxp'
         'openssl' 'speex' 'webkit2gtk')
optdepends=('xerces-c: gtk2 configuration manager'
            'webkit2gtk: gtk2 selfservice/storefront ui'
            'libc++: for HDXTeams')
conflicts=('bin32-citrix-client' 'citrix-client')
options=(!strip)
backup=("opt/Citrix/ICAClient/config/appsrv.ini" "opt/Citrix/ICAClient/config/wfclient.ini" "opt/Citrix/ICAClient/config/module.ini")
_dl_urls_="$(curl -sL "$url" | grep -F ".tar.gz?__gda__")"
_dl_urls="$(echo "$_dl_urls_" | grep -F "$pkgver.tar.gz?__gda__")"
_source32=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxx86-[^"]*)".*$|\1|p')"
_source64=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxx64-[^"]*)".*$|\1|p')"
_sourcearmhf=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxarmhf-[^"]*)".*$|\1|p')"
_sourceaarch64=https:"$(echo "$_dl_urls" | sed -En 's|^.*rel="(//.*/linuxarm64-[^"]*)".*$|\1|p')"
source=('citrix-configmgr.desktop'
        'citrix-conncenter.desktop'
        'citrix-wfica.desktop'
        'citrix-workspace.desktop'
        'wfica.sh'
        'wfica_assoc.sh')
source_x86_64=("$pkgname-x64-$pkgver.tar.gz::$_source64")
source_i686=("$pkgname-x86-$pkgver.tar.gz::$_source32")
source_armv7h=("$pkgname-armhf-$pkgver.tar.gz::$_sourcearmhf")
source_aarch64=("$pkgname-arm64-$pkgver.tar.gz::$_sourceaarch64")
sha256sums=('643427b6e04fc47cd7d514af2c2349948d3b45f536c434ba8682dcb1d4314736'
            '446bfe50e5e1cb027415b264a090cede1468dfbdc8b55e5ce14e9289b6134119'
            '1dc6d6592fa08c44fb6a4efa0dc238e9e78352bb799ef2e1a92358b390868064'
            'cdfb3a2ef3bf6b0dd9d17c7a279735db23bc54420f34bfd43606830557a922fe'
            'fe0b92bb9bfa32010fe304da5427d9ca106e968bad0e62a5a569e3323a57443f'
            'a3bd74aaf19123cc550cde71b5870d7dacf9883b7e7a85c90e03b508426c16c4')
sha256sums_x86_64=('7b06339654aa27258d6dfa922828b43256e780b282d07109f452246c7aa27514')
sha256sums_i686=('95436fb289602cf31c65b7df89da145fc170233cb2e758a2f11116f15b57d382')
sha256sums_armv7h=('0f349aeaf6c466a873750af785138ae6b446b01f640cde686d9369d492ac7c00')
sha256sums_aarch64=('b66c9abfd78d57d88027068c35a1ec468a99e4102005ef63d8fb805081067a78')
install=citrix-client.install

package() {
    cd "${srcdir}"
    ICAROOT=/opt/Citrix/ICAClient
    if [[ $CARCH == 'i686' ]]
    then
        ICADIR="$srcdir/linuxx86/linuxx86.cor"
        PKGINF="Ver.core.linuxx86"
    elif [[ $CARCH == 'x86_64' ]]
    then
        ICADIR="$srcdir/linuxx64/linuxx64.cor"
        PKGINF="Ver.core.linuxx64"
    elif [[ $CARCH == 'armv7h' ]]
    then
        ICADIR="$srcdir/linuxarmhf/linuxarmhf.cor"
        PKGINF="Ver.core.linuxarmhf"
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

    rm "${pkgdir}$ICAROOT/lib/UIDialogLibWebKit.so"

    # Install License
    install -m644 -D -t "${pkgdir}$ICAROOT" nls/en.UTF-8/eula.txt

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
    if [ $CARCH != 'armv7h' ] && [ $CARCH != 'aarch64' ]
    then
        chmod +x "${pkgdir}$ICAROOT"/util/HdxRtcEngine
    fi
}
