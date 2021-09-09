# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-minerl
_name=${pkgname#python-}
pkgver=0.4.2
pkgrel=1
pkgdesc="Environment for RL from human demonstration in Minecraft"
arch=('x86_64')
url="https://github.com/minerllabs/minerl"
license=('custom:cc-by-nc-sa-4.0')
depends=(
	'ipython'
	'java-runtime'
	'jdk8-openjdk'
	'python-bullet'
	'python-coloredlogs'
	'python-daemoniker'
	'python-dill'
	'python-gym'
	'python-inflection'
	'python-jinja'
	'python-lxml'
	'python-matplotlib'
	'python-numpy'
	'python-opencv'
	'python-pillow'
	'python-psutil'
	'python-pyro'
	'python-requests'
	'python-simple-term-menu'
	'python-tqdm'
	'python-xmltodict'
)
# The stated package requirements are overzealous.
# The following are not actually required for running the package:
# * filelock
# * getch
# * pytest
# * setuptools
# * typing (included with python)

makedepends=('python-setuptools')
checkdepends=(
	'python-pytest'
	'python-filelock'
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"$_name.patch"
)
sha256sums=(
	'653d2fe1079e003736dccee09fd957570e238dce1ac411ffa3e2d342bafa4006'
	'SKIP'
)

prepare() {
	cd "$_name-$pkgver"

	# Apply patch
	# The patch sets the default Java path to Arch Linux's Java 8
	# Otherwise, if multiple java versions are installed,
	# the wrong one might be associated with the `java` command.
	patch --forward --strip=1 --input="${srcdir}/$_name.patch"

	# A few scripts have #!/usr/bin/python3.5
	# Change to #!/usr/bin/python
	find . -type f -name "*.py" \
		-exec sed -i -e '1,3 s:^\(#!/usr/bin/python\)3.5:\1:' {} +
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Unnecessary and in a bad location
	rm "$pkgdir/usr/requirements-docs.txt"

	# Contains a non-readable registry.bin file that causes trouble at runtime
	# when the program tries to recursively copy this directory.
	# It seems to be a build artifact and not used at runtime.
	rm -r "$pkgdir/usr/lib/python3.9/site-packages/minerl/Malmo/Minecraft/run/gradle/daemon/4.10.2/"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
