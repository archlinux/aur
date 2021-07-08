# Maintainer: dreieck
# Contriburor: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

_pkgname=lxc
_pkgvariant=nosystemd
pkgname="${_pkgname}-${_pkgvariant}-git"
pkgver=4.0.0.r1729.g78598e2b3
pkgrel=2
pkgdesc="Linux Containers git version. Without systemd dependencies."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://linuxcontainers.org"
depends=('bash' 'perl' 'libseccomp' 'libcap' 'python' 'rsync' 'wget')
makedepends=('docbook2x' 'lua' 'python-setuptools' 'apparmor' 'git')
optdepends=(
  'lua'
  'lua-filesystem: lxc-top'
  'lua-alt-getopt: lxc-top'
)
license=('LGPL')
options=('emptydirs')
backup=('etc/lxc/default.conf'
  'etc/default/lxc')
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
  "${_pkgname}-sysvinit=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-${_pkgvariant}"
  'anbox-launchers-git'
)
source=(
  "${_pkgname}::git://github.com/lxc/lxc"
  # to build from the stable branch instead of master use
  # ${_pkgname}-stable-4.0::git://github.com/lxc/lxc#branch=stable-4.0
  "lxc.tmpfiles.d"
)
sha256sums=(
  'SKIP'
  '10e4f661872f773bf3122a2f9f2cb13344fea86a4ab72beecb4213be4325c479'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^lxc-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -e 's|"\\"-//Davenport//DTD DocBook V3.0//EN\\""|"\\"-//OASIS//DTD DocBook XML\\" \\"https://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\\""|' -i configure.ac
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  bashcompdir=/usr/share/bash-completion/completions ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --enable-doc \
    --enable-api-docs \
    --enable-apparmor \
    --enable-openssl \
    --disable-selinux \
    --enable-seccomp \
    --enable-capabilities \
    --enable-examples \
    --enable-bash \
    --enable-tools \
    --enable-commands \
    --enable-pam \
    --disable-werror \
    --with-init-script=sysvinit \
    --with-pamdir=/usr/lib/security
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 "$srcdir"/lxc.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
