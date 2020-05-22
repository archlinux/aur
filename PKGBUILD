# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

pkgname=jitsi-meet-stable
_stable_version=4548
_stable_tag=stable/jitsi-meet_${_stable_version}
_stable_suffix=stable-jitsi-meet_${_stable_version}
pkgver=2.0.${_stable_version}
pkgrel=4
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
	"jitsi-meet-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-meet/archive/${_stable_tag}.tar.gz"
	"jicofo-${_stable_suffix}.tar.gz::https://github.com/jitsi/jicofo/archive/${_stable_tag}.tar.gz"
	"jitsi-videobridge-${_stable_suffix}.tar.gz::https://github.com/jitsi/jitsi-videobridge/archive/${_stable_tag}.tar.gz"
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
	cd "${srcdir}/jitsi-meet-${_stable_suffix}"
	npm install
	make -j1
	make source-package

	echo "Jitsi Videobridge"
	cd "${srcdir}/jitsi-videobridge-${_stable_suffix}"
	mvn package -DskipTests -Dassembly.skipAssembly=false

	echo "Jitsi jicofo"
	cd "${srcdir}/jicofo-${_stable_suffix}"
	mvn package -DskipTests -Dassembly.skipAssembly=false

}

package() {
	install -d "${pkgdir}/usr/share"

	echo "Jitsi Meet"
	install -d "${pkgdir}/usr/share/jitsi-meet"
        tar xjvf "${srcdir}/jitsi-meet-${_stable_suffix}/jitsi-meet.tar.bz2" -C "${pkgdir}/usr/share/jitsi-meet" --strip 1
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
	unzip "${srcdir}/jitsi-videobridge-${_stable_suffix}/target/${_jitsi_videobridge_package}-archive.zip" -d "${pkgdir}/usr/share/jitsi-videobridge/"
	mv "${pkgdir}/usr/share/jitsi-videobridge/${_jitsi_videobridge_package}/"* "${pkgdir}/usr/share/jitsi-videobridge/"
	rmdir "${pkgdir}/usr/share/jitsi-videobridge/${_jitsi_videobridge_package}"
        install -dm750 "${pkgdir}/etc/jitsi/videobridge"
        install -Dm640 videobridge.callstats "${pkgdir}/etc/jitsi/videobridge/callstats-java-sdk.properties"
        install -Dm640 videobridge.config "${pkgdir}/etc/jitsi/videobridge/config"
        install -Dm640 videobridge.log4j2.xml "${pkgdir}/etc/jitsi/videobridge/log4j2.xml"
        install -Dm640 videobridge.logging "${pkgdir}/etc/jitsi/videobridge/logging.properties"
        install -Dm640 videobridge.sip "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
	install -Dm640 videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"

	echo "Jitsi Jicofo"
	unzip "${srcdir}/jicofo-${_stable_suffix}/target/${_jitsi_jicofo_package}-archive.zip" -d "${pkgdir}/usr/share/jicofo/"
	mv "${pkgdir}/usr/share/jicofo/${_jitsi_jicofo_package}/"* "${pkgdir}/usr/share/jicofo/"
	rmdir "${pkgdir}/usr/share/jicofo/${_jitsi_jicofo_package}"
        install -dm750 "${pkgdir}/etc/jitsi/jicofo"
        install -Dm640 jicofo.logging "${pkgdir}/etc/jitsi/jicofo/logging.properties"
        install -Dm640 jicofo.config "${pkgdir}/etc/jitsi/jicofo/config"
        install -Dm640 jicofo.sip "${pkgdir}/etc/jitsi/jicofo/sip-communicator.properties"
        install -Dm640 jicofo.service "${pkgdir}/usr/lib/systemd/system/jicofo.service"

	echo "System"
	install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/jitsi.conf"
	install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/jitsi.conf"

        echo "Fixing"
	find "${pkgdir}/usr/share/jitsi-meet" -type f -execdir sed -i "s#${srcdir}##g" "{}" \;
	find "${pkgdir}/usr/share/jitsi-meet" -type d -exec chmod 755 {} \;
	chown -R root:root "${pkgdir}"
}
md5sums=('c3c89157484d207255657584f9ccdd14'
         '9e36dee75bbc18c6b51e7c57d03d1a63'
         '5ef864648f331d4acd1f0192ff4da286'
         'e6d4de29cfe539145e46561b5777abae'
         '55fff787b77f6801fabd08ea4c64d566'
         '174e5d903511efbf7b30a67eca174f24'
         '41a92a5b1abe949dd91ee1f5de604431'
         'a6575eaf6f5ab4505aacbe505c171120'
         '91bbea367b03828885f6ed4ceea36342'
         'e8e37cc544d1d71b86d5b576ca36eb8d'
         'b47f8c06d12ac9590f7356681011cca8'
         '2d3dc55845eeb93b8bb7fa2f13e60d6c'
         '38582c553d4e3c82f114773719c9124f'
         '4566feec4aa70e81f2b822e90fb9691d'
         'a000f728fe5e4cdecc13b738dd262a3b')
