pkgname=hamster-time-tracker-git
pkgver=2.0.rc1.r10.gc3e5fb7
pkgrel=1
pkgdesc="Time tracking application that helps you to keep track on how much time you have spent during the day on activities you choose to track"
arch=('any')
url="http://projecthamster.wordpress.com/"
license=('GPL')
depends=('python2-dbus' 'python2-gconf' 'python2-notify' 'python2-wnck' 'python2-xdg' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
provides=('hamster-time-tracker')
conflicts=('hamster-time-tracker' 'hamster-applet')
replaces=('hamster-applet')
install=$pkgname.install
source=('git+https://github.com/projecthamster/hamster.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hamster"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/hamster"
  python2 ./waf configure --prefix=/usr
  python2 ./waf build
}

package() {
  cd "$srcdir/hamster"
  python2 ./waf install --destdir=$pkgdir

  # Move bash completion and GConf schema to its correct place
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/etc/bash_completion.d/hamster.bash" "$pkgdir/usr/share/bash-completion/completions/hamster"
  mv "$pkgdir/etc/gconf" "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
}
