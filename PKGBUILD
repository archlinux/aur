# Maintainer: robertfoster
# Contributor: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=20.2.1
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
	"mycroft.service"
	"client.conf"
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
	chmod -R 755 ${pkgdir}/usr/share/mycroft-core

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
	
	# Fix Virtualenv
	sed -i 's/^VIRTUAL_ENV=.*/VIRTUAL_ENV="\/usr\/share\/mycroft-core\/.venv"/g' .venv/bin/activate
	pathtoreplace=`echo $pkgdir | sed 's:/:\\\/:g'`
	rm .venv/bin/activate.{fish,csh}

	# Cleanup
	find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +
	rm -rf "$pkgdir/usr/share/mycroft-core/test"
        sed -i "s/$pathtoreplace//g" $pkgdir/usr/share/mycroft-core/.venv/bin/*

	# Pulseaudio Client configuration
	install -D -m644 "${srcdir}/client.conf" "${pkgdir}/usr/share/mycroft-core/pulseaudio.client.conf"
}

md5sums=('0efada38dbb0e0f036d83135f24bf6c1'
         '39bcf2f0f30854b7b6e516d49946566a'
         '578b9531acff7b5bf96d776bbd327d15'
         '7cbcc7b8b71d00c19a11166fbbd5ed4f'
         '46775f06fd9d6c4ad5ff3a221d4912ff')
