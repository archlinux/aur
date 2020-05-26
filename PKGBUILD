# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

pkgname=jitsi-meet-stable
_stable_version=4627
_stable_tag=stable/jitsi-meet_${_stable_version}
_stable_suffix=stable-jitsi-meet_${_stable_version}
pkgver=${_stable_version}
pkgrel=2
pkgdesc="Jitsi Meet Stable"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=("java-runtime" "bash")
conflicts=("jitsi-meet" "jitsi-videobridge" "jicofo" "jitsi-meet-prosody-plugins")
optdepends=("nginx" "prosody" "coturn" "lua52" "lua52-sec" "lua52-zlib" "lua52-event")
makedepends=(
        "binutils" "tar"
        "git" "python2"
        "nodejs" "npm"
        "java-environment"
        "unzip" "maven"
)
options=('!strip')
backup=(
  "etc/jitsi/videobridge/config"
  "etc/jitsi/videobridge/log4j2.xml"
  "etc/jitsi/videobridge/logging.properties"
  "etc/jitsi/videobridge/callstats-java-sdk.properties"
  "etc/jitsi/videobridge/sip-communicator.properties"
  "etc/jitsi/meet/logging_config.js"
  "etc/jitsi/meet/config.js"
  "etc/jitsi/meet/interface_config.js"
  "etc/jitsi/jicofo/config"
  "etc/jitsi/jicofo/logging.properties"
  "etc/jitsi/jicofo/sip-communicator.properties"
)
source=(
        "jitsi-meet-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-meet/archive/${_stable_tag}.tar.gz"
        "jicofo-${_stable_suffix}.tar.gz::https://github.com/jitsi/jicofo/archive/${_stable_tag}.tar.gz"
        "jitsi-videobridge-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-videobridge/archive/${_stable_tag}.tar.gz"
        "jicofo.config"
        "jicofo.service"
        "jicofo.sip-communicator.properties"
        "videobridge.callstats-java-sdk.properties"
        "videobridge.config"
        "videobridge.sip-communicator.properties"
        "videobridge.log4j2.xml"
        "videobridge.service"
        "sysusers.conf"
        "tmpfiles.conf"
	"INSTALL.md"
	"sysctl"
)

_jitsi_videobridge_package=jitsi-videobridge-2.1-SNAPSHOT
_jitsi_jicofo_package=jicofo-1.1-SNAPSHOT

build() {
        echo "Jitsi Meet"
        if [ ! -f "${srcdir}/jitsi-meet-${_stable_suffix}/jitsi-meet.tar.bz2" ]
        then
                cd "${srcdir}/jitsi-meet-${_stable_suffix}"
                npm install
                make -j1
                make source-package
        fi

        echo "Jitsi Videobridge"
        if [ ! -f "${srcdir}/jitsi-videobridge-${_stable_suffix}/target/${_jitsi_videobridge_package}-archive.zip" ]
        then
                cd "${srcdir}/jitsi-videobridge-${_stable_suffix}"
                mvn package -DskipTests -Dassembly.skipAssembly=false
        fi

        echo "Jitsi jicofo"
        if [ ! -f "${srcdir}/jicofo-${_stable_suffix}/target/${_jitsi_jicofo_package}-archive.zip" ]
        then
                cd "${srcdir}/jicofo-${_stable_suffix}"
                mvn package -DskipTests -Dassembly.skipAssembly=false
        fi

}

