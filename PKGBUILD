# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=pm-utils-debian
_debian_rel=15
pkgver=1.4.1
pkgrel=1
epoch=1
pkgdesc="Utilities and scripts for suspend and hibernate power management"
arch=(any)
url="http://pm-utils.freedesktop.org"
license=(GPL)
depends=(bash procps pm-quirks)
makedepends=(xmlto docbook-xml docbook-xsl)
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("http://pm-utils.freedesktop.org/releases/${pkgname%-*}-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname%-*}/${pkgname%-*}_${pkgver}-${_debian_rel}.debian.tar.xz")
sha512sums=('5bc9479fe75f120aee136befeb24c8d7d85f61410b551177ed61fd1b4ea9cce7989796b067e357ea93b44b4ae9f66311687066f188236c5efdfd3750695a8017'
            'cfac0d6482003f5c3375816749590dd1653c55bd0579e10f0a8d28163d1b87e72f5cbd7685b71478b5ce7f0fe4e7cd3c232d56d49ef839e1062665cc3c422db7')

build() {
  cd "${pkgname%-*}-${pkgver}"

  sed -i '/06-quirk-lkw-cache.patch/d' ../debian/patches/series
  sed -i '/80-service.patch/d' ../debian/patches/series

  for i in $(grep -v '#' ../debian/patches/series); do
    patch -p1 -i "../debian/patches/${i}"
  done

  # Do not compile binaries (replaced with perl tool by a Debian patch)
  touch src/pm-pmu.o src/pm-reset-swap.o
  touch src/pm-pmu src/pm-reset-swap

  # Regenerate man pages
  rm -v man/on_ac_power.1
  rm -v man/pm-action.8
  rm -v man/pm-is-supported.1
  rm -v man/pm-powersave.8

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var

  make
}

package() {
  cd "${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove deprecated stuff
  rm -v "${pkgdir}/usr/lib/pm-utils/power.d/hal-cd-polling"
  rm -v "${pkgdir}/usr/lib/pm-utils/sleep.d/49bluetooth"

  # Remove stuff specific to RHEL/Fedora
  rm -v "${pkgdir}/usr/lib/pm-utils/sleep.d/01grub"

  # Remove binaries that were replaced by perl scripts
  rm -v "${pkgdir}/usr/lib/pm-utils/bin/pm-reset-swap"
  rm -v "${pkgdir}/usr/lib/pm-utils/bin/pm-pmu"

  # Remove man pages for those binaries
  rm -v "${pkgdir}/usr/share/man/man8/pm-pmu.8"

  # Remove hooks that do not decrease power usage
  rm -v "${pkgdir}/usr/lib/pm-utils/power.d/journal-commit"
  rm -v "${pkgdir}/usr/lib/pm-utils/power.d/readahead"

  # Install non-upstreamed hooks
  install -m755 "${srcdir}/debian/power.d/"* "${pkgdir}/usr/lib/pm-utils/power.d/"

  # nm >=0.8.2 has native udev suspend/resume support
  rm -v "${pkgdir}/usr/lib/pm-utils/sleep.d/55NetworkManager"
  
  # Remove hooks that cause hardware failure or don't make sense at all
  rm -v "${pkgdir}/usr/lib/pm-utils/power.d/"{harddrive,disable_wol}
}
