# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Eric Liu <eric@hnws.me>
# Contributor: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
# Contributor: Giorgio Azzinnaro <giorgio@azzinna.ro>

pkgname=icaclient
pkgver=21.11.0.20
pkgrel=1
pkgdesc="Citrix Workspace App (a.k.a. ICAClient, Citrix Receiver)"
arch=('x86_64' 'i686' 'armv7h')
url='https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html'
license=('custom:Citrix')
depends=('alsa-lib' 'curl' 'gst-plugins-base-libs' 'gtk2' 'libc++' 'libc++abi' 'libidn11'
         'libjpeg6-turbo' 'libpng12' 'libsecret' 'libsoup' 'libvorbis' 'libxaw' 'libxp'
         'speex' 'webkit2gtk')
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
source=('configmgr.desktop'  'conncenter.desktop'  'selfservice.desktop' 'wfica.desktop' 'wfica.sh' 'wfica_assoc.sh')
source_x86_64=("$pkgname-x64-$pkgver.tar.gz::$_source64")
source_i686=("$pkgname-x86-$pkgver.tar.gz::$_source32")
source_armv7h=("$pkgname-armhf-$pkgver.tar.gz::$_sourcearmhf")
sha256sums=('38e0de641fd374c65c84cb2e82a976595380c32d5f89cff8a25843bdd000d637'
            'cf9aed0c471658665fdc8bc3b8e7583d78834ecb5066d1c287bbcf890d5d14b9'
            '2d84f8cb6f5dfd1a92024b2344cef0affac021327e5ff6ffe579395fffd1fdf4'
            '1dc6d6592fa08c44fb6a4efa0dc238e9e78352bb799ef2e1a92358b390868064'
            'a3da4a2cdc6f8ef7f3f26fe3344f7e6b6ee5cbe1cded77aadd616adc7771adb8'
            'a5b03c48f359cdb3667ca0721c6b4091b97300605d5c9ca959ce072580483c81')
sha256sums_x86_64=('1ef35b14ba281ecf5ef029998d04076b8a15da8ae5e0a36d96eb70684bbd2595')
sha256sums_i686=('32273bcadfcc239a17e56f7e628aab7f86a0ec507031ad6b58a115fe51946521')
sha256sums_armv7h=('c7442fbb7a01dd69cf449d367a8f32cf89589beed05896b90abda9ea4d3dd019')
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
    fi

    mkdir -p "${pkgdir}$ICAROOT"

    cd "$ICADIR"
    install -m755 -t "${pkgdir}$ICAROOT" \
            *.so *.DLL \
            adapter AuthManagerDaemon icasessionmgr NativeMessagingHost \
            PrimaryAuthManager ServiceRecord selfservice UtilDaemon wfica

    # copy directories
    cp -r ./config/ "${pkgdir}$ICAROOT"
    cp -r ./gtk/ "${pkgdir}$ICAROOT"
    cp -r ./help/ "${pkgdir}$ICAROOT"
    cp -r ./keyboard/ "${pkgdir}$ICAROOT"
    cp -r ./keystore/ "${pkgdir}$ICAROOT"
    cp -r ./lib/ "${pkgdir}$ICAROOT"
    cp -r ./icons/ "${pkgdir}$ICAROOT"
    cp -r ./nls/ "${pkgdir}$ICAROOT"
    cp -r ./site/ "${pkgdir}$ICAROOT"
    cp -r ./usb/ "${pkgdir}$ICAROOT"
    cp -r ./util/ "${pkgdir}$ICAROOT"
    # fix permissions
    chmod -R a+r "${pkgdir}$ICAROOT"

    rm "${pkgdir}$ICAROOT/lib/UIDialogLibWebKit.so"

    # Install License
    install -m644 -D nls/en.UTF-8/eula.txt \
            "${pkgdir}$ICAROOT/eula.txt"

    # Install Version
    install -m644 -D "${srcdir}/PkgId" "${pkgdir}$ICAROOT/pkginf/$PKGINF"

    # create /config/.server to enable user customization using ~/.ICACLient/ overrides. Thanks Tomek
    touch "${pkgdir}$ICAROOT/config/.server"

    # Extract system ca-certificates and install in the Citrix cacerts directory
    #cp /etc/ca-certificates/extracted/tls-ca-bundle.pem "${pkgdir}$ICAROOT/keystore/cacerts/"
    #cd "${pkgdir}$ICAROOT/keystore/cacerts/"
    #awk 'BEGIN {c=0;} /BEGIN CERT/{c++} { print > "cert." c ".pem"}' < tls-ca-bundle.pem

    # The following 32-bit library causes false namcap errors
    # rm util/libgstflatstm.32.so

    # Install wrapper script
    install -m755 "${srcdir}/wfica.sh" "${pkgdir}$ICAROOT/wfica.sh"

    ln -s gst_play1.0 "${pkgdir}/$ICAROOT/util/gst_play"
    ln -s gst_read1.0 "${pkgdir}/$ICAROOT/util/gst_read"
    #mkdir -p "${pkgdir}/usr/lib/gstreamer-1.0"
    #ln -s "$ICAROOT/util/libgstflatstm1.0.so" "${pkgdir}/usr/lib/gstreamer-1.0/libgstflatstm.so"
    # Dirty Hack
    # wfica expects {module,wfclient,apssrv}.ini in $ICAROOT/config
    # sadly these configs differ slightly by locale
    lang=${LANG%%_*}
    if [[ ! -d "${pkgdir}/$ICAROOT/nls/$lang" ]]; then
        lang='en'
    fi
    cp "${pkgdir}$ICAROOT/nls/$lang/module.ini" "${pkgdir}/$ICAROOT/config/"
    cp "${pkgdir}$ICAROOT/nls/$lang/appsrv.template" "${pkgdir}/$ICAROOT/config/appsrv.ini"
    cp "${pkgdir}$ICAROOT/nls/$lang/wfclient.template" "${pkgdir}/$ICAROOT/config/wfclient.ini"

    sed -i 's/Ceip=Enable/Ceip=Disable/g' "${pkgdir}$ICAROOT/config/module.ini"
    cd "${srcdir}"
    # install freedesktop.org files
    install -Dm644 wfica.desktop "${pkgdir}/usr/share/applications/wfica.desktop"
    install -Dm644 conncenter.desktop "${pkgdir}/usr/share/applications/conncentre.desktop"
    install -Dm644 configmgr.desktop "${pkgdir}/usr/share/applications/configmgr.desktop"
    install -Dm644 selfservice.desktop "${pkgdir}/usr/share/applications/wfcmgr.desktop"
    # install scripts
    install -Dm755 wfica.sh "${pkgdir}$ICAROOT"
    install -Dm755 wfica_assoc.sh "${pkgdir}$ICAROOT"
    chmod +x "${pkgdir}$ICAROOT/util/HdxRtcEngine"
    chmod +x "${pkgdir}$ICAROOT/util/ctx_app_bind"
    chmod +x "${pkgdir}$ICAROOT/util/ctxlogd"
    chmod +x "${pkgdir}$ICAROOT/util/icalicense.sh"
    chmod +x "${pkgdir}$ICAROOT/util/setlog"

    # make certificates available
    rm -r "${pkgdir}/opt/Citrix/ICAClient/keystore/cacerts"
    ln -s /etc/ssl/certs "${pkgdir}/opt/Citrix/ICAClient/keystore/cacerts"
    #ln -s /usr/share/ca-certificates/trust-source/* "${pkgdir}/opt/Citrix/ICAClient/keystore/cacerts/"
    #c_rehash "${pkgdir}/opt/Citrix/ICAClient/keystore/cacerts/"
}
