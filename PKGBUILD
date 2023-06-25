pkgname=kathara
pkgver=3.6.2
pkgrel=1
pkgdesc="Lightweight network emulation system based on Docker containers."
arch=('any')
url="https://www.kathara.org/"
license=('GPL3')
install="kathara.install"
changelog="kathara.changelog"
makedepends=(
	'python310'
    'chrpath'
    'patchelf'
    'make'
    'ruby-ronn-ng'
)
optdepends=(
    'docker: for running network scenarios in a local environment'
    'xterm: for opening devices terminals'
    'tmux: for opening many devices terminals'
)
source=("https://github.com/KatharaFramework/Kathara/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
  python3 -m venv $srcdir/venv
  $srcdir/venv/bin/pip install --upgrade setuptools
  $srcdir/venv/bin/pip install -r $srcdir/Kathara-$pkgver/src/requirements.txt
  $srcdir/venv/bin/pip install -r $srcdir/Kathara-$pkgver/scripts/autocompletion/requirements.txt
  $srcdir/venv/bin/pip install nuitka
  $srcdir/venv/bin/pip install pytest
}

build() {
  cd $srcdir/Kathara-$pkgver/docs && make roff-build
  cd $srcdir/Kathara-$pkgver/scripts/autocompletion/ && $srcdir/venv/bin/python generate_autocompletion.py $srcdir/Kathara-$pkgver/scripts/autocompletion/kathara.bash-completion
  cd $srcdir/Kathara-$pkgver/ && $srcdir/venv/bin/python -m pytest tests
  cd $srcdir/Kathara-$pkgver/src/ && $srcdir/venv/bin/python -m nuitka --lto=no --plugin-enable=pylint-warnings --plugin-enable=multiprocessing --follow-imports --standalone --include-plugin-directory=Kathara --output-filename=kathara kathara.py
}

package() {
  for man_file in $srcdir/Kathara-$pkgver/docs/Roff/*; do \
	man_file_dir="man${man_file: -1}"; \
	[[ -d $srcdir/Kathara-$pkgver/docs/Roff/$man_file_dir ]] || mkdir $srcdir/Kathara-$pkgver/docs/Roff/$man_file_dir; \
	mv -f $man_file $srcdir/Kathara-$pkgver/docs/Roff/$man_file_dir; \
  done;
  install -d -m 755 $pkgdir/usr/share/man
  cp -r $srcdir/Kathara-$pkgver/docs/Roff/* $pkgdir/usr/share/man/

  install -d -m 755 $pkgdir/etc/bash_completion.d/
  install -p -m 644 $srcdir/Kathara-$pkgver/scripts/autocompletion/kathara.bash-completion $pkgdir/etc/bash_completion.d/

  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libbz2.so.1.0
  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libexpat.so.1
  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libtinfo.so.6
  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libz.so.1
  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libtinfo.so.5
  rm -f $srcdir/Kathara-$pkgver/src/kathara.dist/libcrypto.so.1.1
  install -d $pkgdir/usr/lib/$pkgname
  install -p -m 644 $srcdir/Kathara-$pkgver/src/kathara.dist/*.so* $pkgdir/usr/lib/$pkgname/
  install -p -m 755 $srcdir/Kathara-$pkgver/src/kathara.dist/kathara $pkgdir/usr/lib/$pkgname/
  install -d -m 755 $pkgdir/usr/lib/$pkgname/certifi
  install -p -m 644 $srcdir/Kathara-$pkgver/src/kathara.dist/certifi/* $pkgdir/usr/lib/$pkgname/certifi/
  install -d -m 755 $pkgdir/usr/lib/$pkgname/pyuv
  install -p -m 644 $srcdir/Kathara-$pkgver/src/kathara.dist/pyuv/* $pkgdir/usr/lib/$pkgname/pyuv/
  install -d -m 755 $pkgdir/usr/bin
  ln -sf /usr/lib/$pkgname/kathara "$pkgdir/usr/bin/$pkgname"
}
