# Maintainer: robertfoster
# Contributor: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=19.8.1
pkgrel=4
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
)

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
}

md5sums=('04ec4428ad8ee3787e798bcd5a7ed23a'
	'b09b8ac1a4c1fbb17c79bde8d6520ea1'
	'578b9531acff7b5bf96d776bbd327d15'
'fc7662b4e3b499cbb0b4f8df12b0ce80')
