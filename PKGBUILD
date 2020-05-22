# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

pkgname=jitsi-meet-stable
_stable_version=4548
_stable_tag=stable/jitsi-meet_${_stable_version}
_stable_suffix=stable-jitsi-meet_${_stable_version}
pkgver=2.0.${_stable_version}
pkgrel=6
pkgdesc="Jitsi Meet Stable"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
provides=("jitsi-meet" "jitsi-videobridge" "jicofo" "jitsi-meet-prosody-plugins")
conflicts=("jitsi-meet" "jitsi-videobridge" "jicofo" "jitsi-meet-prosody-plugins")
optdepends=("nginx" "prosody" "coturn")
makedepends=(
        "binutils" "tar"
        "git" "python2"
        "nodejs" "npm"
        "jdk8-openjdk"
        "unzip" "maven"
)
options=('!strip')
backup=(
        "etc/jitsi/jicofo/config"
        "etc/jitsi/jicofo/sip-communicator.properties"
        "etc/jitsi/meet/interface_config.js"
        "etc/jitsi/meet/logging_config.js"
        "etc/jitsi/meet/config.js"
        "etc/jitsi/videobridge/config"
        "etc/jitsi/videobridge/callstats-java-sdk.properties"
        "etc/jitsi/videobridge/sip-communicator.properties"
)
source=(
        "jitsi-meet-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-meet/archive/${_stable_tag}.tar.gz"
        "jicofo-${_stable_suffix}.tar.gz::https://github.com/jitsi/jicofo/archive/${_stable_tag}.tar.gz"
        "jitsi-videobridge-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-videobridge/archive/${_stable_tag}.tar.gz"
        "jicofo.config"
        "jicofo.service"
        "jicofo.sip"
        "videobridge.callstats"
        "videobridge.config"
        "videobridge.sip"
        "videobridge.service"
        "sysusers.conf"
        "tmpfiles.conf"
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
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet" "${pkgdir}/usr/share/doc/jitsi/meet/web"
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet-prosody" "${pkgdir}/usr/share/doc/jitsi/meet/prosody"
        cp -Rv "${srcdir}/jitsi-meet-${_stable_suffix}/doc/debian/jitsi-meet-turn" "${pkgdir}/usr/share/doc/jitsi/meet/turn"

        echo "Jitsi Videobridge"
        unzip "${srcdir}/jitsi-videobridge-${_stable_suffix}/target/${_jitsi_videobridge_package}-archive.zip" -d "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/share/${_jitsi_videobridge_package}" "${pkgdir}/usr/share/jitsi-videobridge"

        install -dm750 "${pkgdir}/etc/jitsi/videobridge"
        install -Dm640 videobridge.callstats "${pkgdir}/etc/jitsi/videobridge/callstats-java-sdk.properties"
        install -Dm640 videobridge.config "${pkgdir}/etc/jitsi/videobridge/config"
        install -Dm640 videobridge.sip "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
        install -Dm640 videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"

        echo "Jitsi Jicofo"
        unzip "${srcdir}/jicofo-${_stable_suffix}/target/${_jitsi_jicofo_package}-archive.zip" -d "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/share/${_jitsi_jicofo_package}" "${pkgdir}/usr/share/jicofo"

        install -dm750 "${pkgdir}/etc/jitsi/jicofo"
        install -Dm640 jicofo.config "${pkgdir}/etc/jitsi/jicofo/config"
        install -Dm640 jicofo.sip "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
        install -Dm640 jicofo.service "${pkgdir}/usr/lib/systemd/system/jicofo.service"

        echo "System"
        install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/jitsi.conf"
        install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/jitsi.conf"

        echo "Fixing"
        chown -R root:root "${pkgdir}"
}
sha256sums=('62e5273726fc9b4d07f30548db06d6b87269ca17cd3c7c9d2b6ee9e06eedfccf'
            'cebbd2ad2c4c3b9826123ab8d49c4a11d34f4e91482e3f06af695e17d1133595'
            '6503869e1b7d4180316a0af29c66fae3e4ed1061d7bd6def053902bcc47194d0'
            'ffba69b658cb8d817936108071f08e02879471953f60db5e968785a78fce771a'
            'fec1ae03cfe978f53812ae0886dcc5650e637bae5c094762d521dd10234d9788'
            'a372d4d3f818b88302ebea2bb2a65641d77cc1aad903989891c329e359bb9467'
            '00c521a4c226deb3bebb8b4b6b68234283888464b889c705001b3371154fc9f0'
            '4cd8d1cbc0d0c8c975eafa554183f85a942aa546a75db0de2adcc91ec59e0ee7'
            '93bf760dd51178b18c9fe3b9edf5124b46e95acbbb15ef25057d733588de71ee'
            '993a48122151312b064c9b74999d454e2a719335c74fb936eb658336169b98a1'
            'fd7ca06f1cf85a6f7578b006b99c18235b5a7e8319b7e08d40e82ad614d20835'
            '77dd2ca3dab9816aaef54f072a411205ad544a5f8695710d27f84b9898c8ba5c')
