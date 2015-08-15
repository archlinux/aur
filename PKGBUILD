# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Contributor: tuxce.net <tuxce.net@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lxc-git
pkgver=1.1.0.89.g83828d6
epoch=1
_pkgname=lxc
_gitname=${_pkgname}
pkgrel=1
pkgdesc="Linux Containers from git"
arch=('i686' 'x86_64')
url="http://linuxcontainers.org"
depends=('bash' 'perl' 'libseccomp' 'libcap' 'python' 'cgmanager')
makedepends=('git' 'docbook2x' 'lua')
optdepends=('arch-install-scripts: for archlinux template'
	    'lua'
	    'lua-filesystem: lxc-top'
	    'lua-alt-getopt: lxc-top')
license=('LGPL')
options=('emptydirs')
backup=('etc/lxc/default.conf')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/lxc/lxc"
	"lxc.tmpfiles.d"
	"lxc.service")
md5sums=("SKIP"
         'df94c9fb8a753011c86ee664e9f521ff'
         '32db4ef06b27f36e15ff4b67c049dfeb')

prepare() {
  cd "$_gitname"
  sed -i \
    -e 's|"\\"-//Davenport//DTD DocBook V3.0//EN\\""|"\\"-//OASIS//DTD DocBook XML\\" \\"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\\""|' \
    configure.ac
}

pkgver() {
  cd "$_gitname"
#  git --no-pager describe --tags | sed 's:-:.:g'
  git --no-pager describe --tags | sed 's:^lxc-::' | sed 's:-:.:g'
}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --disable-apparmor \
    --enable-seccomp \
    --enable-cgmanager \
    --enable-capabilities \
    --enable-lua
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 ${srcdir}/lxc.service ${pkgdir}/usr/lib/systemd/system/lxc@.service
  install -D -m644 ${srcdir}/lxc.tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
