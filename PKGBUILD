# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname=frida
pkgname=python-$_pkgname
pkgver=16.1.10
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
sha256sums=('d9715d262791803df4091838b661e0a7c8b63466462eb055ce4f3b2b04df5807'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('6152cfabfff2ae1afdeb741f39bca2a308914492501822653fd2d29e080d7111')
sha256sums_x86_64=('086f28d85b250df8cdc6c4b876ca0e6c0588b57bc6ba8222dbcfdb3c65295c66')
sha256sums_armv7h=('f80aaf25038b2b37cc33563415b131c6b40dee479040eea051249330f587792f')
sha256sums_aarch64=('717e774a43c1e62de275787a34e0d6d76ab9736816c1bd9008483534a1c57565')
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
