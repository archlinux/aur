# Maintainer: Erin Allison <erin@eallison.us>

pkgname=rider-projector
pkgver=2021.3.2
_projectorver=1.5.2
pkgrel=1
pkgdesc='Run JetBrains Rider as a headless service for use with Projector.'
arch=('x86_64')
license=('custom')
url="https://www.jetbrains.com/rider/"
options=('!strip')

optdepends=(
    'projector-bin: Native client for JetBrains Projector')
makedepends=(
    'python>=3'
    'python-pip'
    'python-cryptography'
    'python-pyopenssl')
depends=(
    'libxext'
    'libxrender'
    'libxtst'
    'freetype2'
    'libxi'
    'jre-jetbrains')

source=(
    'rider-projector.service'
    'run.sh.patch'
    "git+https://github.com/JetBrains/projector-installer/#tag=v${_projectorver}")
sha256sums=(
    '101e4ea3a22c83cbe6e6ff257b2b79350f45c428dcb349903fa9dc773abd4efc'
    'a36da8b7467ff4687410d3d032e4df8f0abe005e347f27ae9ebb4f38ff85d5b1'
    'SKIP')

build() {
	cd "${srcdir}"

	python -m venv env
	source env/bin/activate

	python -m pip install --upgrade pip

	cd projector-installer

	python -m pip install -r requirements.txt
	python setup.py install

	cd ..

	rm -rf ./config ./cache

	projector --accept-license \
		  --config-directory ./config \
		  --cache-directory ./cache \
		  autoinstall \
		  --config-name rider \
		  --ide-name "Rider $pkgver"

	mv "${srcdir}/config/apps/JetBrains Rider-${pkgver}/license" "${srcdir}/license"

	# Remove bundled JRE (provided by dependency jre-jetbrains)
	rm -rf "./config/apps/JetBrains Rider-${pkgver}/jbr/"

	# Update Rider installation path
	sed -Ei 's|(IDE_BIN_HOME)=.+|\1="/usr/lib/jetbrains/rider-projector/rider/bin"|' './config/configs/rider/run.sh'

	# Update Projector installation path
	sed -Ei "s|${srcdir}/env/.+/server/|/usr/lib/jetbrains/rider-projector/projector/|" './config/configs/rider/run.sh'

	patch -p1 < ./run.sh.patch
}

package() {
	projectorserver="$(find "${srcdir}/env/lib/" -name projector_installer)/bundled/server"
	install -dm755 "${pkgdir}/usr/lib/jetbrains/rider-projector"
	install -dm755 "${pkgdir}/usr/share/licenses/"

	cp -dr "${srcdir}/license" "${pkgdir}/usr/share/licenses/rider-projector"
	cp -dr "${projectorserver}" "${pkgdir}/usr/lib/jetbrains/rider-projector/projector"
	cp -dr "${srcdir}/config/apps/JetBrains Rider-${pkgver}" "${pkgdir}/usr/lib/jetbrains/rider-projector/rider"

	install -Dm755 "${srcdir}/config/configs/rider/run.sh" "${pkgdir}/usr/bin/rider-projector"
	install -Dm644 "${srcdir}/rider-projector.service" "${pkgdir}/usr/lib/systemd/user/rider-projector.service"
}
