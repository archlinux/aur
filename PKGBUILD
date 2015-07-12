# Maintainer: Elovsky Valentin (evvsoft@gmail.com)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='ivideon-server-headless'
pkgver='3.5.3'
pkgrel='570'
_rel='f9afa343863f'
pkgdesc='Ivideon-server daemon'
arch=('x86_64')
url=('http://ivideon.com/')
license=('freeware')
depends=('portaudio' 'gstreamer0.10' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins')
makedepends=('libarchive')
conflicts=('ivideon-video-server-nogui')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	'videoserverd.service'
	'videoserverd.conf'
	'sysusers.conf'
	'videoserverd.install'
	'schedule.json')
sha256sums=(	"f6d31bf43627a3629fd640846830e74f642dc1397b48051fe83765a5bdecf2ba"
		'922cfb91761eed9fba58c0fb48237a87d5928e4ff289f6a88e8c1630bc8f47b3'
		'f0010bc64cd7c1b5aefcc7241f0e0074528aec1a4b51dd08bd429e95acd26012'
		'91c4b133ad4d1fda72679ab393b647ac24a56e3c0d46cd2a908a47ed8524ec81'
		'7f86f7a5d9100f3cae6177d241db9bba98ef47b80dee9ce59d412c2922cdf186'
		'd02f782328766ee982584c46c2d15180c441468d2ef27532142e7d6b951b830a')
install='videoserverd.install'
backup=('etc/videoserverd.conf'
	'var/lib/videoserverd/schedule.json')

build() {
	cd "$srcdir"
	bsdtar xf "$srcdir/data.tar.gz"
	rm "$srcdir/opt/ivideon/ivideon-server/init_ctl.sh"
	rm "$srcdir/opt/ivideon/ivideon-server/initd.sh"
	rm "$srcdir/opt/ivideon/ivideon-server/serverctl.sh"
}

package() {
	cp -dpr --no-preserve=ownership "$srcdir/opt" "$pkgdir"
	install -Dm644 "$srcdir/videoserverd.service" "$pkgdir/usr/lib/systemd/system/videoserverd.service"
	install -Dm644 "$srcdir/videoserverd.conf" "$pkgdir/etc/videoserverd.conf"
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/videoserverd.conf"
	install -dm775 -o 176 -g 176 "$pkgdir/var/log/videoserverd"
	install -dm775 -o 176 -g 176 "$pkgdir/var/lib/videoserverd"
	install -Dm644 -o 176 -g 176 "$srcdir/schedule.json" "$pkgdir/var/lib/videoserverd/schedule.json"
}
