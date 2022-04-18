# Maintainer: Patrick Stewart <patstew@gmail.com>

pkgname=zammad
pkgver=5.1.0
pkgrel=1
pkgdesc="Zammad is a web-based, open source user support/ticketing solution."
url="https://zammad.org"
arch=('any')
license=('AGPL')

depends=('imlib2' 'elasticsearch' 'rvm' 'shared-mime-info' 'nodejs')
optdepends=('postgresql' 'nginx')
source=(
  "https://ftp.zammad.com/zammad-${pkgver}.tar.bz2"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
  "${pkgname}.bashrc"
  "${pkgname}.bash_profile"
)
sha256sums=('f2f6884548737bb973c978b7d58bb58501f76c65fe69ba92206cd21cc22476ab'
            '071372d0657764b2aaaf78f11e9c072b93e38d833ef8c9302eded9bde57e44a0'
            '9f7c0197d1693ac364417e1cefeb4afd1692835c5dbf2240885cced783f01af8'
            '2cec6621b7d62d93725b3d8bbc3906c3ebb0226932e4e43e00427559a8a00be6'
            'dab632f2e9fdf9bbf6964c556e2bbe69708f7b8b69b27d6c17a82fc82bc514b2')
options=(!strip)

package() {
# make destination directory
  install -d "${pkgdir}"/opt/${pkgname} 

# Extract files
  bsdtar -C "${pkgdir}"/opt/${pkgname} -x -f "${srcdir}"/zammad-${pkgver}.tar.bz2

  install -D -t "${pkgdir}"/usr/lib/systemd/system -m 644 \
    "${srcdir}"/script/systemd/${pkgname}-websocket.service \
    "${srcdir}"/script/systemd/${pkgname}-rails.service \
    "${srcdir}"/script/systemd/${pkgname}-scheduler.service \
    "${srcdir}"/script/systemd/${pkgname}.service

  install -vDm 644 "${srcdir}"/${pkgname}.sysusers \
    "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf

  install -vDm 644 "${srcdir}"/${pkgname}.tmpfiles \
    "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf

  install -vDm 644 "${srcdir}"/${pkgname}.bashrc \
    "${pkgdir}"/var/lib/${pkgname}/.bashrc

  install -vDm 644 "${srcdir}"/${pkgname}.bash_profile \
    "${pkgdir}"/var/lib/${pkgname}/.bash_profile

  install -Dm 644 -t "${pkgdir}"/etc/zammad/ "${srcdir}"/script/systemd/${pkgname}.env
  sed -i s/bundle/bundle-2.6/ "${srcdir}"/script/systemd/${pkgname}.env
}
