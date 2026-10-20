# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok-chromium-twinkie
_pkgname=libsigrok
pkgver=0.5.2
pkgrel=2
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL-3.0-or-later')
depends=(
  'bluez-libs'
  'glib2'
  'glibc'
  'glibmm'
  'hidapi'
  'libftdi'
  'libgcc'
  'libieee1284'
  'libserialport'
  'libsigc++'
  'libstdc++'
  'libusb'
  'libzip'
)
makedepends=(
  'autoconf-archive'
  'cmake'
  'doxygen'
  'git'
  'jdk8-openjdk'
  'python'
  'python-gobject'
  'python-numpy'
  'python-setuptools'
  'ruby'
  'swig'
)
optdepends=(
  'jdk8-openjdk'
  'python'
  'ruby'
  'sigrok-firmware-fx2lafw: Cypress FX2-based device support'
)
options=(!lto) # FS#78381
conflicts=(libsigrok)
provides=(libsigrok)
source=(
  "git+git://sigrok.org/libsigrok#tag=libsigrok-$pkgver"
  "$_pkgname-swig-4.1.patch"
  "$_pkgname-fix-ruby-binding-location.patch"
  "$_pkgname-python-3.14.patch"
  "$_pkgname-python-3.14-PyInt.patch"
  "chromium-twinkie-driver.patch"
  "chromium-twinkie-vbus-channels.patch"
)
b2sums=('SKIP'
        '4dfed37681870e312acf8844aed8a69ef4998f446b8565552258c38d824f566257e559e5d909282bf2d8f1202019bcfc070722abba6b34ff36c4b81b6ffccc04'
        '348ba0e8615b81001444d6888eb392bfd5cc07fd71adff4bd65b6525a29cbf0cb76dd7b3aadd0971865a8fa482769d624d632c6fdd3e17b6fcaf2c75dff5aaab'
        '9141203f928d6152f04b3962015645369cfbc72e3b7649b34c6fc2e385ee0f47c120063148e2edb699f0e494b19a09a3e3a780630786bbd3266fc82d7902a446'
        '3b22ab62c5edaef0c19fd6891cae8d056013e24c96972398859b9c043f4b717a139e89dad21159a4516ef18db0b330586a51eb4f1d32d316e5cd1048d1798cd8'
        'b6566f39b00f832f4a947f7a4a3e4d1a0febabc85d8e6f082e08ee13140f4e6c44d68eb66bbc913b506fe5c9c4a36cf5ae3296a585f9814f7aa77c5bebee45c1'
        '51387ffdc9a9448a34b58fbcbf96c48cfeff1c0d11083c81374d0637547e1b19259b741cde5396b8cb4dff540dea72fb5a75b719bf02e8f7c012ced38d6542c6')

prepare() {
  cd $_pkgname
  git config user.name builduser
  git config user.email builduser@archlinux

  # bindings/java: Fix build issue with SWIG 4.x.
  git cherry-pick e803574173bdac8a7f33085a648c29eaf248a394
  # bindings/ruby: Fix ruby SWIG bindings generation
  git cherry-pick 2e199405e53fee2fb3cad72858ebe7af6990bce0
  # bindings/python: rephrase for Python 3.9 deprecation (call API)
  git cherry-pick 5bc8174531df86991ba8aa6d12942923925d9e72 # Oct 2 18:33:08 2023

  # https://sigrok.org/bugzilla/show_bug.cgi?id=1827
  patch -p1 < ../$_pkgname-swig-4.1.patch

  patch -p1 < ../$_pkgname-fix-ruby-binding-location.patch
  patch -p1 < ../$_pkgname-python-3.14.patch
  patch -p1 < ../$_pkgname-python-3.14-PyInt.patch

  patch -p1 < ../chromium-twinkie-driver.patch
  patch -p1 < ../chromium-twinkie-vbus-channels.patch

  # regenerate ./configure so it can detect Python 3.10
  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --enable-ruby
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr INSTALL_EXTRA= install
  make DESTDIR="$pkgdir" PREFIX=/usr python-install
  install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" \
    contrib/60-libsigrok.rules \
    contrib/61-libsigrok-uaccess.rules
}
