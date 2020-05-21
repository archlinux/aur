# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

pkgname=jitsi-meet-stable
_stable_version=4548
_stable_tag=stable/jitsi-meet_${_stable_version}
pkgver=2.0.${_stable_version}
pkgrel=1
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
	"git" "nodejs-lts-erbium" "npm" "python2"
	"jdk8-openjdk"
	"unzip" "maven"
)
options=('!strip')
backup=(
	"etc/jitsi/jicofo/config"
	"etc/jitsi/jicofo/logging.properties"
	"etc/jitsi/jicofo/sip-communicator.properties"
	"etc/jitsi/meet/interface_config.js"
	"etc/jitsi/meet/logging_config.js"
	"etc/jitsi/meet/config.js"
	"etc/jitsi/videobridge/log4j2.xml"
	"etc/jitsi/videobridge/config"
	"etc/jitsi/videobridge/logging.properties"
	"etc/jitsi/videobridge/callstats-java-sdk.properties"
	"etc/jitsi/videobridge/sip-communicator.properties"
)
source=(
	"jitsi-meet::git+https://github.com/jitsi/jitsi-meet#tag=${_stable_tag}"
	"jitsi-videobridge::git+https://github.com/jitsi/jitsi-videobridge#tag=${_stable_tag}"
	"jitsi-jicofo::git+https://github.com/jitsi/jicofo#tag=${_stable_tag}"
	"jicofo.config"
	"jicofo.logging"
	"jicofo.service"
	"jicofo.sip"
	"videobridge.callstats"
	"videobridge.config"
	"videobridge.log4j2.xml"
	"videobridge.logging"
	"videobridge.sip"
	"videobridge.service"
	"sysusers.conf"
        "tmpfiles.conf"
)

_jitsi_videobridge_package=jitsi-videobridge-2.1-SNAPSHOT
_jitsi_jicofo_package=jicofo-1.1-SNAPSHOT

build() {
	echo "Jitsi Meet"
	cd "${srcdir}/jitsi-meet"
	npm install
	make
	make source-package

	echo "Jitsi Videobridge"
	cd "${srcdir}/jitsi-videobridge"
	mvn package -DskipTests -Dassembly.skipAssembly=false

	echo "Jitsi jicofo"
	cd "${srcdir}/jitsi-jicofo"
	mvn package -DskipTests -Dassembly.skipAssembly=false

}

package() {
	echo "Jitsi Meet"
	install -d "${pkgdir}/opt/jitsi/meet"
        tar xjvf "${srcdir}/jitsi-meet/jitsi-meet.tar.bz2" -C "${pkgdir}/opt/jitsi/meet" --strip 1
        for i in interface_config.js logging_config.js config.js
        do
		install -Dm644 "${pkgdir}/opt/jitsi/meet/${i}" "${pkgdir}/etc/jitsi/meet/${i}"
                ln -sf "/etc/jitsi/meet/${i}" "${pkgdir}/opt/jitsi/meet/${i}"
        done
        cp -Rv "${srcdir}/jitsi-meet/resources/prosody-plugins" "${pkgdir}/opt/jitsi/meet-prosody-plugins"

	install -d "${pkgdir}/usr/share/doc/jitsi/meet"
	cp -Rv "${srcdir}/jitsi-meet/doc/debian/jitsi-meet" "${pkgdir}/usr/share/doc/jitsi/meet/web"
	cp -Rv "${srcdir}/jitsi-meet/doc/debian/jitsi-meet-prosody" "${pkgdir}/usr/share/doc/jitsi/meet/prosody"
	cp -Rv "${srcdir}/jitsi-meet/doc/debian/jitsi-meet-turn" "${pkgdir}/usr/share/doc/jitsi/meet/turn"

	echo "Jitsi Videobridge"
	unzip "${srcdir}/jitsi-videobridge/target/${_jitsi_videobridge_package}-archive.zip" -d "${pkgdir}/opt/jitsi/videobridge/"
	mv "${pkgdir}/opt/jitsi/videobridge/${_jitsi_videobridge_package}/"* "${pkgdir}/opt/jitsi/videobridge/"
	rmdir "${pkgdir}/opt/jitsi/videobridge/${_jitsi_videobridge_package}"
        install -dm750 "${pkgdir}/etc/jitsi/videobridge"
        install -Dm644 videobridge.callstats "${pkgdir}/etc/jitsi/videobridge/callstats-java-sdk.properties"
        install -Dm644 videobridge.config "${pkgdir}/etc/jitsi/videobridge/config"
        install -Dm644 videobridge.log4j2.xml "${pkgdir}/etc/jitsi/videobridge/log4j2.xml"
        install -Dm644 videobridge.logging "${pkgdir}/etc/jitsi/videobridge/logging.properties"
        install -Dm644 videobridge.sip "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
	install -Dm644 videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"

	echo "Jitsi Jicofo"
	unzip "${srcdir}/jitsi-jicofo/target/${_jitsi_jicofo_package}-archive.zip" -d "${pkgdir}/opt/jitsi/jicofo/"
	mv "${pkgdir}/opt/jitsi/jicofo/${_jitsi_jicofo_package}/"* "${pkgdir}/opt/jitsi/jicofo/"
	rmdir "${pkgdir}/opt/jitsi/jicofo/${_jitsi_jicofo_package}"
        install -dm750 "${pkgdir}/etc/jitsi/jicofo"
        install -Dm644 jicofo.logging "${pkgdir}/etc/jitsi/jicofo/logging.properties"
        install -Dm644 jicofo.config "${pkgdir}/etc/jitsi/jicofo/config"
        install -Dm644 jicofo.sip "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
        install -Dm644 jicofo.service "${pkgdir}/usr/lib/systemd/system/jicofo.service"

	echo "System"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/jitsi.conf"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/jitsi.conf"

        echo "Fixing"
	find "${pkgdir}/opt/jitsi/meet" -type f -execdir sed -i "s#${srcdir}##g" "{}" \;
	find "${pkgdir}/opt/jitsi/meet" -type d -exec chmod 755 {} \;
	chown -R root:root "${pkgdir}"
}
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'da11776c1e823dc893c3cea9e15431c7'
         '55fff787b77f6801fabd08ea4c64d566'
         '34455146610ba0f451d734a324974eb2'
         '41a92a5b1abe949dd91ee1f5de604431'
         'a6575eaf6f5ab4505aacbe505c171120'
         'dd2498f4460ffe3734cefcedbc02f4da'
         'f62ac7aef622eb407618d4c1ccb8f5b5'
         'b47f8c06d12ac9590f7356681011cca8'
         '2d3dc55845eeb93b8bb7fa2f13e60d6c'
         '40b7878973cda4d430838287cc3ae7e4'
         '223b1691ffb90f295ccc30a879e86330'
         'dd97229e09475221c1fe27d713b63b82')
