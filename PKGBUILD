# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thom Wiggers <pkgbuild@thomwiggers.nl>
# Contributor: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

_pkgbase=networkmanager-iodine
pkgname="${_pkgbase}-git"
pkgver=1.4.0.r2.g872e6b4
pkgrel=2
pkgdesc="Iodine plugin for NetworkManager (git build)"
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/network-manager-iodine'
license=('GPL-2.0-or-later')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'iodine'
  'libgcc'
  'libnm'
  'libnma-gtk4'
  'libsecret'
  'networkmanager'
)
makedepends=('git' 'intltool')
provides=("${_pkgbase}=${pkgver%.r*}")
conflicts=("${_pkgbase}")
source=(
  "${pkgname}::git+${url}.git"
  "${_pkgbase}.sysusers"
  "${_pkgbase}.tmpfiles"
)
b2sums=('SKIP'
        '44a3b1fa3d00d50869e952d17ffc8a98a8579efdca44398a57615f4fba2ea6597dd1684e224df2358ee0c1162689a42fe81be1526cc51d921ae2cf1bef3348b6'
        '5ce2415ab7527cea21e93b89f68a8b990e655993a2c93a598a8bb825d7099ea08c9b7243f831139b0833e33199c5939c6cf0de6fdd52d08d1c048010d7237818')

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"

  # Same steps as upstream's autogen.sh, minus its configure call, which
  # forces --enable-maintainer-mode and --enable-more-warnings=error (-Werror).
  autoreconf --install
  intltoolize --force
  autoreconf
}

build() {
  cd "${srcdir}/$pkgname"

  # Configure here rather than in prepare(): makepkg only adds the debug and
  # LTO flags to the environment after prepare() has run.
  echo "Adding LDFLAGS values to CFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  # localstatedir decides where the service puts iodine's chroot directory
  # (LOCALSTATEDIR/run/nm-iodine); the default would be /usr/var.
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install

  # The service only drops privileges (iodine -u) if the nm-iodine user exists.
  install -Dm644 "${srcdir}/${_pkgbase}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
  # Pre-create the chroot directory: upstream creates it with a broken mode
  # (decimal 700 instead of octal 0700) but leaves an existing one alone.
  install -Dm644 "${srcdir}/${_pkgbase}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
