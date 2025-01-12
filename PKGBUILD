# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.11.1
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-cryptography'
         'python-urllib3'
         'python-distro'
         'python-ruamel-yaml')
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
sha256sums=('58d568a571b2182aa697934ca0af7dde645b1f8c69b83b7be5fb8358ea475802'
            '1331821721b5afa1655b2878efdddc25f5fb37c2ade4d4ebbdb9595a3d0bd911'
            'cc29e0faad37cbf79586239eb92aac4bafe21a57126833492999e50f1b56871a'
            'b8711d3fc3dbf16ecf87e3029f58f25ea81f769931f77a6c4e27b960597ab3d9'
            '94db49446d92fd6e8f99619d4c1b53bea9f437d7427710e870ac9be4ce2a9728'
            '7c807791db13a940d3724ba9a81362fe8ebf376ddc6f0d61dce1b9b35371ebe2'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            'c169aeea912c2aa96a1977daed153597af7110d62e3bdb15d4a96237f9215091'
            'f01d7d59bebe114f6031f297f78456bef96b7003f55fe7ac48827e1eca7138c1'
            '77e8ce91b65ed9f3816141354af37ee4f752cc9de793e0818d5777df09151ee6')


prepare() {
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
