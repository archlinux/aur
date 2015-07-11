# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname=chruby
pkgver=0.3.9
pkgrel=1
pkgdesc="Changes the current ruby. Supports both zsh and bash."
arch=(any)
url="https://github.com/postmodern/chruby"
license=('MIT')
depends=('bash')
optdepends=('zsh')
makedepends=('gnupg')
install=${pkgname}.install
source=(https://github.com/postmodern/${pkgname}/archive/v${pkgver}.tar.gz profile.d-chruby.sh)
sha256sums=('7220a96e355b8a613929881c091ca85ec809153988d7d691299e0a16806b42fd'
            '8256f38a8908654c4d75793774cbb85da324d73ce0137c647f43e852e6618b54')


prepare() {
  if gpg --fingerprint 0xB9515E77 >/dev/null 2>&1; then

    #download key
    msg "Downloading package signature"
    curl -L -o  ${pkgname}-${pkgver}.tar.gz.asc https://raw.github.com/postmodern/chruby/master/pkg/${pkgname}-${pkgver}.tar.gz.asc -s

    #check key
    if gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz;then 
      msg "Verification of package was successfull."
    else
      msg "Verification of package failed. Please check yourself with:"
      echo "gpg --verify ${pkgname}-${pkgver}.tar.gz.asc ${srcdir}/v${pkgver}.tar.gz"
    fi

  else

    printf "\n\n"
    msg "Please import the gpg key of the chruby-author, to check package integrity:"
    msg "http://postmodern.github.com/contact.html#pgp"
    printf "\n\n"

  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #profile
  install -D -m644 ${srcdir}/profile.d-chruby.sh ${pkgdir}/etc/profile.d/chruby.sh

  #helper scripts
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/scripts/bug_report.sh ${pkgdir}/usr/share/${pkgname}/bug_report.sh
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/scripts/setup.sh ${pkgdir}/usr/share/${pkgname}/setup.sh

  #license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s /usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  #build
  make PREFIX="${pkgdir}/usr" install >/dev/null

}

# vim:set ts=2 sw=2 et:
