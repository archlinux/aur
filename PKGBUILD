# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.6.1
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-cryptography'
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
        0001-Add-sb2install-support-to-osc.patch
        0002-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0003-Support-synchronous-copyproj.patch
        0004-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0005-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0006-Add-architecture-and-scheduler-maps.patch
        0007-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
        0008-Fix-hdrmd5-check-of-downloaded-packages-from-DoD-rep.patch
       )


prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
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
  install -Dm755 contrib/osc.zsh "${pkgdir}/usr/share/zsh/functions/Completion/_osc"

}

sha256sums=('da8d0317271335c91780ed397fd61b8d4bafff0e4e8b41f6bf88441e87c78bc8'
            '878e66de3e15f3f070c63002990315dc6e54e1e864c85eead81c386453aeb24a'
            '241e0f71d51cef7a53dd9024f725527164f002d0b9370385c3bc3e1d69a8f8ce'
            'd0286a035fc4facc5a380f2523ab5a01106c903a3039fcf09cb9958c63137f5d'
            '50f1955fc3080752abb94da9986ce676b7a6ace7016e4dc3380e825b95e45891'
            '8e7fda9dca156604a48e918becaafe7f7f425cfd5ec7cc2e2de2d5aa73924ee0'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            '73f4ae53567671c5c5bd3a524abfe1b8195e654726963c2e86fa56d5f0a125df'
            '56b8e020440fdffcf5e9ee14b5d59a7309abbc708862c2e903ef2275c57cf401')

# vim:set sts=2 ts=2 sw=2 et:
