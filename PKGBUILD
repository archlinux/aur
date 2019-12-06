# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Credit: Christian Hesse <mail@eworm.de>
# Credit: Dave Reisner <dreisner@archlinux.org>
# Credit: Tom Gundersen <teg@jklm.no>

pkgname=lib32-systemd-git
_pkgname=lib32-systemd
_pkgbasename=systemd
pkgver=244.r123.g36f43076b9
pkgrel=1
pkgdesc='system and service manager (32-bit, git version)'
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
license=('GPL2' 'LGPL2.1')
depends=('lib32-gcc-libs' 'lib32-libcap' 'lib32-libgcrypt' 'lib32-xz' 'systemd-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'gperf' 'intltool' 'lib32-acl' 'lib32-bzip2'
             'lib32-curl' 'lib32-dbus' 'lib32-gcc-libs' 'lib32-glib2'
             'lib32-gnutls' 'lib32-libelf' 'lib32-libidn2' 'lib32-pcre2'
             'libxslt' 'meson')
options=('!strip')
source=('git+https://github.com/systemd/systemd')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgbasename"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local _timeservers=({0..3}.arch.pool.ntp.org)
  local _nameservers=(
    # We use these public name services, ordered by their
    # privacy policy (hopefully):
    #  * Cloudflare (https://1.1.1.1/)
    #  * Quad9 without filtering (https://www.quad9.net/)
    #  * Google (https://developers.google.com/speed/public-dns/)
    1.1.1.1
    9.9.9.10
    8.8.8.8
    2606:4700:4700::1111
    2620:fe::10
    2001:4860:4860::8888
  )
 
  local _meson_options=(
    --libexecdir  /usr/lib32
    --libdir    /usr/lib32

    -Dversion-tag="${pkgver}-${pkgrel}-arch"

    -Daudit=false
    -Dgnu-efi=false
    -Dima=false
    -Dlibidn2=true
    -Dlz4=false
    -Dblkid=false
    -Dkmod=false
    -Dlibcryptsetup=false
    -Dlibiptc=false
    -Dmanpages=false
    -Dnetworkd=false
    -Dpam=false
    -Dpython=false
    -Dseccomp=false
    -Dman=false
    -Dhtml=false

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-hierarchy=hybrid
    -Ddefault-kill-user-processes=false
    -Ddefault-locale=C
    -Dfallback-hostname='archlinux'
    -Dnologin-path=/usr/bin/nologin
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=
  )

  arch-meson "$_pkgbasename" build "${_meson_options[@]}"

  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  rm -rf "${pkgdir}"/{etc,var}
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}
