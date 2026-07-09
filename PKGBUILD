# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=4.1.3
pkgrel=1
pkgdesc='Python compiler with full language support and CPython compatibility'
arch=(any)
url='https://nuitka.net'
license=(Apache-2.0)
depends=(
  fuse2
  gdb
  libxml2
  patchelf
  python
  python-appdirs
  python-certifi
  python-jinja
  python-ordered-set
  python-pyyaml
  python-setuptools
  python-six
  python-tqdm
  python-zstandard
  scons
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  ccache
  python-boto3
  python-brotli
  strace
)
optdepends=('ccache: for caching builds')
options=(!debug lto)
source=(
  "https://github.com/Nuitka/Nuitka/archive/refs/tags/${pkgver}.tar.gz"
  https://patch-diff.githubusercontent.com/raw/Nuitka/Nuitka/pull/3938.patch
)
sha256sums=('e10243719ba44991b9a1b69a031996f4d72273fd14bdaf3224dc00f8f2cac86b'
            '69c0a2c8e5b73cb78ae2650c0f1236a10d732481da363fd2f49a847e76c8c0d0')

prepare() {
  cd ${pkgname^}-${pkgver}

  patch -Np1 -i ../3938.patch
}

build() {
  cd ${pkgname^}-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname^}-${pkgver}

  # Needed to make LTO work with GCC
  export CFLAGS="${CFLAGS} -fuse-linker-plugin -ffat-lto-objects"
  # export LDFLAGS="${LDFLAGS} -fuse-linker-plugin -fno-fat-lto-objects"

  # Catch testing failures early
  echo '==> tests/basics/EmptyModuleTest.py'
  bin/nuitka --module --show-scons --run --report=compilation-report-module.xml --experimental=debug-report-traceback tests/basics/EmptyModuleTest.py
  bin/nuitka --show-scons --run --report=compilation-report-exe.xml --experimental=debug-report-traceback tests/basics/EmptyModuleTest.py

  # Catch testing failures early
  echo '==> data_files/DataFilesMain.py'
  bin/nuitka --show-scons --run --report=compilation-report-exe.xml --experimental=debug-report-traceback tests/plugins/data_files/DataFilesMain.py

  # Check that compilation works
  echo 'print("[x] Can compile main.py to an executable.\n[x] Can run the resulting executable.")' > main.py
  bin/nuitka --output-filename=main --lto=yes --show-scons main.py
  ./main

  # Tests were disabled. See:
  # https://github.com/Nuitka/Nuitka/issues/2595
  # https://github.com/Nuitka/Nuitka/issues/2609
  # https://github.com/Nuitka/Nuitka/issues/3272
  # https://github.com/Nuitka/Nuitka/issues/3284
  ./tests/run-tests --skip-standalone-tests --skip-reflection-test --no-other-python
}

package() {
  cd ${pkgname^}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 {Changelog,Developer_Manual,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
