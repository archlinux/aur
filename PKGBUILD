# Maintainer: Timothy Brown <sysop@timb.us>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ntpsec-git
pkgver=1.1.8.r179.fbdccec18
pkgrel=1
pkgdesc="Security-hardened Network Time Protocol implementation (Git HEAD)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.ntpsec.org/"
license=('custom')
depends=('avahi' 'libbsd' 'libseccomp' 'python')
makedepends=('asciidoc' 'git' 'pps-tools' 'w3m')
optdepends=('gnuplot: for ntpviz'
            'libevent: for ntpdig'
            'python-psutil: Optional for ntpviz, allows running with ionice'
            'ttf-liberation: Improves font quality in ntpviz renderings')
provides=('ntp' 'ntpsec')
conflicts=('ntp' 'ntpsec')
source=("git+https://gitlab.com/NTPsec/ntpsec.git")
sha512sums=('SKIP')
backup=('etc/ntp.d/default.conf'
        'etc/ntp.d/use-pool')

pkgver() {
  cd "${pkgname%%-git}"
  printf "%s" "$(git describe --long | sed -e 's/NTPsec_//' -e 's/\_/-/g' -e 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%%-git}"

  for patch in ../../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "${pkgname%%-git}"
  ./waf configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man \
        --enable-debug-gdb --enable-seccomp --refclock=all \
        --htmldir=/usr/share/doc/${pkgname}
  ./waf build
  a2x -f text docs/copyright.adoc
}

check() {
  cd "${pkgname%%-git}"
  ./waf check
}

package() {
  cd "${pkgname%%-git}"
  ./waf install --destdir="$pkgdir/"

  install -Dm 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -Dm 644 docs/copyright.text "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 ../../ntpsec.sysusers "$pkgdir/usr/lib/sysusers.d/ntpsec.conf"
  install -dm 700 -g 212 -o 212 "$pkgdir/var/lib/ntp"
  for configfile in etc/ntp.d/*; do
    install -Dm 644 "$configfile" "$pkgdir/$configfile"
  done
}