# Maintainer: inso <insomniak.fr@gmail.com>
pkgname=sakia
pkgver=0.32.8
pkgrel=1
epoch=
pkgdesc="A Python/Qt client for Duniter network"
arch=("x86_64" "i686")
url=""
license=('GPL')
groups=()
depends=('qt5-base>=5.5' 'qt5-svg>=5.5' 'expat' 'bzip2' 'gdbm' 'openssl-1.0' 'libffi' 'zlib' 'sqlite')
makedepends=('qt5-tools>=5.5' 'python-pyqt5')
checkdepends=()
optdepends=('gtk3')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/duniter/sakia/archive/$pkgver.tar.gz")
noextract=()
sha256sums=("46a1fbcc36270d8eefb041494bfe3b1ebdbff84100c9c6ba5d7595f825cfb738")
validpgpkeys=()

PYENV_PYTHON_VERSION=3.5.3

prepare() {
	cd "$pkgname-$pkgver"
	git clone https://github.com/yyuu/pyenv.git "$srcdir/pyenv"
        export PYENV_ROOT="$srcdir/pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        echo $PATH
        PYTHON_CONFIGURE_OPTS="--enable-shared" CFLAGS="-I/usr/include/openssl-1.0" LDFLAGS="-L/usr/lib/openssl-1.0" pyenv install $PYENV_PYTHON_VERSION
        pyenv shell $PYENV_PYTHON_VERSION
        which python
        pip install pyinstaller
        pip install PyQt5==5.8.2
	pip install -r requirements.txt
	rm "$PYENV_ROOT/versions/$PYENV_PYTHON_VERSION/bin/pyuic5"
}

build() {
        export PYENV_ROOT="$srcdir/pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        echo $PATH
	cd "$pkgname-$pkgver"
        pyenv shell $PYENV_PYTHON_VERSION
        which python
	python gen_resources.py
	python gen_translations.py
	pyinstaller -y sakia.spec
	
}

package() {
        export PYENV_ROOT="$srcdir/pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        echo $PATH
        pyenv shell $PYENV_PYTHON_VERSION
        which python
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -r dist/sakia "$pkgdir/opt/sakia"
	cp $srcdir/$pkgname-$pkgver/sakia.png $pkgdir/opt/sakia/
	cp -r "$srcdir/$pkgname-$pkgver/res/linux/usr" "$pkgdir"
	ln -s /opt/sakia/sakia.bin $pkgdir/usr/bin/sakia
}
