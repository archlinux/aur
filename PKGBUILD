plainname=pyjnius
pkgname="python-$plainname-git"
pkgver=r286.28fb734
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=('i686' 'x86_64')
url="https://github.com/kivy/$plainname"
license=('LGPL3')
depends=('java-environment' 'python')
makedepends=('cython' 'perl')
source=("git+https://github.com/kivy/pyjnius.git")
md5sums=('SKIP')

pkgver() {
  cd "$plainname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	perl -p -i -e 's|raise SystemError\("JAVA_HOME is not set."\)|JAVA_HOME = "/usr/lib/jvm/default"|g' $srcdir/$plainname/jnius/jnius_jvm_dlopen.pxi
	perl -p -i -e 's|from .jnius import |import os\nos.environ["JAVA_HOME"]="/usr/lib/jvm/default"\nfrom .jnius import |' $srcdir/$plainname/jnius/__init__.py
}

build() {
	cd $plainname
	python3 setup.py build_ext --inplace -f
	python3 setup.py build
}

package() {
	cd $plainname
	export PYTHONPATH="$pkgdir/usr/lib/python3.5/site-packages"
	mkdir -p "$PYTHONPATH"
	python3 setup.py install --prefix="$pkgdir/usr"
	rm -rf "$pkgdir/usr/bin"
}
