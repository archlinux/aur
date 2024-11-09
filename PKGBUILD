# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.9.2
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-cryptography'
         'python-urllib3'
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
        0009-Add-buildlog-option-to-fetch-buildlog-not-relative-t.patch
       )
sha256sums=('c32bcf47c8a0f23a722fca781959ef2b1f865d0d4ed32be237f3e4444e671864'
            '32084060ed4ccb88199e24b42cc42c91aaa26a84ee1f97096ab4354b43f7c9c0'
            'b70c482a550691008061f1d7c7833b152f5f689840184bbeb1b662b20cc49600'
            'fb92668a337e16bbdc1d466d1afe0dc7186d91f9ee21561714f4d9e19967c1b3'
            '7c446b0d9ee765347787cbcbd0a7f003fb6b28dabd8244747ce5a9d95e06b1ac'
            '4346341c9b3cf17fa53c8c8d937080fff6b35cf414c85f6c4ca36e0aec0b6eb7'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            'aa4da837fcb18540250a634a247bb00c8a284ca35cdfb05e3b265dda019c0f53'
            'f01d7d59bebe114f6031f297f78456bef96b7003f55fe7ac48827e1eca7138c1'
            '2aaf415f42b5987e31f429cfed2309ad86909b5615536319d13e6799618ad898')


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
# vim:set sts=2 ts=2 sw=2 et:
