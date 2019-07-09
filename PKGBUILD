# Maintainer: Florian Freund <florian88freund@gmail.com>
# Contributor: RetardedOnion@archlinux-irc 
# Creator: Mr.S of Teamspeak-Forums
pkgname=teamspeak3-massmover
pkgver=0.61.23
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. TS3MassMover by Mr. S'
arch=('x86_64')
url="https://forum.teamspeak.com/threads/129129-TS3MassMover-TS3-Client-Plugin-to-move-clients"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1' 'unzip' 'qt5-base')
depends=('teamspeak3>=3.3.0')
source=("TS3MassMover-v${pkgver}.zip::https://forum.teamspeak.com/attachment.php?attachmentid=17992&d=1560786393")
sha256sums=('17342a8071b2357005df9cf93b3ec97476f1b115f9501ef23cc84a94e32e6b3f')

build() {
	mkdir -p "${srcdir}/build"

	sed -i 's:#include <direct.h>:#include <sys/stat.h>:g' "${srcdir}/source/plugin.cpp"
	sed -i 's:_mkdir\((.*)\):mkdir(\1, 0755):g' "${srcdir}/source/plugin.cpp"

	c++ -shared -I /usr/include/teamspeak3 -I /usr/include/qt -fPIC -o "${srcdir}/build/TS3MassMover.so" "${srcdir}/source/plugin.cpp"
}

package() {
	mkdir -pm0755 "$pkgdir/opt/teamspeak3/plugins"
	install -D -m755 "${srcdir}/build/TS3MassMover.so" "${pkgdir}/opt/teamspeak3/plugins/TS3MassMover.so"
}
