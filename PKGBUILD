# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>

_name=Pound
pkgname=pound
pkgver=3.0.2
pkgrel=3
pkgdesc="A reverse proxy, load balancer, and SSL wrapper"
arch=(x86_64)
url="https://www.apsis.ch/pound.html"
license=(GPL3)
depends=(gcc-libs glibc libyaml nanomsg pcre2)
makedepends=(cmake gperftools mbedtls uthash)
backup=("etc/${pkgname}/${pkgname}.yaml")
source=("http://www.apsis.ch/${pkgname}/${_name}-${pkgver}.tgz"
        "${_name}-${pkgver}.tgz.asc::http://www.apsis.ch/${pkgname}/${_name}-${pkgver}.asc"
        "${pkgname}-3.0-runtime_dir.patch"
        "${pkgname}.service"
        "${pkgname}.yaml")
sha512sums=('4c96a93df2b340049778ed7782377e521fbdd7b6ccaa157748b05941ac7a825b2688f37f3081a7e577b2fa1ec4f64d68a25d27af2210f59da5be0dc10d1391e9'
            'SKIP'
            '25db5c13750c2770ae5a91d850f2f00e888474a05b2464c6f03ebe4dc628c86edf8df640daa96e9dcb7240de43537a731671376f20e0dfb599ef5fc2eaf6c053'
            '887ebace94fb6974b34e096c3f9d85e7e45186f816f8a0b4218ffecf2bf041702bc5d40547ca5883691e1d5f959e28b8ce3aac0f12c877760c0e80d8319f57e9'
            '329fb0064f9720cc41332894d3e96e098ffd789d13bcb3b35d67dd9f7b4c0667d1b4cf1d93df9427b4e867d5f0b5857be412ae8d34abed5aa3c2774a499b3292')
b2sums=('0e3f2dc69771a1d1f3de00a721f02cdc4ff31f4d17ab81f64c368668f03c0c1f12484e2d40e7c1d2d203b033488f2bad57cafd8da5022dfe680a09cdc6b73bec'
        'SKIP'
        'eba66845b02eff8cea9353f1617f9fcbce040609ea22a1061d98a69c109fed1aaaf6fb338cde1c969153df383def7ae5e3231f281140d32702acfb8c628fa0e4'
        '886e7218d0098f86edfde32b0d8ccdf47f7a8d6a3417144bbd9279cac14d51065fe72b312844ff6a24be6d16183a3b4a44b0d012c1d08808d07ea96d660ff69f'
        'a7ebb7714abf8bc7c2c0f627f6fdcc226a293277a98455bd52340536754ef3a5aef75340b8535402c78a9a754f78d4793c1d7b0c15b0b8d393fd3760a6398858')
validpgpkeys=('8BB562A0F1DB703FB7EB1E95AB72C62A8691DD02') # Robert Segall <roseg@apsis.ch>

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  # set runtime dir to /run/pound
  patch -Np1 -i "../${pkgname}-3.0-runtime_dir.patch"
  # remove vendored uthash so we build with the packaged version
  rm -v include/ut{hash,array}.h
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=(libmbedtls.so libmbedcrypto.so libmbedx509.so
  libtcmalloc.so)

  cd "${pkgname}-${pkgver}"
  # cmake setup has no install target :(
  install -vDm 755 build/"${pkgname}" -t "${pkgdir}/usr/bin/"
  # configuration
  install -vDm 644 "../${pkgname}.yaml" -t "${pkgdir}/etc/${pkgname}/"
  # systemd service
  install -vDm 644 "../${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system/"
  # man page
  install -vDm 644 man/${pkgname}.8 -t "${pkgdir}/usr/share/man/man8/"
  # docs
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
