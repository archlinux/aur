# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Maintainer: Marc Mettke (marc@itmettke.de)
# Based on the official PKGBUILD (https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/lxc)

pkgname=lxc-selinux
epoch=1
pkgver=4.0.9
pkgrel=1
pkgdesc="Linux Containers"
arch=('x86_64')
url="https://linuxcontainers.org"
depends=('bash' 'perl' 'libseccomp' 'libcap' 'python' 'rsync' 'wget' 'libselinux')
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
conflicts=("${pkgname/-selinux}")
makedepends=('docbook2x' 'lua' 'python-setuptools')
optdepends=('dnsmasq: lxc-net.service'
	    'lua'
	    'lua-filesystem: lxc-top'
	    'lua-alt-getopt: lxc-top')
license=('LGPL')
options=('emptydirs')
backup=('etc/lxc/default.conf'
	'etc/default/lxc')
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67')
source=("https://linuxcontainers.org/downloads/lxc/${pkgname/-selinux}-${pkgver}.tar.gz"{,.asc}
	"fix-70736.patch::https://github.com/lxc/lxc/commit/86c780115a6ad14673f0b6b057219020b0523014.patch"
	"lxc.tmpfiles.d"
	"lxc.service"
	"lxc-auto.service")
sha256sums=('1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c793ab3c62b86f37e52b'
            'SKIP'
            '05031e6e12768a0928adbf2c745f11a8d9152428e0bf3ea81eee1855f27ca540'
            '10e4f661872f773bf3122a2f9f2cb13344fea86a4ab72beecb4213be4325c479'
            'bbe7e0447bc3bf5f75f312c34d647f5218024731628a5e8633b1ea1801ebe16b'
            'b31f8d6b301ab9901b43f2696bcd0babb32b96e4a59fab63a2d642e43bf26bb3')

prepare() {
  cd "$srcdir/${pkgname/-selinux}-${pkgver/_/-}"
  sed -i \
    -e 's|"\\"-//Davenport//DTD DocBook V3.0//EN\\""|"\\"-//OASIS//DTD DocBook XML\\" \\"https://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\\""|' \
    configure.ac
    # https://bugs.archlinux.org/task/70736
    # https://github.com/lxc/lxc/pull/3827
    patch -Np1 < "$srcdir/fix-70736.patch"
}

build() {
  cd "$srcdir/${pkgname/-selinux}-${pkgver/_/-}"
  ./autogen.sh
  bashcompdir=/usr/share/bash-completion/completions ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --disable-apparmor \
    --enable-selinux \
    --enable-seccomp \
    --enable-capabilities \
    --with-init-script=systemd \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-pam \
    --with-pamdir=/usr/lib/security
  make
}

package() {
  cd "$srcdir/${pkgname/-selinux}-${pkgver/_/-}"

  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 "$srcdir"/lxc.service "$pkgdir"/usr/lib/systemd/system/lxc@.service
  install -D -m644 "$srcdir"/lxc-auto.service "$pkgdir"/usr/lib/systemd/system/lxc-auto.service
  install -D -m644 "$srcdir"/lxc.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
