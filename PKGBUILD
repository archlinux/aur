# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.9.1
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

sha256sums=('2a9a466908190bd65bab047180abb372e30ac1ca06ef2488087d14e36edf1388'
            '802d8a8a1cc056fb724bcb70a490220cc7094b3e96e500c6b9e65acf2f51b592'
            'd201a4815ad8271dac45886a96881c5c3c04b8306e8dae4db4127c00df1e14d8'
            '45cae7d2e9648cc88dc0f289377141112fd4a36ac701ccb6fc7bd497d5e51e70'
            'f9ce390d1494205e502ca9c93457d6d731dcd529745c13f9c4435149cced6e58'
            '886ff7a36d3cf96117a38a82e3caa7267fd5a0be42cdb3bbda55ee2488611b40'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            '685d624c4d8c7c8de7aaf16decc505cb940af6fcb9724cb0419921df296f200d'
            'f01d7d59bebe114f6031f297f78456bef96b7003f55fe7ac48827e1eca7138c1'
            'dafd6b60892989f014fdc80ba29e5b4ed703d7b56b5c2ba40e8786bce9f4dbf2')

# vim:set sts=2 ts=2 sw=2 et:
