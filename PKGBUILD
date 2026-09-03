# Maintainer: Fuero <fuerob@gmail.com>

pkgname=fapolicyd
pkgver=2.0.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc='File Access Policy Daemon'
arch=(x86_64)
url='https://github.com/linux-application-whitelisting/fapolicyd'
license=(GPL-3)
backup=("etc/${pkgname}/${pkgname}.conf")
makedepends=(autoconf automake gcc)
depends=(uthash)
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('2db6d2d69c62945a971670b80ac72779609ebad93240de82ca902d01a679ceab')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fv --install
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --without-rpm \
    --with-audit
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -p -m 644 -D init/${pkgname}-tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  echo "d /var/lib/${pkgname} 0700 ${pkgname} ${pkgname} - -" >> "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -dpm 0755 "${pkgdir}/etc/${pkgname}/rules.d"
  install -dpm 0755 "${pkgdir}/etc/${pkgname}/trust.d"
  install -Dpm 0640 <(\
    cat <<<"u ${pkgname} - \"${pkgname} daemon user\" /var/lib/${pkgname} /usr/bin/nologin" \
  ) "${pkgdir}/etc/sysusers.d/${pkgname}.conf"

  cat > ${pkgdir}/usr/share/${pkgname}/sample-rules/21-updaters.rules <<-'EOF'
allow perm=open exe=/usr/bin/pacman : all
allow perm=open exe=/usr/bin/yay : all
EOF

  (
  cd ${pkgdir}
  for i in $(ls usr/share/${pkgname}/sample-rules/*.rules)
  do
    ln -snf "/${i}" "etc/${pkgname}/rules.d/$(basename "${i}")"
  done
  rm -f etc/${pkgname}/rules.d/95-allow-open.rules
  )
  for i in NEWS README.md TODO AUTHORS COPYING ChangeLog
  do
    install -Dp "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"
  done
}

# getver: github.com/linux-application-whitelisting/fapolicyd/releases
# vim: ts=2 sw=2 et:
