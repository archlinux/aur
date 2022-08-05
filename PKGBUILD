# Maintainer: BrainDamage
pkgname=kalliope
pkgver=0.7.2
pkgrel=1
arch=('any')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(python svox-pico-bin
	python-markupsafe python-pyaudio python-pythondialog
	python-jinja  python-cffi python-flask-restful
	python-ipaddress python-apscheduler python-flask-testing
	python-httpretty python-requests  python-gevent
	python-feedparser python-mock python-transitions
	python-gitpython python-pyalsaaudio python-soundfile
	python-sounddevice python-sox python-voicerss-tts
	python-paho-mqtt python-ansible python-cachingutil
	python-gevent python-sox python-speechrecognition
	python-configurationutil python-stateutil python-ruamel-yaml
	python-logging-tree python-classutils python-uiutil
	python-tableutil python-conversionutil python-openpyxl
	python-flask-cors python-gtts python-pyasn1
	python-werkzeug python-snowboy)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('76b5adcb1bd23a2c50046ecd17bed1ef2cb5b09584c44c01669486d33f858771')

_targetSnowboyDir='kalliope/trigger/snowboy'
prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	#remove the embedded binary snowboy libs and resources
	find "${_targetSnowboyDir}" -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 rm -rv
}

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	export PYTHONHASHSEED=0
	python setup.py build
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"

	#replace the embedded snowboy lib with a symlink to the official package's lib
	_systemSitePackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
	find "${_systemSitePackages}/snowboy" -type f -name 'snowboydetect.*' -exec ln -sfv -t "${pkgdir}/${_systemSitePackages}/${_targetSnowboyDir}" {} \;
	ln -sv -t "${pkgdir}/${_systemSitePackages}/${_targetSnowboyDir}" "${_systemSitePackages}/snowboy/resources"
}
