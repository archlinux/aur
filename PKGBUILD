# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Thanasis Georgiou <contact@thgeorgiou.com>

pkgname=imwheel-patched
pkgver=1.0.0pre12
pkgrel=16
pkgdesc='Mouse wheel configuration tool for XFree86/Xorg (have patches from debian, fixed @Exclude command)'
arch=('x86_64')
url='https://salsa.debian.org/debian/imwheel'
license=('GPL')
makedepends=('git')
depends=('libxtst' 'libxmu')
provides=('imwheel')
install='imwheel.install'
backup=('etc/X11/imwheel/imwheelrc'
        'etc/X11/imwheel/startup.conf')
source=("git+$url.git/#commit=1d6940c1630c05292039a75e4b3de3b3e5dab518"
        'etcdir-install.patch')
sha256sums=('SKIP'
            '602a466e5537e7edb53247648fef62ea5bfa51e56f68dfd9f4fcb4b19e38fd16')

prepare() {
  cd 'imwheel'
  # patch to fix buggy location of ETCDIR
  patch -p1 -i "${srcdir}/etcdir-install.patch"
  # debian
  for i in debian/patches/*.patch; do patch -p1 -i $i; done
}

build() {
  cd 'imwheel' && ./configure --prefix=/usr --mandir=/usr/share/man && make
}

package() {
  cd 'imwheel'
  make DESTDIR="$pkgdir/" install
  #debian
  gzip -vf ./debian/changelog
  gzip -vf ./debian/README.Debian
  install -Dm644 './debian/60imwheel_start-imwheel' "$pkgdir/etc/X11/Xsession.d/60imwheel_start-imwheel"
  install -Dm644 './debian/61imwheel_load-xmodmap' "$pkgdir/usr/share/doc/imwheel/examples/61imwheel_load-xmodmap"
  install -Dm644 './debian/copyright' "$pkgdir/usr/share/doc/imwheel/copyright"
  install -Dm644 './debian/changelog.gz' "$pkgdir/usr/share/doc/imwheel/changelog.gz"
  install -Dm644 './debian/README.Debian.gz' "$pkgdir/usr/share/doc/imwheel/README.gz"
  install -Dm644 './debian/startup.conf' "$pkgdir/etc/X11/imwheel/startup.conf"
  # weird behaver if you previously installed this package in system..
  # not dig it too much, rename it here.
  if [ -e "$pkgdir/etc/X11/imwheel/imwheelrc.new" ]; then
    mv -v "$pkgdir/etc/X11/imwheel/imwheelrc.new" "$pkgdir/etc/X11/imwheel/imwheelrc"
  fi
}
