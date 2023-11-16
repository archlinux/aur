# Maintainer: Zepman <the*UNDERSCOREHERE*zep*UNDERSCOREHERE*man@hotmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
#
# PKGBUILD generated on: 2023-11-16T11:25:08+00:00

pkgname=lldap-bin
_pkgname=lldap
pkgver=0.5.0
pkgrel=1
pkgdesc='Light LDAP implementation - binary release'
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
_source_bin_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_source_bin_base}/amd64-lldap.tar.gz")
source_aarch64=("${_source_bin_base}/aarch64-lldap.tar.gz")
source_armv7h=("${_source_bin_base}/armhf-lldap.tar.gz")

b2sums=('5b2b2a78d3efbf981fb53b7a41733caf7b3ef138a65d06b0410618e81d68dfba4af26f08efa84d1ae4f98c1442e037b6bb31da7453c391cfe8ac95f83357f3a1'
        '3c1a5d25ecd028b11c42ef92dd4e9763d2817c63157fb9b31e1e6283cd1195063eeb7fb0867362cfd585921c09a1010e3a2c8545e69cd2d304d708d385a2da2c'
        '9d2688aae8e36d56759c407e76816f4d2a450c92fd956b92145fc0ba52902c32283d8a939478e6f866ba6624f1c11a47e243208f3aa11bfb453d5a937be3c914'
        'e491337a2ba4ca68ed6afe3a0779a608f718da4107547276562582bc24b7ab21af724b4026adfe3b845ef9e81284bb54da548b8f48b4b1b1bf8525316f990f82'
        '1caff6be850db02f3dcd8d4ca12a2f18acf40c2900cb2d0866cf3a3c131bda9c9bf5d32a072f250f1d0700ac7dd3e43f05d4d33dd2e5f21c6a983a57e1c5adcc')

b2sums_x86_64=('96d856ede15e1c83e7a94b33e5aa5143d3f7ebab824b4cfb8ba3d1e6804e28282859c56c906cc34fa357b0be67f958d481a31969bd8e6e2e7c74d4b47aa939b4')
b2sums_aarch64=('11bd4f6f13a571f10defa07c3efc2d7b1b1919cffefa0240cc1add90d9fa74d7111599dca1580e84eb5627a80a308ff5ef3139d68e3cff9442939782b467660a')
b2sums_armv7h=('e354d13abfe76cdfbbba34d4c6697cb031eafd04079bde38c4dd521f0b8f0b0f61b9721e1c131f4eb4627476e00e0ef9f5816366a75250bcc74414f7efa2f493')

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
