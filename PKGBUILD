# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-mujoco-py
_name=${pkgname#python-}
pkgver=2.0.2.9
pkgrel=2
pkgdesc="Python interface to the MuJoCo physics engine"
arch=('x86_64')
url="https://github.com/openai/mujoco-py"
license=('MIT' 'custom')
depends=(
	'cython'
	'glew'
	'libgl'
	'mesa'
	'mujoco'
	'python'
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
# so use the lastest commit (at the time of writing).
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE.md::https://raw.githubusercontent.com/openai/mujoco-py/d73ce6e91d096b74da2a2fcb0a4164e10db5f641/LICENSE.md"
        "$_name-$pkgver.patch")
sha256sums=('6ae20ca9509203758f5e30a7a4019cb2d581b6d40dc2c2669dbe3229cfdf05e8'
            'fb896a8cbad505b0fe1f324e7d4f02032e56885c6544b7644180258d6077a71a'
            '5ac81282141cf7c5700b9967f85c4e9a3339a35a1bbdd3c383b877774525d660')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$_name-$pkgver.patch"
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
