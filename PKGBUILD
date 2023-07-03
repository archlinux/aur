# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname=frida
pkgname=python-$_pkgname
pkgver=16.1.1
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python')
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
sha256sums=('dd5480f857eadec21166e180f5d3f2d1b64cb3a60f227481fb5dfa12cb22525e'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('d285a02cd986fe07d4ca6f0423a8eabd60333771b7b6554bf34b2eee4ae064ca')
sha256sums_x86_64=('3f4a39964d5805264b9623703f679880075f9b7fcec94e18c6b8cdc5e89ac8a3')
sha256sums_armv7h=('ebd0e9e0f345b312889d27027394d6767954bdef960024040e524505445d20f9')
sha256sums_aarch64=('4e183a98127758e62bcdd0e81b28d87283bcc8c0f867749f8fa9bf74350fa226')
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
