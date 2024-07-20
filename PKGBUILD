# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Patrick Smits <mail@patricksmits.net>

pkgname=yaws
pkgver=2.2.0
pkgrel=1
pkgdesc="Web server for dynamic content"
arch=(x86_64)
url="https://erl${pkgname}.github.io"
license=(BSD-3-Clause)
depends=(erlang-nox pam)
backup=(etc/${pkgname}/${pkgname}.conf)
options=(!emptydirs)
install=${pkgname}.install
source=("https://github.com/klacke/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.service")
sha512sums=('3f703d62739346f815055ee45d0768d6a6a0f7bfbc662fa1eb5563ee37c10e00d608910bb6f4d03676c4fbce7642115596c2d6c0894c9112f269fc2db4d89d20'
            '6bafd099901d4da241094d137191eda7c18ec8ff9d3f9688aa37220db11d7d19ad97ab6fa4e8b57ebf9c7e2f16ac162284332354d4dae61340ddc598933cee0e')

prepare() {
  cd ${pkgname}-${pkgname}-${pkgver}

  # prepare configure and make
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgname}-${pkgver}
  export wwwdir=/srv/http/${pkgname}
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/lib/erlang/lib"
  ln -s /usr/lib/${pkgname} "${pkgdir}/usr/lib/erlang/lib/${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # path fix
  cp -ru examples/include "${pkgdir}/usr/lib/${pkgname}-${pkgver}/examples/"
  mv "${pkgdir}/srv/http/${pkgname}/"* "${pkgdir}/srv/http/www" || true
  rmdir --ignore-fail-on-non-empty "${pkgdir}/srv/http/${pkgname}"
  mv "${pkgdir}/srv/http/www" "${pkgdir}/srv/http/${pkgname}" || true
}

# getver: raw.githubusercontent.com/klacke/yaws/master/vsn.mk
# vim: ts=2 sw=2 et:
