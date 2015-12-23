# Maintainer: Kamran Mackey <kamranm1200@gmail.com>

_pkgbase=git
pkgbase=git-git
pkgname=('git-git')
pkgver=v2.7.0.rc2.r0.g554f6e4
pkgrel=1
pkgdesc="A fast distributed version control system"
arch=('i686' 'x86_64')
url='http://git-scm.com/'
license=('GPL2')
depends=('git' 'asciidoc' 'gettext' 'openssl' 'expat' 'xmlto' 'curl' 'zlib' 'perl')
conflicts=('git')
provides=('git')
install=git-git.install
source=("git://github.com/git/git.git"
        git-daemon@.service
        git-daemon.socket)
md5sums=('SKIP'
         '042524f942785772d7bd52a1f02fe5ae'
         'f67869315c2cc112e076f0c73f248002')
_gitname=git

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgbase}"
}

build() {
 cd "$_gitname"
 make clean
 make configure
 ./configure prefix=/usr
 make prefix=/usr \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    MAN_BOLD_LITERAL=1 \
    all doc
}

package() {
 cd "$_gitname"
 make DESTDIR="$pkgdir" install install-doc

  # git-daemon via systemd socket activation
  install -D -m 644 "$srcdir"/git-daemon@.service "$pkgdir"/usr/lib/systemd/system/git-daemon@.service
  install -D -m 644 "$srcdir"/git-daemon.socket "$pkgdir"/usr/lib/systemd/system/git-daemon.socket
}
