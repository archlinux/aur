# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-mujoco-py
_name=${pkgname#python-}
pkgver=2.1.2.14
pkgrel=1
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
_release_commit="4830435a169c1f3e3b5f9b58a7c3d9c39bdf4acb"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name.patch")
sha256sums=('eb5b14485acf80a3cf8c15f4b080c6a28a9f79e68869aa696d16cbd51ea7706f'
            'SKIP')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$_name.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.md"
}
