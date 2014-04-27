pkgname=douane-daemon
pkgver=1
pkgrel=1
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
source=('git+https://github.com/Douane/douane-daemon.git'
        'git+https://github.com/Douane/douane-dbus.git'
        'douane-daemon.service')
md5sums=('SKIP'
         'SKIP'
         '6ac26b739a71fcbae69972d599befbba')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.douane-dbus.url $srcdir/douane-dbus
  git submodule update
}

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  msg2 "Starting make..."
  make
}

package() {
  
   # Main service (in case it doesn't exist or owned by us)
    if [[ ! -f /usr/lib/systemd/system/douane-daemon.service || $(pacman -Qo /usr/lib/systemd/system/douane-daemon.service 2>&-) ]]; then
	install -d "${pkgdir}"/usr/lib/systemd/system/
        install -m644 douane-daemon.service "${pkgdir}"/usr/lib/systemd/system/
    else
        warning "Not overwriting /usr/lib/systemd/system/douane-daemon.service"
    fi

  # Install
  cd "$srcdir/$pkgname"
  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  msg2 "Remember to run systemctl enable douane-daemon after install."

}