# Maintainer: robertfoster
# Contributor: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=19.8.1
pkgrel=3
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
	"mycroft.service"
"mycroft.pulseaudio")

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

	# Virtualenv
	cd $pkgdir/usr/share/mycroft-core
	virtualenv .venv
	source .venv/bin/activate
	pip install -r requirements.txt
	pip install https://github.com/JarbasAl/py_mplayer/archive/master.zip
	sed -i 's/^VIRTUAL_ENV=.*/VIRTUAL_ENV="\/usr\/share\/mycroft-core\/.venv"/g' .venv/bin/activate
	rm .venv/bin/activate.{fish,csh}

	# Cleanup
	find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +
	rm -rf "$pkgdir/usr/share/mycroft-core/test"

	# Pulseaudio Workaround (any suggestion is well accepted)
	install -D -m644 "${srcdir}/mycroft.pulseaudio" "${pkgdir}/usr/share/mycroft-core/pulse-client.conf"
}

md5sums=('04ec4428ad8ee3787e798bcd5a7ed23a'
	'6712830084b2d2845f7c1db46410cfc7'
	'f4b41cc9e1a7308c8833f0f7804d8c02'
	'a587888fcaf792ab9ceb6c698bb03ac3'
'ffd5e294798abaa35bb79f2b1afd40e1')
