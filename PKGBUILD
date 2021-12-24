# Maintainer  : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=0.175.0
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-m2crypto'
         'python-distro')
makedepends=('python-setuptools')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            'python-progressbar: progressbar support for operations like uploading and services'
            )
conflicts=('osc-git' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz"
        "_osc"
        0001-Add-sb2install-support-to-osc.patch
        0002-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0003-Support-synchronous-copyproj.patch
        0004-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0005-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0006-Add-architecture-and-scheduler-maps.patch
        0007-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
)
sha256sums=('6802efaf1c1b2c89cc0de856c5754a1aecb045d2193a3a42b7a5775ccdbf70fd'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a'
            '494e71779c7726a064f259780f526ef80b8788d821a5878948f668226ee97329'
            'aab64fd3abfd850b31293da2785112212286cfe837477a28d9f41dab122c0226'
            'e7a79a0b242de7881721f15d9bda7735a9b28f2239dbaa024d57465a7c955782'
            '9df799925551c9ea9194e01ddc6f1a75266ffb4b431a9c51b66ccb8a234de7c8'
            'daf095a9ecfb710e8d85802f84e00c5f38c2aa0aa79518c77587aea7afdc2b8d'
            '8955d3986bd3fbd395b28b5724c323f18fdd5154c1a4fea586029075516a22eb'
            'c5db79451612ac9377eb1fd7a3da0d8bceebf43b17b6bf49e8ea5d00be9ba717')

prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  sed -i "s|SLE_11_SP2|SLE_11_SP2 Arch_Core Arch_Extra|" _osc
  cd "${srcdir}/${pkgname}-${pkgver}"

  for patch in "$srcdir"/*.patch; do
    patch -p1 -i $patch
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  cd "${pkgdir}/usr/bin"
  ln -s osc-wrapper.py osc
  cd -

  install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
  install -Dm644 ../_osc "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:
