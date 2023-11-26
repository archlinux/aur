# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.5.0
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
        0001-remove-public-route-from-osc.patch
        0002-Add-sb2install-support-to-osc.patch
        0003-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0004-Support-synchronous-copyproj.patch
        0005-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0006-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0007-Add-architecture-and-scheduler-maps.patch
        0008-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
        0009-Fix-hdrmd5-check-of-downloaded-packages-from-DoD-rep.patch
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

sha256sums=('7d3be5b17338f11767441c451c50137356756b51786d0296e751f2fef1c87e27'
            '06cdc1134dcfec28af98b3738189c8794cf898fa2578a7a2947acc3102b16094'
            '1e4a61c7ae267812de89459c715baa66115851d0f213f95f4ac46fe0f67802a3'
            'd5415d2ad620ec8ff9c5ea9b97b78ed76eef4ead4b11892465f6a96a015a03b7'
            'a857b48a3c9d698c8ab347509dafb67cfe201f882a0d90f9738c6386945ca3b6'
            'eba2c169e52fb5b0e722591f67b8c93615610a66acfb5e660a65fc8fb9f0c81c'
            '83219095de865463ce82206b50fc975c4a4de86e5af3415c8f41ed8de9d2ebd1'
            'eae5f978b8385db3acae46df96fc4973f306c4a640389165a8ac54469d370e5b'
            'd2ba1b665101e28673c65912b7bc9095dbdc02049fb8c8d83f1809a441132d8f'
            '67c916cd7ba9dcd4899477c223c79f7087c0a0077d33f95ccb465b790e052547')

# vim:set sts=2 ts=2 sw=2 et:
