# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname=frida
pkgname=python-$_pkgname
pkgver=16.1.9
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python'
         'python-setuptools')
optdepends=('python-typing_extensions: for Python <3.8'
            'rustup: for injecting Rust code into targets')
# Sourced from https://pypi.org/project/frida/#files
source=("https://files.pythonhosted.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "COPYING")
# Sourced from https://github.com/frida/frida/releases
source_i686=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-x86.tar.xz")
source_x86_64=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-x86_64.tar.xz")
source_armv7h=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-armhf.tar.xz")
source_aarch64=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-arm64.tar.xz")
sha256sums=('f508fa632629f5ea666fb12f7d91bc7836f5fdfac506bfa98abb21503ae3279e'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('15c852b9d07f691348de324b385198d05acbcc173c2063dc2642d79c7fd64e5e')
sha256sums_x86_64=('80a8a13d371209a1871870872b1bb0f2f0d4eb3f0eaf118001cc002901d80534')
sha256sums_armv7h=('91f500b86e4fe437dee41cdcedb2a796b21fa7495149f545aca9248c15df2b90')
sha256sums_aarch64=('fc79fad5589177b28c5884719c5fd08ebfd4ee3e4846b0faa34dc37baa39ecff')
noextract=("frida-core-devkit-${pkgver}-linux.tar.xz")
conflicts=("python2-${_pkgname}")

prepare() {
  mkdir "$srcdir/frida-core-devkit-${pkgver}-linux"
  bsdtar -x --cd "$srcdir/frida-core-devkit-${pkgver}-linux" -f "frida-core-devkit-${pkgver}-linux.tar.xz"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  FRIDA_CORE_DEVKIT="../frida-core-devkit-${pkgver}-linux" python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  FRIDA_CORE_DEVKIT="../frida-core-devkit-${pkgver}-linux" python setup.py install --root=$pkgdir --optimize=1 --skip-build

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
