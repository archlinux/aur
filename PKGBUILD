# Maintainer: Sigurd Hellesvik <sigurd.hellesvik@protonmail.com>

# Disclaimer: This package is not from Nordic Semiconductor
pkgname=nrf-connect-sdk
pkgver=1.9.0
pkgrel=1
pkgdesc="Software development kit for Nordic Semiconductor products"
arch=('x86_64')
url="https://github.com/nrfconnect/sdk-nrf"
license=('custom:LicenseRef-Nordic-5-Clause')
install=nrf-connect-sdk.install
options=(!strip)
_tag="v${pkgver}"
depends=(
'cmake'
'ninja'
'gperf'
'dfu-util'
'dtc'
'python'
'python-setuptools'
'tk'
'python-wheel'
'xz'
'python-intelhex'
'python-pyelftools' 
#AUR dependencies
'gcc-arm-none-eabi-bin'
'python-west'
'nrf5x-command-line-tools'
)
makedepends=(
'git'
'wget'
)
#All Python dependencies are from the nRF Connect SDK Python requirements.
#They are described in the documentation at 
#https://developer.nordicsemi.com/nRF_Connect_SDK/doc/1.8.0/nrf/gs_installing.html#id9
#The packages from those scripts found in pacman/AUR is listed below
#If you need them, concider installing them using a Virtual Environment instead.
optdepends=(
'ccache: Listed in nRF Connect SDK install dependencies'
'gn-m85: Matter support'
'python-ecdsa: nrf-sdk requirements-build.txt'
'python-imagesize: nrf-sdk requirements-build.txt'
'python-pylint: nrf-sdk requirements-build.txt'
'python-regex: nrf-sdk requirements-build.txt' 
'python-recommonmark: nrf-sdk requirements-docs.txt '
'python-commonmark: nrf-sdk requirements-docs.txt'
'python-sphinx: nrf-sdk requirements-docs.txt'
'python-pygments: nrf-sdk requirements-docs.txt'
'python-m2r2: nrf-sdk requirements-docs.txt'
'python-sphinxcontrib-plantuml: nrf-sdk requirements-docs.txt'
'python-pygit2: nrf-sdk requirements-docs.txt'
'python-azure-storage: nrf-sdk requirements-docs.txt'
'python-sphinx-markdown-tables: nrf-sdk requirements-docs.txt'
'python-markdown: nrf-sdk requirements-docs.txt'
'python-mistune: nrf-sdk requirements-docs.txt'
'python-pyaml: zephyr-sdk requirements-base.txt'
'python-pykwalify: zephyr-sdk requirements-base.txt'
'python-packaging: zephyr-sdk requirements-base.txt'
'python-progress: zephyr-sdk requirements-base.txt'
'python-psutil: zephyr-sdk requirements-base.txt'
'python-anytree: zephyr-sdk requirements-base.txt'
'pylink: zephyr-sdk requirements-base.txt'
'python-colorama: zephyr-sdk requirements-build-test.txt'
'python-ply: zephyr-sdk requirements-build-test.txt'
'gcovr: zephyr-sdk requirements-build-test.txt'
'python-coverage: zephyr-sdk requirements-build-test.txt'
'python-pytest: zephyr-sdk requirements-build-test.txt'
'mypy: zephyr-sdk requirements-build-test.txt'
'python-mock: zephyr-sdk requirements-build-test.txt'
'python-breathe: zephyr-sdk requirements-doc,txt'
'python-sphinx_rtd_theme: zephyr-sdk requirements-doc,txt'
'python-pyserial: zephyr-sdk requirements-run-tests,txt'
'pyocd: zephyr-sdk requirements-run-tests.txt'
'python-tabulate: zephyr-sdk requirements-run-tests.txt'
'python-magic: zephyr-sdk requirements-compliance.txt'
'python-cryptography: mcuboot-sdk requirements.txt'
'python-clic: mcuboot-sdk requirements.txtk'
'python-cbor: mcuboot-sdk requirements.txt'
)
provides=("nrf-connect-sdk")
conflicts=("nrf-connect-sdk")
source=("nrf::git+https://github.com/nrfconnect/sdk-nrf.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
	#Initilize and clone other repos usinf python-west
	cd "${srcdir}"
	unset ZEPHYR_BASE
	if [ -d ".west" ]; then
		rm -rf ".west"
	fi
	west init --local "nrf"
	west update
}

package() {
	install -Dm644 "${srcdir}/nrf/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "${pkgdir}/opt/"

	cp -R "${srcdir}" "${pkgdir}/opt/nrf-connect-sdk"
	chmod -R 775 "${pkgdir}/opt/nrf-connect-sdk"
	chown -R :users "${pkgdir}/opt/nrf-connect-sdk"
	
	mkdir -p "${pkgdir}/etc/profile.d"
    echo "export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb" > "${pkgdir}/etc/profile.d/nrf-connect-sdk-env.sh"
    echo "export GNUARMEMB_TOOLCHAIN_PATH='/usr'" >> "${pkgdir}/etc/profile.d/nrf-connect-sdk-env.sh"
    echo "source /opt/nrf-connect-sdk/zephyr/zephyr-env.sh" >> "${pkgdir}/etc/profile.d/nrf-connect-sdk-env.sh"
    echo "west zephyr-export" >> "${pkgdir}/etc/profile.d/nrf-connect-sdk-env.sh"
}
