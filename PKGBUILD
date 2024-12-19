# Maintainer: Thorsten Toepper <atsutane-aur at freethoughts dot de>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on multilib/lib32-systemd by Christian Hesse <mail@eworm.de>

pkgname=lib32-systemd-git
_pkgbasename=systemd
pkgver=258.devel.r78225.3cbf00a30c0
pkgrel=1
pkgdesc='system and service manager (32-bit git version)'
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
license=('LGPL-2.1-or-later')
depends=('systemd-libs-git' 'lib32-gcc-libs' 'lib32-libcap' 'lib32-libgcrypt'
         'lib32-libxcrypt' 'lib32-xz' 'lib32-zstd')
makedepends=('git' 'gperf' 'intltool' 'lib32-acl' 'lib32-bzip2'
             'lib32-curl' 'lib32-dbus' 'lib32-gcc-libs' 'lib32-glib2'
             'lib32-gnutls' 'lib32-libelf' 'lib32-libidn2' 'lib32-pcre2'
             'libxslt' 'meson' 'python-jinja')
checkdepends=('systemd-git')
provides=('libsystemd.so' 'libudev.so')
provides+=("lib32-systemd=${pkgver}")
conflicts=('lib32-systemd')
options=('strip')
source=("${_pkgbasename}-stable::git+https://github.com/systemd/systemd")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgbasename}-stable"
  # Upstream versioning is incompatible with pacman's version comparisons, one
  # way or another. So we replace dashes and tildes to make sure pacman's
  # version comparing does the right thing for rc versions:
  local _major=`sed 's/~/./g' meson.version`
  printf "%s.r%s.%s" "${_major}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local _timeservers=({0..3}.arch.pool.ntp.org)
  local _nameservers=(
    # We use these public name services, ordered by their privacy policy (hopefully):
    #  * Cloudflare (https://1.1.1.1/)
    #  * Quad9 (https://www.quad9.net/)
    #  * Google (https://developers.google.com/speed/public-dns/)
    '1.1.1.1#cloudflare-dns.com'
    '9.9.9.9#dns.quad9.net'
    '8.8.8.8#dns.google'
    '2606:4700:4700::1111#cloudflare-dns.com'
    '2620:fe::9#dns.quad9.net'
    '2001:4860:4860::8888#dns.google'
  )
 
  local _meson_options=(
    --libexecdir	/usr/lib32
    --libdir		/usr/lib32

    -Dversion-tag="${pkgver}-${pkgrel}-arch"
    -Dshared-lib-tag="${pkgver}-${pkgrel}"
    -Dmode=release

    # components & features
    -Dapparmor=disabled
    -Daudit=disabled
    -Dbacklight=false
    -Dbinfmt=false
    -Dblkid=disabled
    -Dbootloader=disabled
    -Dbpf-framework=disabled
    -Dcoredump=false
    -Dcreate-log-dirs=false
    -Defi=false
    -Denvironment-d=false
    -Dfirstboot=false
    -Dhibernate=false
    -Dhomed=disabled
    -Dhostnamed=false
    -Dhtml=disabled
    -Dhwdb=false
    -Dima=false
    -Dimportd=disabled
    -Dkmod=disabled
    -Dldconfig=false
    -Dlibarchive=disabled
    -Dlibcryptsetup=disabled
    -Dlibcryptsetup-plugins=disabled
    -Dlibfido2=disabled
    -Dlibidn2=enabled
    -Dlibiptc=disabled
    -Dlocaled=false
    -Dlogind=false
    -Dlz4=disabled
    -Dmachined=true
    -Dman=disabled
    -Dmicrohttpd=disabled
    -Dnetworkd=false
    -Dnss-myhostname=true
    -Dnss-mymachines=enabled
    -Dnss-resolve=enabled
    -Dnss-systemd=true
    -Doomd=false
    -Dpam=disabled
    -Dpasswdqc=disabled
    -Dportabled=false
    -Dpstore=false
    -Dpwquality=disabled
    -Dqrencode=disabled
    -Dquotacheck=false
    -Drandomseed=false
    -Dremote=disabled
    -Drepart=disabled
    -Dresolve=true
    -Drfkill=false
    -Dseccomp=disabled
    -Dselinux=disabled
    -Dsysext=false
    -Dsysusers=false
    -Dtimedated=false
    -Dtimesyncd=false
    -Dtmpfiles=false
    -Dtpm2=disabled
    -Dtpm=false
    -Dtranslations=false
    -Dukify=disabled
    -Duserdb=false
    -Dutmp=false
    -Dvconsole=false
    -Dxdg-autostart=false
    -Dxenctrl=disabled
    -Dxkbcommon=disabled

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-kill-user-processes=false
    -Ddefault-locale='C.UTF-8'
    -Dfallback-hostname='archlinux'
    -Dnologin-path=/usr/bin/nologin
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=
  )

  arch-meson "${_pkgbasename}-stable" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  rm -rf "${pkgdir}"/{etc,var}
  rm -rf "${pkgdir}"/usr/{bin,include,lib,lib32/systemd,share}
}
