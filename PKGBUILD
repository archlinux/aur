# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.0.0b2
pkgrel=2
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
sha256sums=('02bb2166fbda06babbcd60e67437ba83f9032c12c41529325e49d0663cb11aa5'
            '2b045e03d2fdce12683ceb9792d491a32f00b256045456412e7bc18c8726218a'
            '4f9d5a4aa7d84e0237a3ba633004c7472d873450c769a666f6dde3b7929f3f88'
            '1d3898b73d896f5dde7c1f7e0461acb733fbe3128d551a4a559d2b2b581ef416'
            '5db15a7df9ac0588a7bc6a081e96a6f48e13afc95f4059bebb09dfa466178d45'
            '5e55efe6a7b9f350bde5cf2b5794658c2eedd0383e06e4fd3b69d49c723724aa'
            'cf9b73a11fc82397b0b24dc5b7a1143de413552fd62d16559c5f7b2f861e7b1d'
            '5564c4cdaed550ddfe05ce74e96448c9232181b4f6fc637c933642eb221461f2'
            '78068b5755323f526acea891a44309639b2cee97eb2cbb2bcedfac4b51055447')

prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  sed -i "s|SLE_11_SP2|SLE_11_SP2 Arch_Core Arch_Extra|" _osc
  cd "${srcdir}/${pkgname}-${pkgver}"

  for patch in "$srcdir"/*.patch; do
    patch -p1 -i $patch
  done

  # Fix version
  sed -e "s/    version = \"%(describe:tags=true)\"/    version = \"$pkgver\"/"  \
      -i osc/util/git_version.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  install -Dm644 contrib/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 contrib/osc.complete "${pkgdir}/usr/lib/osc/complete"
  install -Dm644 ../_osc "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:
