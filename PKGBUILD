# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.10.1
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
sha256sums=('20ee481f7ed9b3355cbdee5f590819b491e9c08992f3f7da0d96ca4495bc68db'
            '9ce6cf5cff4168a1b6df99c9a9684812934872f6da84407f70ec26b65e7c0de0'
            '353f4059fac5a423bfba47763e7b9acb4963131d4be24a6e8b6890e3d311d4ba'
            '157f35d2707b1282f59382727f778aa81f3b7a251dbefcc5b1621b28469079d6'
            '4ce2727df761460ecbc9ff75883c3799ed07f9c123f616b04516139c9eb15f97'
            '03a67b38363e1e51a79db9806f83d2a063a8c90f105939e59684453c56289532'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            'fb647150bc061cea192f0d0616373ffa34ac68643011a2a7a8c3fc282b4d8591'
            'f01d7d59bebe114f6031f297f78456bef96b7003f55fe7ac48827e1eca7138c1'
            'a41248a119a1b952eb47cf9a7127e09974313c0624ad1a1f90c1e3eb112a48b9')


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
