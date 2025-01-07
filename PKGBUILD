# Maintainer: William Turner <willtur.will@gmail.com>

_pkgname=redsocks
pkgname="${_pkgname}2"
pkgver=0.71
pkgrel=1
pkgdesc='Transparent redirector of any TCP/UDP connection to proxy.'
arch=('i686' 'x86_64')
url='https://github.com/semigodking/redsocks'
license=('Apache-2.0')
depends=('libevent>=2'
         'openssl')
makedepends=('git')
conflicts=('redsocks')
backup=('etc/conf.d/redsocks2'
        'etc/redsocks2.conf')
source=("git+https://github.com/semigodking/redsocks.git#tag=release-${pkgver}"
        '0001-fix-default-config.patch'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('3f3033b2ec8552738651c3ae335840994be18eb0ffeb9b4fa683ca7165c23983'
            '239191674e58ed4f75b49a1154dc3cf0f8c6781654b09ae6cd367817f2491e26'
            '0cd97898c7f6aa5463ac5861f414a2008f72df7683f6c5752251e52b5def1868'
            'd718986950ba72babd8c23ca19b5b1e0a63d0416b363c18c7f55d4f3d42db983')

prepare() {
  cd "${_pkgname}"

  patch -N -p1 -i "${srcdir}/0001-fix-default-config.patch"
}

build() {
  cd "${_pkgname}"

  make ENABLE_HTTPS_PROXY=true DISABLE_SHADOWSOCKS=true
}

package() {
  install -D -m0755 "${_pkgname}/redsocks2" "${pkgdir}/usr/bin/redsocks2"

  install -D -m0644 "${_pkgname}/redsocks2.service" "${pkgdir}/usr/lib/systemd/system/redsocks2.service"
  install -D -m0644 "${_pkgname}/redsocks.conf.example" "${pkgdir}/etc/redsocks2.conf"

  install -d -m0755 "${pkgdir}/etc/conf.d"
  echo 'REDSOCKS_CONF=/etc/redsocks2.conf' > "${pkgdir}/etc/conf.d/redsocks2"

  install -D -m0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m0644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -D -m0644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
