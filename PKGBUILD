# Maintainer: Zepman <the*UNDERSCOREHERE*zep*UNDERSCOREHERE*man@hotmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=lldap-bin
_pkgname=lldap
pkgver=0.6.3
pkgrel=1
pkgdesc='Light LDAP implementation for authentication - binary release'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lldap/lldap'
license=('GPL3')
provides=('lldap')
conflicts=('lldap')
options=(!strip)
backup=('etc/lldap.toml')
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'config-template.patch'
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
_source_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_source_base}/amd64-lldap.tar.gz")
source_aarch64=("${_source_base}/aarch64-lldap.tar.gz")
source_armv7h=("${_source_base}/armhf-lldap.tar.gz")

b2sums=('4d13b94a13dcf1dd6bb0bf93a08c61039837f7baf186fd81aa7164b850d5ea5dde63ae579951cedebe4c6d7a2a4cfc7bb193114eff99762f603e42fa3003af15'
        '0460040b0541b4cf388ee4a81adbbfbb331a4fc52d484b7a4f4ba918cb7664e98ef3ae8a21a8eeb92f124f57a0d5a7814004a7d59a4282c22b89c3855b757ce8'
        '9d2688aae8e36d56759c407e76816f4d2a450c92fd956b92145fc0ba52902c32283d8a939478e6f866ba6624f1c11a47e243208f3aa11bfb453d5a937be3c914'
        'e491337a2ba4ca68ed6afe3a0779a608f718da4107547276562582bc24b7ab21af724b4026adfe3b845ef9e81284bb54da548b8f48b4b1b1bf8525316f990f82'
        '1caff6be850db02f3dcd8d4ca12a2f18acf40c2900cb2d0866cf3a3c131bda9c9bf5d32a072f250f1d0700ac7dd3e43f05d4d33dd2e5f21c6a983a57e1c5adcc')

b2sums_x86_64=('8fa8a327edb24a5db26e5d1dad4c48b02aa694c028776649e2d1e7bd568c29f39843909d55a005089e109b0b9545ffa7c270196a9b665495fa4b440bfd289db5')
b2sums_aarch64=('235a052d68e99d83cfc759ea6fd30f3c45c91acd9072f1c7f4916010883eae15f27326d7e16947e115459698db25e0efd797f2c150a9a153d5328e95f1f8f5b1')
b2sums_armv7h=('da1bc3e82f1c308992c14db72115983b6cf0a7d5d550352e396aac53424d37a63f36484446433ca814cd5a148da6c3656380e6ae5b561fdfb058a997f4afc549')

prepare() {
  cd lldap-*

  # patch configuration template
  patch -p1 -i "$srcdir/config-template.patch"
}

package() {
  _bindir=$(realpath *-lldap)
  _srcdir=$(realpath lldap-*)

  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

  # binaries
  find ${_bindir} \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -vDm755 -t "$pkgdir/usr/bin/" {} +

  # configuration
  install -vDm640 ${_srcdir}/lldap_config.docker_template.toml "$pkgdir/etc/${_pkgname}.toml"

  # frontend assets
  # TODO consider patching source to point to /usr/share/lldap instead of a local directory?
  install -vdm750 "$pkgdir/var/lib/${_pkgname}"
  install -vDm644 "${_bindir}/app/index.html" "$pkgdir/var/lib/${_pkgname}/app/index.html"
  install -vDm644 -t "$pkgdir/var/lib/${_pkgname}/app/static" ${_bindir}/app/static/*.{css,js,gif}
  install -vDm644 -t "$pkgdir/var/lib/${_pkgname}/app/static/fonts" ${_bindir}/app/static/fonts/*.woff2
  install -vDm644 -t "$pkgdir/var/lib/${_pkgname}/app/pkg" ${_bindir}/app/pkg/*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/${_pkgname}" "${_srcdir}/README.md"
  cp -vr "${_srcdir}/docs" "$pkgdir/usr/share/doc/${_pkgname}"
}
