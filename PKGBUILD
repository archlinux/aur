# Maintainer: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

pkgname=python-playwright
_name=playwright-python
pkgver=1.42.0
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64)
url=https://github.com/microsoft/playwright-python
license=(Apache-2.0)
makedepends=('git' 'python-auditwheel' 'python-build' 'python-installer' 'python-wheel')
depends=('nodejs' 'python' 'python-greenlet' 'python-pyee')
source=("git+https://github.com/microsoft/${_name}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${_name}"

	# TODO investigate why there is a download during build from
	# https://playwright.azureedge.net/builds/driver/

	# removing the build step does NOT work - breaks the package:
	#
	# > $ playwright
	# > Traceback (most recent call last):
	# >   ...
	# > FileNotFoundError: [Errno 2] No such file or directory: '/usr/lib/python3.11/site-packages/playwright/driver/playwright.sh'
	#
	# perl -i -ne 'print unless m/cmdclass=\{"bdist_wheel": PlaywrightBDistWheelCommand\},/' setup.py

	python -m build --wheel
}

package() {
	cd "${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
