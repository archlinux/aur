# Maintainer: Renat B. <xa9e@protonmail.com>
pkgname=python-frida-git
pkgver=16.6.3.r0.g7c9e20a
pkgrel=1
pkgdesc="Dynamic instrumentation toolkit with Python bindings for developers, reverse-engineers, and security researchers."
arch=('x86_64')
url="https://frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-colorama' 'python-prompt_toolkit' 'python-pygments' 'nodejs>=18.0.0' 'npm' 'capstone' 'libelf' 'json-glib' 'libsoup3' 'libusb' 'glib2' 'python-websockets' 'glibc' 'libunwind' 'libdwarf' 'libnghttp2' 'sqlite' 'xz' 'openssl' 'brotli' 'libffi')
makedepends=('git' 'python-pip' 'make' 'gcc' 'autoconf' 'automake' 'libtool' 'pkgconf' 'meson' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-typing_extensions: for Python <3.8'
            'rustup: for injecting Rust code into targets'
            'python-epc')
conflicts=('python-frida')
provides=('python-frida=${pkgver}')
source=("git+https://github.com/frida/frida.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/frida"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/frida"

  # The options after -- are passed directly to Meson’s setup command.
  # Force enable gadget, server, inject. It's totally fine to disable them. 
  ./configure --prefix=/usr -- \
    -Dgadget=enabled \
    -Dserver=enabled \
    -Dinject=enabled
}

build() {
  cd "$srcdir/frida"
  # Namcap warns about "lacks FULL RELRO". 
  # Not sure enabling the flags won't break frida.
  # export CFLAGS+=" -fPIC"
  # export LDFLAGS+=" -Wl,-z,relro -Wl,-z,now"
  make
}

package() {
  cd "$srcdir/frida"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/frida/COPYING" \
    "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
