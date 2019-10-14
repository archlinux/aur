# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=19.8.1
pkgrel=1
pkgdesc="The Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('python'
	'python-gobject'
	'libffi'
	'swig'
	'portaudio'
	'mimic'
	'mpg123'
	'screen'
	'flac'
	'curl'
	'icu'
	'libjpeg-turbo'
	'jq'
	'pulseaudio'
	'pulseaudio-alsa'
'fann')
makedepends=('git' 'sudo' 'python-pip' 'python-setuptools' 'python-virtualenv' 'sudo')
install=mycroft-core.install
source=("https://github.com/MycroftAI/mycroft-core/archive/release/v${pkgver}.tar.gz"
	"mycroft.tmpfiles"
	"mycroft.sysusers"
"mycroft.service")

prepare() {
	cd $srcdir/$pkgname-release-v$pkgver
	sed -i 's/^check-dependencies$/#check-dependencies/g' start-mycroft.sh
	sed -i 's/change_ownership$/:/g' scripts/prepare-msm.sh
}

package() {
	mkdir -p ${pkgdir}/usr/share/
	cp -R mycroft-core-release-v${pkgver} ${pkgdir}/usr/share/mycroft-core

	# Place a link to mimic where mycroft is expecting it
	mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
	ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

	# Set permissions
	chmod -R g+w ${pkgdir}/usr/share/mycroft-core

	# systemd
	install -D -m644 "${srcdir}/mycroft.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 "${srcdir}/mycroft.sysusers" "${pkgdir}/usr/lib/sysusers.d/mycroft.conf"
	install -D -m644 "${srcdir}/mycroft.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mycroft.conf"

	# venv
	cd $pkgdir/usr/share/mycroft-core
	virtualenv .venv
	source .venv/bin/activate
	pip install -r requirements.txt
	pip install py_mplayer
	sed -i 's/^VIRTUAL_ENV=.*/VIRTUAL_ENV="\/usr\/share\/mycroft-core\/.venv"/g' .venv/bin/activate
}

md5sums=('04ec4428ad8ee3787e798bcd5a7ed23a'
	'e9a8f1095bb32a05946650e2993bdb37'
	'7c2f6981ea856fc10c64eab60d69569c'
'a587888fcaf792ab9ceb6c698bb03ac3')
