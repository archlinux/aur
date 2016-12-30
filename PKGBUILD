# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ntpsec-git
pkgver=0.9.6.r1.76e974cf1
pkgrel=1
pkgdesc="Security-hardened Network Time Protocol implementation (Git HEAD)"
arch=('i686' 'x86_64')
url="https://www.ntpsec.org/"
license=('custom')
depends=('avahi' 'libevent' 'libseccomp' 'python')
makedepends=('asciidoc' 'git' 'pps-tools' 'w3m')
optdepends=('gnuplot: for ntpviz'
            'libevent: for ntpdig'
            'python-psutil: Optional for ntpviz, allows running with ionice'
            'ttf-liberation: Improves font quality in ntpviz renderings')
provides=('ntp' 'ntpsec')
conflicts=('ntp' 'ntpsec')
source=("git+https://gitlab.com/NTPsec/ntpsec")
sha256sums=('SKIP')
validpgpkeys=('DA3FDF774CC70FA64729EC4505D9B371477C7528')

pkgver() {
  cd "${pkgname%%-git}"
  printf "%s" "$(git describe --long | sed -e 's/NTPsec_//' -e 's/\_/-/g' -e 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%%-git}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  sed -i -e 's/sbin/bin/g' "etc/ntpd.service"
}

build() {
  cd "${pkgname%%-git}"
  ./waf configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib \
        --enable-debug-gdb --enable-seccomp --refclock=all \
        --sbindir=/usr/bin --enable-doc --htmldir=/usr/share/doc/${pkgname}
  ./waf build
  a2x -f text docs/copyright.txt
}

check() {
  cd "${pkgname%%-git}"
  ./waf check
}

package() {
  cd "${pkgname%%-git}"
  ./waf install --destdir="$pkgdir/"

  install -d "$pkgdir/etc/logrotate.d"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -m 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -m 644 etc/ntpd.service "$pkgdir/usr/lib/systemd/system/ntpd.service"
  install -m 644 docs/copyright.text "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  # --mandir, it does nothing!
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
