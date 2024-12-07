# Maintainer: Zepman <the*UNDERSCOREHERE*zep*UNDERSCOREHERE*man@hotmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=lldap-bin
_pkgname=lldap
pkgver=0.6.1
pkgrel=1
pkgdesc='Light LDAP implementation for authentication - binary release'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lldap/lldap'
license=('GPL3')
provides=('lldap')
conflicts=('lldap')
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

b2sums=('d0b27051233939bc944f02a3b9a23910213337161d42d0c4f76f0bcecb5d63029d48668dea70fc8142d9994c5c2f69fc45ace7d4be5114d830fcddcb5d3b3bb2'
        '0460040b0541b4cf388ee4a81adbbfbb331a4fc52d484b7a4f4ba918cb7664e98ef3ae8a21a8eeb92f124f57a0d5a7814004a7d59a4282c22b89c3855b757ce8'
        '9d2688aae8e36d56759c407e76816f4d2a450c92fd956b92145fc0ba52902c32283d8a939478e6f866ba6624f1c11a47e243208f3aa11bfb453d5a937be3c914'
        'e491337a2ba4ca68ed6afe3a0779a608f718da4107547276562582bc24b7ab21af724b4026adfe3b845ef9e81284bb54da548b8f48b4b1b1bf8525316f990f82'
        '1caff6be850db02f3dcd8d4ca12a2f18acf40c2900cb2d0866cf3a3c131bda9c9bf5d32a072f250f1d0700ac7dd3e43f05d4d33dd2e5f21c6a983a57e1c5adcc')

b2sums_x86_64=('51f4eca1adc22e29b7341f9373f5ceda2b8883d216ebee223f35e3ee94af979ec44ba9a560da8568a8d21c468dd1fa70881d27ff9d0791708cc3c8dd43ddbb6e')
b2sums_aarch64=('af4cc2c24d265018e600059da371e2d47b4b37994a1fa33498048209a2902a815e7cc5e8d13769fab58ea451aa77b935690bc283df4a03d76847010b01e0b559')
b2sums_armv7h=('71b8d99d88d3ce866ab45333c5fab122a9c3ebe316a2c1445f543f4e34c3b6573b244d4c1cbdefad716babff9e0018b045f72841c709cb442baf920d4d60f510')

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
