pkgname=douane-daemon-git
pkgver=1
pkgrel=4
pkgdesc="Douane Firewall Kernel Daemon"
arch=('i686' 'x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('')
makedepends=('git'
             'boost'
             'log4cxx'
             'gtkmm3'
             'dbus-c++'
             'polkit')
install="douane-daemon-git.install"
source=('git+https://github.com/Douane/douane-daemon.git'
        'git+https://github.com/Douane/douane-dbus.git'
        'douane-daemon.service'
	'douane_makefile.patch'
	'douane-daemon_return_failure.patch'
	'douane-daemon_rules_path.patch')
sha512sums=('SKIP'
	    'SKIP'
	    '47735c453fefcda64a1ab2409fa8200ec878162543282b9243c359a6dcb6d5a1b9f49c39cbada58597962f011a167183e0cc58cf4a5ca9ba0d1c02b9cd36ea74'
	    'a4e53736fbeab38e1c912806e126f008dc48100be0ae268480932f817486ce0e0cfe63968ef5d54e5a76b15a70f1fea060cb85958bce2c5701363406a29dff4a'
	    '64d498a25f1a70239f69ae6647b51334884ad194c1d058eae7f9e5761045332c6d60300be0dd3cfd976fdc8e3c179e122a114b720cd5453a87a29779653f4b82'
	    'beb8aa7a072de2ba66ea6f4928ce79e4ec88e2be5efaed1e6eb9d700e4dd4793e126e730883953af30afb8ed48d04ba07879fdc605e1a3a9d74bcb92b6243e63')

prepare() {
  cd "$srcdir/douane-daemon"
  git submodule init
  git config submodule.douane-dbus.url $srcdir/douane-dbus
  git submodule update
  patch -i "${srcdir}/douane_makefile.patch"
  patch -i "${srcdir}/douane-daemon_return_failure.patch"
  patch -i "${srcdir}/douane-daemon_rules_path.patch"
}

build() {
  cd "$srcdir/douane-daemon"
  make
}

package() {
  install -d "${pkgdir}/var/lib/douane"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -m644 douane-daemon.service "${pkgdir}"/usr/lib/systemd/system/
  cd "$srcdir/douane-daemon"
  make DESTDIR="${pkgdir}" install
}
