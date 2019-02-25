# Maintainer  : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=0.164.2
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python2'
         'python2-m2crypto'
         'python2-typing'
         'urlgrabber')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            )
conflicts=('osc-git' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz"
        "_osc")
sha256sums=('b2050735311278c011ff194bf78b389eef469ad918ac02fc5b520d2882b71ad4'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a')

prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  sed -i "s|SLE_11_SP2|SLE_11_SP2 Arch_Core Arch_Extra|" _osc
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  cd "${pkgdir}/usr/bin"
  ln -s osc-wrapper.py osc
  cd -

  install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
  install -Dm644 ../_osc "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:
