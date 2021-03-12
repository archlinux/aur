# Maintainer: Eric Liu <eric@hnws.me>
# former Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
# Contributor: Giorgio Azzinnaro <giorgio@azzinna.ro>
pkgname=icaclient
pkgver=21.03
pkgrel=1
pkgdesc="Citrix Workspace App for x86_64 (64bit) Linux (ICAClient, Citrix Receiver)"
arch=('x86_64' 'i686' 'armv7h')
url='https://www.citrix.com/downloads/workspace-app/linux/'
license=('custom:Citrix')
depends=('alsa-lib' 'libvorbis' 'curl' 'gtk2' 'libpng12' 'libxaw' 'libxp' 'speex' 'libjpeg6-turbo' 'libsoup' 'gst-plugins-base-libs' 'libidn11')
makedepends=('automake' 'autoconf' 'wget')
optdepends=(
  'xerces-c: gtk2 configuration manager'
  'webkit2gtk: gtk2 selfservice/storefront ui'
  'libc++: for HDXTeams')
conflicts=('bin32-citrix-client' 'citrix-client')
options=(!strip)
backup=("opt/Citrix/ICAClient/config/appsrv.ini" "opt/Citrix/ICAClient/config/wfclient.ini" "opt/Citrix/ICAClient/config/module.ini")
source_url32="http:$(curl -L -silent 'https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html' | awk -F 'rel=\"' '/linuxx86-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
source_url64="http:$(curl -L -silent 'https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html' | awk -F 'rel=\"' '/linuxx64-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
source_urlarmhf="http:$(curl -L -silent 'https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html' | awk -F 'rel=\"' '/linuxarmhf-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
source=('configmgr.desktop'  'conncenter.desktop'  'selfservice.desktop' 'wfica.desktop' 'wfica.sh' 'wfica_assoc.sh')
source_i686=($pkgname-x86-$pkgver.tar.gz::$source_url32)
source_x86_64=($pkgname-x64-$pkgver.tar.gz::$source_url64)
source_armv7h=($pkgname-armhf-$pkgver.tar.gz::$source_urlarmhf)
md5sums=('71aca6257f259996ac59729604f32978'
         'a38c3f844a0fefe8017a25bee213b843'
         '0e92c33b3fcc99b04269787da2984809'
         '1f214f6f456f59afd1a3275580f4240e'
         '59f8e50cc0e0c399d47eb7ace1df5a32'
         'dca5a1f51449ef35f1441b900d622276')
sha256sums_x86_64=('ec0faaed2855af0a939f4f549a73108cca1de5febde8bcb14e890644fb7e9700')
sha256sums_i686=('c38a82da2458882f88f55ec53ca09f11f50d2b4f1f2084436d251445c649d686')
sha256sums_armv7h=('737b0c8a2e9f451f25e7a8f21e619cd4c4a3d05091bb94912d0305e08d79ca99')
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
    install -m755 wfica *.so *.DLL AuthManagerDaemon PrimaryAuthManager ServiceRecord selfservice "${pkgdir}$ICAROOT"

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
