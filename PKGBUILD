# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on multilib/lib32-systemd by:
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

pkgname=lib32-systemd-git
_pkgbasename=systemd
pkgver=250.r192.gcd933f14bd
pkgrel=1
pkgdesc='system and service manager (32-bit, git version)'
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
license=('GPL2' 'LGPL2.1')
depends=('lib32-gcc-libs' 'lib32-libcap' 'lib32-libgcrypt' 'lib32-libxcrypt'
         'lib32-xz' 'lib32-zstd' 'systemd-git')
provides=("lib32-systemd=$pkgver")
conflicts=('lib32-systemd')
makedepends=('git' 'gperf' 'intltool' 'lib32-acl' 'lib32-bzip2'
             'lib32-curl' 'lib32-dbus' 'lib32-gcc-libs' 'lib32-glib2'
             'lib32-gnutls' 'lib32-libelf' 'lib32-libidn2' 'lib32-pcre2'
             'libxslt' 'meson' 'python-jinja')
source=('git+https://github.com/systemd/systemd')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgbasename"

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
    1.1.1.1#cloudflare-dns.com
    9.9.9.10#dns.quad9.net
    8.8.8.8#dns.google
    2606:4700:4700::1111#cloudflare-dns.com
    2620:fe::10#dns.quad9.net
    2001:4860:4860::8888#dns.google
  )
 
  local _meson_options=(
    --libexecdir  /usr/lib32
    --libdir    /usr/lib32

    # internal version comparison is incompatible with pacman:
    #   249~rc1 < 249 < 249.1 < 249rc
    -Dversion-tag="${pkgver/-/\~}-${pkgrel}-arch"
    -Dmode=release

    # features
    -Daudit=false
    -Dblkid=false
    -Dgnu-efi=false
    -Dima=false
    -Dkmod=false
    -Dlibcryptsetup=false
    -Dlibidn2=true
    -Dlibiptc=false
    -Dlz4=false
    -Dmicrohttpd=false
    -Dpam=false
    -Dseccomp=false

    # components
    -Dutmp=false
    -Dhibernate=false
    -Dldconfig=false
    -Dresolve=true
    -Defi=false
    -Dtpm=false
    -Denvironment-d=false
    -Dbinfmt=false
    -Drepart=false
    -Dcoredump=false
    -Dpstore=false
    -Doomd=false
    -Dlogind=false
    -Dhostnamed=false
    -Dlocaled=false
    -Dmachined=true
    -Dportabled=false
    -Dsysext=false
    -Duserdb=false
    -Dhomed=false
    -Dnetworkd=false
    -Dtimedated=false
    -Dtimesyncd=false
    -Dremote=false
    -Dcreate-log-dirs=false
    -Dnss-myhostname=true
    -Dnss-mymachines=true
    -Dnss-resolve=true
    -Dnss-systemd=true
    -Dfirstboot=false
    -Drandomseed=false
    -Dbacklight=false
    -Dvconsole=false
    -Dquotacheck=false
    -Dsysusers=false
    -Dtmpfiles=false
    -Dimportd=false
    -Dhwdb=false
    -Drfkill=false
    -Dxdg-autostart=false
    -Dman=false
    -Dhtml=false
    -Dtranslations=false

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-hierarchy=unified
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
