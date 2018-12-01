# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=buckaroo
pkgver=1.5.0
pkgrel=1
pkgdesc="A C++ package manager"
arch=('any')
url="https://github.com/LoopPerfect/buckaroo"
license=('MIT')
depends=('java-runtime' 'buck')
makedepends=('')

source=("https://github.com/LoopPerfect/${pkgname}/archive/v${pkgver}.tar.gz"
        disable-analytics.patch)
sha256sums=('e8c2bc83b967b49840c370a61c862ef3c63146ef4b4e6de901f9d6abb91025b0'
            '9b8eb3b92afb718b151859379d409b5329bd02e7363cc298c444fd6db35b4478')

prepare() {
  # Make telemetry an opt-in feature by omitting the "analytics"
  # property in the default configuration.
  #
  # If you want to enable it to support the development, add the
  # following property to "~/.buckaroo/buckaroo.json" (this config
  # will be created automatically after the first run):
  #
  #   "analytics": "https://analytics.buckaroo.pm"
  #
  # For more details, see the documentation:
  # https://buckaroo.readthedocs.io/en/latest/installation.html#analytics
  patch -Np1 -i "${srcdir}/disable-analytics.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  buck build :buckaroo-cli
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 buck-out/gen/buckaroo-cli.jar ${pkgdir}/usr/lib/${pkgname}/buckaroo-cli.jar

  mkdir -p ${pkgdir}/usr/bin
  printf "#!/bin/sh\njava -jar /usr/lib/%s/buckaroo-cli.jar \"\$@\"\n" ${pkgname} > "${pkgdir}/usr/bin/buckaroo"
  chmod 755 "${pkgdir}/usr/bin/buckaroo"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