package() {
        install -d "${pkgdir}/usr/share"
        install -d "${pkgdir}/etc/jitsi"

        echo "Jitsi Meet"
        tar xjvf "${srcdir}/jitsi-meet-${_stable_suffix}/jitsi-meet.tar.bz2" -C "${pkgdir}/usr/share/"

	for c in $(ls "${srcdir}/jitsi-meet-${_stable_suffix}/node_modules/i18n-iso-countries/langs")
        do
            install -m644 "${srcdir}/jitsi-meet-${_stable_suffix}/node_modules/i18n-iso-countries/langs/${c}" "${pkgdir}/usr/share/jitsi-meet/lang/countries-${c}"
        done

        find "${pkgdir}/usr/share/jitsi-meet" -type f -execdir sed -i "s#${srcdir}##g" "{}" \;
        find "${pkgdir}/usr/share/jitsi-meet" -type d -exec chmod 755 {} \;

        for i in interface_config.js logging_config.js config.js
        do
                install -Dm644 "${pkgdir}/usr/share/jitsi-meet/${i}" "${pkgdir}/etc/jitsi/meet/${i}"
                ln -sf "/etc/jitsi/meet/${i}" "${pkgdir}/usr/share/jitsi-meet/${i}"
        done
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/resources/prosody-plugins" "${pkgdir}/usr/share/jitsi-meet-prosody-plugins"

        install -d "${pkgdir}/usr/share/doc/jitsi/meet"
        install -m644 INSTALL.md "${pkgdir}/usr/share/doc/jitsi/meet/INSTALL.md"
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet" "${pkgdir}/usr/share/doc/jitsi/meet/web"
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet-prosody" "${pkgdir}/usr/share/doc/jitsi/meet/prosody"
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet-turn" "${pkgdir}/usr/share/doc/jitsi/meet/turn"

        echo "Jitsi Videobridge"
        unzip "${srcdir}/jitsi-videobridge-${_stable_suffix}/target/${_jitsi_videobridge_package}-archive.zip" -d "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/share/${_jitsi_videobridge_package}" "${pkgdir}/usr/share/jitsi-videobridge"

        install -dm750 "${pkgdir}/etc/jitsi/videobridge"
	for p in callstats-java-sdk.properties config log4j2.xml sip-communicator.properties
	do
		install -Dm640 "videobridge.${p}" "${pkgdir}/etc/jitsi/videobridge/${p}"
	done
	install -Dm640 "${srcdir}/jitsi-videobridge-${_stable_suffix}/lib/logging.properties" "${pkgdir}/etc/jitsi/videobridge/logging.properties"
        install -Dm644 videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"

        echo "Jitsi Jicofo"
        unzip "${srcdir}/jicofo-${_stable_suffix}/target/${_jitsi_jicofo_package}-archive.zip" -d "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/share/${_jitsi_jicofo_package}" "${pkgdir}/usr/share/jicofo"

        install -dm750 "${pkgdir}/etc/jitsi/jicofo"
        for p in config	sip-communicator.properties
	do
		install -Dm640 "jicofo.${p}" "${pkgdir}/etc/jitsi/jicofo/${p}"
	done
	install -Dm640 "${srcdir}/jicofo-${_stable_suffix}/lib/logging.properties" "${pkgdir}/etc/jitsi/jicofo/logging.properties"
        install -Dm644 jicofo.service "${pkgdir}/usr/lib/systemd/system/jicofo.service"

        echo "System"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/jitsi.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/jitsi.conf"
	install -Dm644 "sysctl" "${pkgdir}/etc/sysctl.d/jitsi-videobridge.conf"

        echo "Fixing"
        chown -R root:root "${pkgdir}"
}
sha256sums=('0c4a44205cf8e646d2423bfbff2e368128c31ccf1420bf622e25e915d52ed0e6'
            'eaf298ee6c7c8e394ff58075e8f5f3d5791952ed2b6a1cac5596dad34113736d'
            'a9f57668426341ddc74518e0442b8514841898bef45e1f22c9252ac593d567a0'
            'fdd4dee8e2aefa17ecc7b4cddbddd5bf91bb05469a64ab0650846584a90ed3a2'
            'fec1ae03cfe978f53812ae0886dcc5650e637bae5c094762d521dd10234d9788'
            'f295f5f8ee13edd019defc037c60e04c6ea2d30e69cc4a896c010b8570f5efab'
            '00c521a4c226deb3bebb8b4b6b68234283888464b889c705001b3371154fc9f0'
            '46f686cd8ea6bb5f1ec6055d2f16cc72db4baf9d90dea234d10e661b50924624'
            'cc9fbf77497bce3c9673b2d144928f11cdd0c0823940c2b60c8369a2f086b9b7'
            '9fe70e519caa85471799e90749d390dfba561eb0be13ea1307a5efd777e63382'
            '993a48122151312b064c9b74999d454e2a719335c74fb936eb658336169b98a1'
            'fd7ca06f1cf85a6f7578b006b99c18235b5a7e8319b7e08d40e82ad614d20835'
            '77dd2ca3dab9816aaef54f072a411205ad544a5f8695710d27f84b9898c8ba5c'
            '5790339f823d1040480cad3bc04eab8f06112271e9b6c6fb3a090176b1a1e815'
            '192ebadf43c9b0bc22b3bdbc2b8f440aaf302fce919ccef43b62fa74bf34a14d')
