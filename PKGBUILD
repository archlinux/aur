# Maintainer: Patrick Stewart <patstew@gmail.com>

pkgname=zammad
pkgver=4.1.0
pkgrel=1
pkgdesc="Zammad is a web-based, open source user support/ticketing solution."
url="https://zammad.org"
arch=('any')
license=('AGPL')

depends=('imlib2' 'elasticsearch' 'rvm' 'shared-mime-info')
optdepends=('postgresql' 'nginx')
source=(
  "https://ftp.zammad.com/zammad-${pkgver}.tar.bz2"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
  "${pkgname}.bashrc"
  "${pkgname}.bash_profile"
)
sha256sums=('382baa445e194b00279e91c0b95b4ac88f240c7460a308024953d336751ad770'
            '071372d0657764b2aaaf78f11e9c072b93e38d833ef8c9302eded9bde57e44a0'
            '9f7c0197d1693ac364417e1cefeb4afd1692835c5dbf2240885cced783f01af8'
            '721ab19a61ecc15c5cec7ed57604a0753e943407827b0961e3dbae05a3138b11'
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
