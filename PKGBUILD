# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pam-selinux
pkgver=1.7.3
pkgrel=1
pkgdesc="SELinux aware PAM (Pluggable Authentication Modules) library"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-only')
url="http://linux-pam.org"
depends=(
  audit
  glibc
  libaudit.so
  libcrypt.so
  libnsl
  libselinux
  libtirpc
  libxcrypt
  pambase-selinux
  systemd-libs
)
makedepends=(
  docbook-xml
  docbook-xsl
  docbook5-xml
  flex
  fop
  git
  libxslt
  meson
  w3m
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=(
  libpam.so
  libpamc.so
  libpam_misc.so
  "${pkgname/-selinux}=${pkgver}-${pkgrel}"
  "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}"
)
backup=(
  etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pwhistory.conf,pam_env.conf,time.conf}
  etc/environment
)
groups=('selinux')
source=("pam::git+https://github.com/linux-pam/linux-pam?signed#tag=v${pkgver}"
        "${pkgname/-selinux}.tmpfiles")
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' # Dimitry V. Levin <ldv@altlinux.org>
        '7BECFE3AF7B280BB52FF77F104BA4521C996DDE1' # Dmitry V. Levin <ldv@strace.io
)
b2sums=('a533679b3362f9ebb67a7652454af9402ee845e1bd6f99064b870b38f9dc7a6ec62a73d65af2086e863448742714b6eb6a91d0ad2209e77325fd127635230648'
        '36582c80020008c3810b311a2e126d2fb4ffc94e565ea4c0c0ab567fdb92943e269781ffa548550742feb685847c26c340906c7454dcc31df4e1e47d511d8d6f')
options=('!emptydirs')

prepare() {
  cd "${pkgname/-selinux}"
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch ${src}..."
    patch -Np1 < "../${src}"
  done
}

build() {
  arch-meson "${pkgname/-selinux}" \
    -Dlogind=enabled \
    -Deconf=disabled \
    -Dselinux=enabled \
    -Delogind=disabled \
    -Dpam_userdb=disabled \
    -Dpwaccess=disabled \
    -Dvendordir='' \
    build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 ${pkgname/-selinux}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname/-selinux}.conf

  # remove unreproducible pdf files
  rm "${pkgdir}"/usr/share/doc/Linux-PAM/*.pdf

  # set unix_chkpwd uid
  chmod +s "${pkgdir}"/usr/bin/unix_chkpwd
}

