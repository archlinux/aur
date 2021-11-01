# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-mujoco-py
_name=${pkgname#python-}
pkgver=2.0.2.13
pkgrel=2
pkgdesc="Python interface to the MuJoCo physics engine"
arch=('x86_64')
url="https://github.com/openai/mujoco-py"
license=('MIT' 'custom')
depends=(
	'cython'
	'mesa'
	'mujoco'
	'python-cffi'
	'python-fasteners'
	'python-glfw'
	'python-imageio'
	'python-numpy'
)
makedepends=('patchelf' 'python-setuptools')
optdepends=()
# Stripping breaks the generated cymj_*.so file
options=(!strip)
# There is no license file included in the pip package
# Get it from the mujoco-py github repo instead.
# Also, there is no release marked for the recent pip package version,
# so use the lastest `master` commit (at the time of writing).
#
# The gen_wrappers.py script is similarly not included in the pip package but
# helps with updating to mujoco 210
_release_commit="4830435a169c1f3e3b5f9b58a7c3d9c39bdf4acb"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE.md::https://raw.githubusercontent.com/openai/$_name/$_release_commit/LICENSE.md"
        "$_name-$pkgver-gen_wrappers.py::https://raw.githubusercontent.com/openai/$_name/$_release_commit/scripts/gen_wrappers.py"
        "$_name-gen_wrappers.py.patch"
        "$_name.patch")
sha256sums=('d6ae66276b565af9063597fda70683a89c7356290f5ac3961b794ee90ec50eea'
            'fb896a8cbad505b0fe1f324e7d4f02032e56885c6544b7644180258d6077a71a'
            'c13dd644594f3746bb0e5db2cdc8be2d7acb8b7e91fa5299bd1825f2bebd8d41'
            'SKIP'
            'SKIP')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$_name.patch"

	# Patch gen_wrappers to use installed mujoco location and 2.1.0
	patch $(readlink "$srcdir/$_name-$pkgver-gen_wrappers.py") \
		-i "$srcdir/$_name-gen_wrappers.py.patch" \
		-o "$srcdir/$_name-$pkgver-gen_wrappers-patched.py"

	# Re-generate the files in mujoco_py/generated/ for 2.1.0
	python "$srcdir/$_name-$pkgver-gen_wrappers-patched.py"

	# Generated .pxi uses `nmocap` instead of `p.nmocap`
	# There's probably a way to fix it in gen_wrappers but to avoid having to
	# understand how gen_wrappers works I just fix it here.
	sed -i"" -e 's/\*nmocap)/*p.nmocap)/' \
		"mujoco_py/generated/wrappers.pxi"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 "$srcdir/$_name-$pkgver-LICENSE.md" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
