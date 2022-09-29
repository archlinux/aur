# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.2.4
pkgrel=1
pkgdesc='Groovy on rails, a web framework'
url='https://grails.org/'
arch=(any)
license=(Apache)
makedepends=(apache-ant java-environment junit setconf unzip)
optdepends=('grails-docs: documentation for grails'
            'groovy: the groovy programming language')
options=(!emptydirs)
noextract=(${pkgname[1]}-$pkgver.zip)
source=(${pkgname[0]}-$pkgver.zip::https://github.com/grails/grails-core/releases/download/v$pkgver/grails-$pkgver.zip
        ${pkgname[1]}-$pkgver.zip::https://github.com/grails/grails-doc/releases/download/v$pkgver/grails-docs.zip)
b2sums=('d6a1aaba310252d4639a4ceaaba5e908109dd9b18d424045d16f2cc9695daccb2e2aef8c4ca95478a61a81eb3a2516b9a757c63e99dd6963839810e1cd062ae3'
        'cd850d460aecf164bbc1e60626e5f08345302e0f70f00158862f47db0d15a6aac9c165e2db9225225a8d8c7d7ce029021027439ed73deea3a2bf088a7f85fad6')

prepare() {
  cd $pkgbase-$pkgver
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  setconf bin/grails APP_HOME /usr/share/grails
  tail bin/grails
}

package_grails() {
  depends=(bash java-environment junit)

  install -Dm755 $pkgbase.profile "$pkgdir/etc/profile.d/$pkgname.sh"
  cd $pkgbase-$pkgver
  install -d "$pkgdir/usr/share/pixmaps"
  cp -r . "$pkgdir/usr/share/$pkgname"
  install -Dm755 bin/grails "$pkgdir/usr/bin/grails"
  install -Dm644 media/icons/*.png -t "$pkgdir/usr/share/pixmaps"

  # clean up
  cd "$pkgdir/usr/share/$pkgname"
  rm -rf doc INSTALL LICENSE README
  find "${pkgdir}/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'
  install -d "$pkgdir/usr/share/doc" "$pkgdir/usr/share/grails"
  unzip "grails-docs-$pkgver.zip" -d "$pkgdir/usr/share/doc/grails-$pkgver"
  ln -s "/usr/share/doc/grails-$pkgver" "$pkgdir/usr/share/grails/doc"
}
