# Maintainer  : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=0.179.0
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
sha256sums=('543a9e1a4f2dc722a5228b41a8da92867a35fa52f9701dc213108fa9b35085e8'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a'
            '20a0d510c8b2a30d83e7f37fc1906104ab98045a246dc3f00a53fe28b6adae40'
            'dac1691cbfafff337360cb92b4b1bba5e6913efebdd92d9bd7f24ec90999d4eb'
            'ebe734cdd80fa9f61176ee038199d987cc35bcc52d6bbccd63decd6a0fbe28f8'
            '7da848a75e8cc28e84111630911547ca315cbe3745743fa64f1ab42b43eb1312'
            '20a084566856da11deb2c8b71b4f50b1dd829eb1f759f7b52a131bd5062aa482'
            'ad44984d22119149a2e2a74f8811a55f478cd86fed842c196c74a93bdefbb0f3'
            '2bcbea27b134c590f75b466003f1e48fef295ca521de11f8055a775a69d28cc8')

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
