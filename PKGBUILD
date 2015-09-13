# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=plexreport-git
pkgver=r130.7dba8ca
pkgrel=1
pkgdesc='Scripts to generate a weekly email of new additions to Plex.'
arch=('any')
url='https://github.com/bstascavage/plexReport'
license=('custom')
depends=('plex-media-server' 'ruby-bundler' 'ruby-mime-types-1' 'ruby-mail' 'ruby-httparty' 'ruby-highline' 'ruby-multi_xml' 'ruby-i18n')
backup=('etc/plexReport/config.yaml')
install='plexreport.install'
#source=("$pkgname::git+https://github.com/bstascavage/plexReport.git")
source=("$pkgname::git+https://github.com/Sonic-Y3k/plexReport.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  for i in "bin/plexreport" "bin/plexreport-setup" "initial_setup.sh" "lib/mailReport.rb" "update.sh"
  do
    sed "s%/var/lib/plexReport%/var/lib/plex/plexReport%g" -i $i
  done
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm 755 "${pkgdir}"/{etc/plexReport,usr/bin,var/log,var/lib/plex/plexReport}
  install -m 755 bin/{plexreport,plexreport-setup} "${pkgdir}/usr/bin/"
  cp -dr --no-preserve='ownership' lib/* "${pkgdir}/var/lib/plex/plexReport/"
  cp -dr --no-preserve='ownership' etc/* "${pkgdir}/etc/plexReport/"
  touch "${pkgdir}/var/log/plexReport.log"

  chown 421:421 -R "${pkgdir}"/var/lib/plex/plexReport
  chown 421:421 -R "${pkgdir}"/var/log/plexReport.log
  chown 421:421 -R "${pkgdir}"/etc/plexReport
}
