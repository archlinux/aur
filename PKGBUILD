# Maintainer: Shalygin Konstantin <k0ste@cn.ru>

pkgname='ivideon-server-headless'
pkgver='3.5.5'
pkgrel='1070'
_rel='7874db5ebab1'
pkgdesc='Ivideon-server daemon'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('portaudio' 'ffmpeg' 'gstreamer0.10' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins')
makedepends=('libarchive')
conflicts=('ivideon-video-server-nogui')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	"videoserverd.service"
	"videoserverd.conf"
	"sysusers.conf"
	"schedule.json"
	"videoservertmp.conf")
sha256sums=('fa0b5a22cbfa8bd442fecec37fd446933132cf1b825c7202698708d2a3616450'
            '48cd5beedc9992a26448ee06c44460c8e9f3014154adcad0eee39aa985851071'
            'f0010bc64cd7c1b5aefcc7241f0e0074528aec1a4b51dd08bd429e95acd26012'
            '91c4b133ad4d1fda72679ab393b647ac24a56e3c0d46cd2a908a47ed8524ec81'
            'd02f782328766ee982584c46c2d15180c441468d2ef27532142e7d6b951b830a'
            'ad8029bf201260608daf7ed4d109731bbf247e8597e36cc1dea915fceae51b56')
install="videoserverd.install"
backup=("etc/videoserverd.conf"
	"var/lib/videoserverd/schedule.json")

build() {
  cd "${srcdir}"
  bsdtar xf "data.tar.gz"
  rm "opt/ivideon/ivideon-server/install_services.sh"
  rm "opt/ivideon/ivideon-server/initd.sh"
  rm "opt/ivideon/ivideon-server/serverctl.sh"
}

package() {
  pushd ${srcdir}
  cp -ax "opt" "${pkgdir}"
  install -Dm644 "videoserverd.service" "${pkgdir}/usr/lib/systemd/system/videoserverd.service"
  install -Dm644 "videoserverd.conf" "${pkgdir}/etc/videoserverd.conf"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/videoserverd.conf"
  install -Dm644 "videoservertmp.conf" "${pkgdir}/usr/lib/tmpfiles.d/videoserverd.conf"
  install -Dm644 -o 176 -g 176 "schedule.json" "${pkgdir}/var/lib/videoserverd/schedule.json"
  install -dm755 -o 176 -g 176 "${pkgdir}/run/videoserverd"
  install -dm775 -o 176 -g 176 "${pkgdir}/var/log/videoserverd"
  install -dm775 -o 176 -g 176 "${pkgdir}/var/lib/videoserverd"
  popd
}
